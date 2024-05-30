//
//  AnimeObserver.swift
//  AnMoApp
//
//  Created by Ahmed Salah on 26/05/2024.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI
import FirebaseStorage

class AnimeObserver: ObservableObject {
    @Published var animes = [Anime]()

    private var db = Firestore.firestore()

    init() {
        fetchAnimeData()
    }

    func fetchAnimeData() {
        db.collection("anime").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching anime data: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("No anime documents found")
                return
            }

            for document in documents {
                let data = document.data()
                let id = document.documentID
                let name = data["name"] as? String ?? ""
                let description = data["des"] as? String ?? ""
                let image = data["img"] as? String ?? ""
                let imgCover = data["imgCover"] as? String ?? ""
                var episodes = [AnimeEpisode]()

                if let episodesData = data["episodes"] as? [[String: Any]] {
                    for episodeData in episodesData {
                        let episodeNumber = episodeData["episodeNumber"] as? Int ?? 0
                        let videoURL = episodeData["videoURL"] as? String ?? ""
                        episodes.append(AnimeEpisode(episodeNumber: episodeNumber, videoURL: videoURL))
                    }
                }

                let anime = Anime(id: id, name: name, des: description, img: image, imgCover: imgCover, episodes: episodes)
                self.animes.append(anime)
            }
        }
    }
}
