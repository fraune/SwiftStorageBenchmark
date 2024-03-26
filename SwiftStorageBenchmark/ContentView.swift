//
//  ContentView.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Benchmarking Data Storage")
                .font(.title)
            Form {
                NavigationLink("Scalar", destination: { ScalarBenchmarkView() })
                NavigationLink("List", destination: { EmptyView() })
                NavigationLink("Dict", destination: { EmptyView() })
            }
        }
    }
}

#Preview {
    ContentView()
}
