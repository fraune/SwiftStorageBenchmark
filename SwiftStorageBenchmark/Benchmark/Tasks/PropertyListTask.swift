//
//  PropertyListTask.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/25/24.
//

import Foundation

class PropertyListTask: ObservableObject {
    var timer: Date?
    
    var writeTime: Double?
    
    var readTime: Double?
    
    func runScalar(count: Int) {}
    
    func runList() {}
    
    func runDict() {}
}
