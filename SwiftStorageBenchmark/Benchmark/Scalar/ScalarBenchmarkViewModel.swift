//
//  ScalarBenchmarkViewModel.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/25/24.
//

import Foundation

class ScalarBenchmarkViewModel: ObservableObject {
    @Published var scalarType = ScalarType.int
    @Published var operations: Int? = 100000
    @Published var isRunning = false
    
    let taskUserDefaults = UserDefaultsTask()
    let taskPropertyList = PropertyListTask()
    let taskSecureStorage = SecureStorageTask()
    let taskCoreData = CoreDataTask()
    
    private var timer: Timer?
    @Published var timeInSeconds: Double = 0.0
    
    var actionButtonTitle: String {
        isRunning ? "Cancel" : "Run"
    }
    
    func actionTapped() {
        if isRunning {
            cancelBenchmark()
        } else {
            startBenchmark()
        }
    }
    
    private func cancelBenchmark() {
        isRunning = false
        stopTimer()
        timeInSeconds = 0
    }
    
    private func startBenchmark() {
        guard let operations = operations else {
            return
        }
        
        isRunning = true
        let th = TimerHelper()
        restartTimer()
        th.startTimer()
        
        taskUserDefaults.runScalar(count: operations)
        taskPropertyList.runScalar(count: operations)
        taskSecureStorage.runScalar(count: operations)
        taskCoreData.runScalar(count: operations)
        
        stopTimer()
        timeInSeconds = th.endTimer()
        isRunning = false
    }
    
    private func restartTimer() {
        stopTimer()
        timeInSeconds = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.timeInSeconds += 0.01
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
}
