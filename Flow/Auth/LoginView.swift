//
// LoginView.swift
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
import Combine

private enum FocusableField: Hashable {
  case email
  case password
}

struct LoginView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  @Environment(\.dismiss) var dismiss

  @FocusState private var focus: FocusableField?

  private func signInWithEmailPassword() {
    Task {
      if await viewModel.signInWithEmailPassword() == true {
        dismiss()
      }
    }
  }

  var body: some View {
    VStack(spacing: 20) {
      Text("Login")
        .font(.largeTitle)
        .fontWeight(.bold)

      VStack(spacing: 15) {
        TextField("Email", text: $viewModel.email)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
          .focused($focus, equals: .email)
          .submitLabel(.next)
          .onSubmit {
            self.focus = .password
          }
          .textFieldStyle(RoundedBorderTextFieldStyle())

        SecureField("Password", text: $viewModel.password)
          .focused($focus, equals: .password)
          .submitLabel(.go)
          .onSubmit {
            signInWithEmailPassword()
          }
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }

      if !viewModel.errorMessage.isEmpty {
        Text(viewModel.errorMessage)
          .foregroundColor(.red)
          .font(.caption)
      }

      Button(action: signInWithEmailPassword) {
        if viewModel.authenticationState != .authenticating {
          Text("Login")
            .frame(maxWidth: .infinity)
            .padding()
        }
        else {
          ProgressView()
            .frame(maxWidth: .infinity)
            .padding()
        }
      }
      .disabled(!viewModel.isValid)
      .buttonStyle(.borderedProminent)

      Button("Don't have an account yet?") {
        viewModel.switchFlow()
      }
      .foregroundColor(.blue)

    }
    .padding()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LoginView()
      LoginView()
        .preferredColorScheme(.dark)
    }
    .environmentObject(AuthenticationViewModel())
  }
}
