//
//  BookListScreen.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 07/06/2024.
//

import SwiftUI

struct BookListScreen: View {
    
    @ObservedObject var vm: BookListVM
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("demo-user", bundle: nil)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 2)
                    }
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            Text("Welcome back, Bunny!")
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            Text("""
                What do you want to
                read today?
                """)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 1)
            .padding(.horizontal, 20)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .frame(width: 20, height: 20)
                    .padding(.leading, 20)
                TextField("Seach...", text: $vm.searchString)
                Image(systemName: "mic.fill")
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 45)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.clear, lineWidth: 1)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(0.3)
            }
            .padding(.horizontal, 20)
        }
        ScrollView {
            
        }
        .background(.yellow)
    }
}

#Preview {
    BookListScreen(vm: .init(delegate: nil))
}
