//
//  Details.swift
//  AnMoApp
//
//  Created by Ahmed Salah on 26/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct Details: View {
    let anime: Anime

    var body: some View {
        ScrollView {
            VStack {
                ZStack{
                    ProgressView()
                    AnimatedImage(url: URL(string: anime.imgCover))
                        .resizable()
                        .frame(width: 250, height: 150)
                        .cornerRadius(10)
                        .padding()
                }
                
                Text(anime.name)
                    .font(.title)
                    .padding()

                Text(anime.des)
                    .foregroundColor(.gray)
                    .padding()

                Divider()

                VStack{
                    Text("Episodes")
                        .font(.headline)
                        .padding(.bottom)

                    ForEach(anime.episodes.indices, id: \.self) { index in
                        Button(action: {
                            let url = URL(string: anime.episodes[index].videoURL)!
                            let player = AVPlayer(url: url)
                            let playerViewController = AVPlayerViewController()
                            playerViewController.player = player
                            UIApplication.shared.windows.first?.rootViewController?.present(playerViewController, animated: true, completion: {
                                player.play()
                            })
                        }) {
                            Text("Episode \(anime.episodes[index].episodeNumber)")
                               
                        }
                        .frame(width: 100,height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.bottom, 5)
                    }
                }
                .padding()
            }
        }
    }
}




// image cover : https://j.top4top.io/p_3067u2i3j1.jpg
// image : https://k.top4top.io/p_30671j54y2.jpeg
// video : https://pullzonetaher.b-cdn.net/stream/044/One%20Piece%20Film%20Red%20720p.mp4
