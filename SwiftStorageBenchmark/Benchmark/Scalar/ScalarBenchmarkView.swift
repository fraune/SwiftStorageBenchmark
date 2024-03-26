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
                    VStack(alignment: .trailing) {
                        Text("Write: \(String(format: "%.2f", viewModel.taskUserDefaults.writeTime ?? 0))")
                        Text("Read: \(String(format: "%.2f", viewModel.taskUserDefaults.readTime ?? 0))")
                    }
                }
                HStack {
                    Text("Property list")
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Write: \(String(format: "%.2f", viewModel.taskPropertyList.writeTime ?? 0))")
                        Text("Read: \(String(format: "%.2f", viewModel.taskPropertyList.readTime ?? 0))")
                    }
                }
                HStack {
                    Text("Secure storage")
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Write: \(String(format: "%.2f", viewModel.taskSecureStorage.writeTime ?? 0))")
                        Text("Read: \(String(format: "%.2f", viewModel.taskSecureStorage.readTime ?? 0))")
                    }
                }
                HStack {
                    Text("Core Data")
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Write: \(String(format: "%.2f", viewModel.taskCoreData.writeTime ?? 0))")
                        Text("Read: \(String(format: "%.2f", viewModel.taskCoreData.readTime ?? 0))")
                    }
                }
            }
            Section("Benchmark") {
                Button(viewModel.actionButtonTitle) {
                    viewModel.actionTapped()
                }
                HStack {
                    Text("Total time (seconds):")
                    Spacer()
                    Text(String(format: "%.2f", viewModel.timeInSeconds))
                }
            }
        }
    }
}

#Preview {
    ScalarBenchmarkView()
}
