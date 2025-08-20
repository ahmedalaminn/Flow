//
//  ContentView.swift
//  Flow
//
//  Created by Ahmed Alamin on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Flow")
        Text("Work smarter.")
        NavigationStack {
            NavButtonView(title: "Pomodoro Timer", color: .green, destination: PomodoroView());
            NavButtonView(title: "Habits", color: .yellow, destination: HabitView());
            NavButtonView(title: "To Do", color: .blue, destination: ToDoView());
        }
    }
}

#Preview {
    ContentView()
}


// ADD A FEEDBACK FORM AFTER IMPLEMENTING AUTHENTICATION
