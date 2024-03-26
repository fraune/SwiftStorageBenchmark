//
//  ScalarBenchmarkView.swift
//  SwiftStorageBenchmark
//
//  Created by Brandon Fraune on 3/25/24.
//

import SwiftUI

struct ScalarBenchmarkView: View {
    @StateObject private var viewModel = ScalarBenchmarkViewModel()
    
    var body: some View {
        Form {
            Section("Configuration") {
                Picker("Data Type", selection: $viewModel.scalarType) {
                    ForEach(ScalarType.allCases, id: \.self) {
                        Text("\($0)")
                    }
                }
                TextField("# of Write/Read operations to perform", value: $viewModel.operations, format: .number)
            }
            Section("Storage Metrics") {
                HStack {
                    Text("UserDefaults")
                    Spacer()
                    VStack {
                        Text("Write: --:--.--")
                        Text("Read: --:--.--")
                    }
                }
                HStack {
                    Text("Property list")
                    Spacer()
                    VStack {
                        Text("Write: --:--.--")
                        Text("Read: --:--.--")
                    }
                }
                HStack {
                    Text("Secure storage")
                    Spacer()
                    VStack {
                        Text("Write: --:--.--")
                        Text("Read: --:--.--")
                    }
                }
                HStack {
                    Text("Core Data")
                    Spacer()
                    VStack {
                        Text("Write: --:--.--")
                        Text("Read: --:--.--")
                    }
                }
            }
            Section("Benchmark") {
                Button(viewModel.actionButtonTitle) {
                    viewModel.actionTapped()
                }
                HStack {
                    Text("Total time:")
                    Spacer()
                    Text("--")
                }
            }
        }
    }
}

#Preview {
    ScalarBenchmarkView()
}
