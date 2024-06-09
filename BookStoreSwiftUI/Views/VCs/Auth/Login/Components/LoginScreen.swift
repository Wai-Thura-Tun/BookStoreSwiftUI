//
//  LoginScreen.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 02/06/2024.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var vm: LoginVM
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
            
            VStack(alignment: .center, spacing: 25) {
                VStack(alignment: .leading, spacing: 10) {
                    TextField("Username", text: $vm.userNameValue)
                        .frame(height: 50)
                        .keyboardType(.default)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    
                                }
                            }
                        }
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray,lineWidth: 1)
                                .opacity(0.4)
                        }
                    
                    if !vm.usernameError.isEmpty {
                        Text(vm.usernameError)
                            .foregroundStyle(.red)
                    }
                }
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    SecureField("Password", text: $vm.passwordValue)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray,lineWidth: 1)
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
                Button(action: vm.login, label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                })
                .buttonStyle(BorderedProminentButtonStyle())
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .disabled(vm.isLoginBtnDisabled)
                Button(action: vm.goToSignUp, label: {
                    Text("Don't have an account? SignUp")
                })
            }
            Spacer()
        }
        .frame(maxWidth: .infinity,  alignment: .leading)
    }
}

#Preview {
    LoginScreen(vm: .init())
}
