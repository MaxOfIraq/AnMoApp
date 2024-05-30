//
//  ContentView.swift
//  AnMoApp
//
//  Created by Ahmed Salah on 26/05/2024.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var obser = AnimeObserver()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(filteredAnimes) { anime in
                    NavigationLink(destination: Details(anime: anime)) {
                        AnimeRow(anime: anime)
                    }
                }
                .navigationBarTitle("Anime")
            }
        }
    }

    var filteredAnimes: [Anime] {
        if searchText.isEmpty {
            return obser.animes
        } else {
            return obser.animes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct AnimeRow: View {
    var anime: Anime
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                ProgressView()
                AnimatedImage(url: URL(string: anime.img))
                    .resizable()
                    .frame(width: 70,height: 90)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(anime.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(anime.des)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 10)
        }
        .padding(.top, 8)
    }
}


#Preview {
    ContentView()
}
