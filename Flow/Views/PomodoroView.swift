//
//  PomodoroView.swift
//  Flow
//
//  Created by Ahmed Alamin on 7/28/25.
//

import SwiftUI

struct PomodoroView: View {
    @State private var timeRemaining = 25 * 60
    @State private var timerRunning = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Pomodoro Timer")
                .font(.largeTitle)
                .bold()

            Text(timeString(timeRemaining))
                .font(.system(size: 72, weight: .bold, design: .monospaced))
                .padding()

            HStack(spacing: 40) {
                Button(timerRunning ? "Pause" : "Start") {
                    timerRunning ? pauseTimer() : startTimer()
                }
                .buttonStyle(.borderedProminent)

                Button("Reset") {
                    resetTimer()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .onDisappear {
            pauseTimer()
        }
    }

    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                pauseTimer()
            }
        }
    }

    func pauseTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil
    }

    func resetTimer() {
        pauseTimer()
        timeRemaining = 25 * 60
    }

    func timeString(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
