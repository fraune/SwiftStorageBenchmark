//
//  ScalarBenchmarkViewModel.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/25/24.
//

import Foundation

class ScalarBenchmarkViewModel: ObservableObject {
    @Published var scalarType = ScalarType.int
    @Published var operations: Int?
    @Published var isRunning = false
    
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
    }
    
    private func startBenchmark() {
        isRunning = true
    }
}
