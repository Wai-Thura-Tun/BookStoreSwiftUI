//
//  SignUpScreen.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 05/06/2024.
//

import SwiftUI

struct SignUpScreen: View {
    
    @ObservedObject var vm: SignUpVM
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("SignUp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Username", text: $vm.userNameValue)
                            .frame(height: 50)
                            .keyboardType(.default)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1.0)
                                    .opacity(0.4)
                            }
                        if !vm.userNameError.isEmpty {
                            Text(vm.userNameError)
                                .foregroundStyle(.red)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Email", text: $vm.emailValue)
                            .frame(height: 50)
                            .keyboardType(.default)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1.0)
                                    .opacity(0.4)
                            }
                        if !vm.emailError.isEmpty {
                            Text(vm.emailError)
                                .foregroundStyle(.red)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Phone", text: $vm.phoneValue)
                            .frame(height: 50)
                            .keyboardType(.default)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1.0)
                                    .opacity(0.4)
                            }
                        if !vm.phoneError.isEmpty {
                            Text(vm.phoneError)
                                .foregroundStyle(.red)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        SecureField("Password", text: $vm.passwordValue)
                            .frame(height: 50)
                            .keyboardType(.default)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1.0)
                                    .opacity(0.4)
                            }
                        if !vm.passwordError.isEmpty {
                            Text(vm.passwordError)
                                .foregroundStyle(.red)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                VStack(alignment: .center, spacing: 35) {
                    Button(action: vm.signUp, label: {
                        Text("SignUp")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                    })
                    .buttonStyle(BorderedProminentButtonStyle())
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    Button(action: vm.goToLogin, label: {
                        Text("Already have an account? Login")
                    })
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SignUpScreen(vm: .init(delegate: nil))
}
