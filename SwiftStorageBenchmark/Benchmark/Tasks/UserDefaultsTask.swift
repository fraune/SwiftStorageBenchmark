//
//  UserDefaultsTask.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/25/24.
//

import Foundation

class UserDefaultsTask: ObservableObject {
    var timer: Date?
    
    @Published var writeTime: Double?
    
    @Published var readTime: Double?
    
    func runScalar(count: Int) {
        let th = TimerHelper()
        th.startTimer()
        // writes
        for i in 0..<count {
            print("write: \(i)")
            UserDefaults.standard.set(i, forKey: "asdf\(i)")
        }
        writeTime = th.endTimer()
        
        th.startTimer()
        // reads
        for i in 0..<count {
            print("read: \(UserDefaults.standard.integer(forKey: "asdf\(i)"))")
        }
        readTime = th.endTimer()
    }
    
    func runList() {}
    
    func runDict() {}
}
