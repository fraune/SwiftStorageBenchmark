//
//  TimerHelper.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/26/24.
//

import Foundation

class TimerHelper {
    var timer: Date? = nil

    func startTimer() {
        timer = Date()
    }
    
    func endTimer() -> Double {
        let endTime = Date()

        guard let startTime = timer else {
            return -1
        }
        let elapsedTime = endTime.timeIntervalSince(startTime)
        
        return elapsedTime
    }
}
