//
//  NavButtonView.swift
//  Flow
//
//  Created by Ahmed Alamin on 7/28/25.
//
import SwiftUI

struct NavButtonView<Destination: View>: View {
    let title: String
    let color: Color
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: 300)
                .background(color)
                .cornerRadius(10)
                .shadow(color: color.opacity(0.75), radius: 15)
        }
    }
}
