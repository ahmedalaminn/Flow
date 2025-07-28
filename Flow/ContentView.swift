//
//  ContentView.swift
//  Flow
//
//  Created by Ahmed Alamin on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavButtonView(title: "Pomodoro Timer", color: .green, destination: PomodoroView())
        }
    }
}

#Preview {
    ContentView()
}
