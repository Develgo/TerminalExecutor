//
//  ContentView.swift
//  TerminalExecutor
//
//  Created by Nitesh Maharaj on 2025/04/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Run Terminal Command") {
                self.runTerminalCommand()
            }
        }
        .padding()
    }
    
    private func runTerminalCommand() {
        let command = "/bin/ls -l" // replace with any command
        let task = Process()
        
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")
        
        task.arguments = ["-c", command]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? ""
        print(output)
    }
}

#Preview {
    ContentView()
}
