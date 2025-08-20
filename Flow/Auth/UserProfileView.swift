//
// UserProfileView.swift
// Favourites
//
// Created by Peter Friese on 08.07.2022
// Modified by Ahmed Alamin
// Copyright © 2022 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import SwiftUI

struct UserProfileView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  @Environment(\.dismiss) var dismiss
  @State var presentingConfirmationDialog = false

  private func deleteAccount() {
    Task {
      if await viewModel.deleteAccount() == true {
        dismiss()
      }
    }
  }

  private func signOut() {
    viewModel.signOut()
  }

  var body: some View {
    VStack(spacing: 20) {
      Text("Profile")
        .font(.largeTitle)
        .fontWeight(.bold)
      
      Text("Email: \(viewModel.displayName)")
        .font(.body)
      
      Spacer()
      
      Button("Sign Out") {
        signOut()
      }
      .buttonStyle(.borderedProminent)
      
      Button("Delete Account") {
        presentingConfirmationDialog.toggle()
      }
      .buttonStyle(.bordered)
      .foregroundColor(.red)
      
    }
    .padding()
    .confirmationDialog("Delete your account permanently?",
                        isPresented: $presentingConfirmationDialog, titleVisibility: .visible) {
      Button("Delete Account", role: .destructive, action: deleteAccount)
      Button("Cancel", role: .cancel, action: { })
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      UserProfileView()
        .environmentObject(AuthenticationViewModel())
    }
  }
}
