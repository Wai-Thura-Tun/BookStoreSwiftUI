//
//  BookListScreen.swift
//  BookStoreSwiftUI
//
//  Created by Wai Thura Tun on 07/06/2024.
//

import SwiftUI
import Kingfisher

struct BookListScreen: View {
    
    @ObservedObject var vm: BookListVM
    
    let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
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
                    
                    VStack {
                        Text("Welcome back, Bunny!")
                            .foregroundStyle(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("""
                            What do you want to
                            read today?
                            """)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 1)
                        
                        ZStack {
                            Color.gray
                                .cornerRadius(10)
                                .opacity(0.4)
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
                            .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 45)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
                ScrollView {
                    ForEach(vm.data) { item in
                        let book = item as? SpecialBookVO
                        if let book = book, let type = book.type {
                            if type == CellType.BANNER.rawValue {
                                bannerView(for: book)
                            }
                            else if type == CellType.CAROUSEL.rawValue {
                                carouselView(for: book)
                            }
                            else if type == CellType.GRID.rawValue {
                                gridView(for: book)
                            }
                        }
                        
                        if let normal = item as? BookVO {
                            normalView(for: normal)
                        }
                    }
                    
                    
                }
                .padding(0)
                .frame(maxWidth: .infinity)
            }
            
            if vm.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
        }
    }
    
    @ViewBuilder
    private func carouselView(for item: SpecialBookVO) -> some View {
        VStack(spacing: 15) {
            Text(item.title ?? "")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(item.books) { cItem in
                        VStack(alignment: .leading, spacing: 5) {
                            KFImage(URL(string: cItem.bookCover ?? "")!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 249.6)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(.trailing, 15)
                            Text(cItem.name ?? "")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(width: 160, alignment: .leading)
                                Text(cItem.author?.name ?? "")
                                .frame(width: 160, alignment: .leading)
                        }
                }
            }
            .padding(.leading, 20)
        }
        }
    }
    
    @ViewBuilder
    private func bannerView(for item: SpecialBookVO) -> some View {
        VStack(spacing: 15) {
            Text(item.title ?? "")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(item.books) { bItem in
                        KFImage(URL(string: bItem.bookCover ?? "")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 181)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.trailing, 15)
                    }
                }
                .padding(.leading, 20)
            }
        }
    }
    
    @ViewBuilder
    private func gridView(for item: SpecialBookVO) -> some View {
        VStack(spacing: 15) {
            Text(item.title ?? "")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(item.books) { gItem in
                    KFImage(URL(string: gItem.bookCover ?? "")!)
                        .resizable()
                        .frame(height: 268.32)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    private func normalView(for item: BookVO) -> some View {
        ZStack(alignment: .leading) {
            KFImage(URL(string: item.bookCover ?? "")!)
                .resizable()
                .frame(height: 577)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Color.gray
                .opacity(0.4)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading, spacing: 10){
                Spacer()
                Text(item.name ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                Text(item.author?.name ?? "")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

#Preview {
    BookListScreen(vm: .init(delegate: nil))
}
