//
//  AnimeEpisode.swift
//  AnMoApp
//
//  Created by Ahmed Salah on 26/05/2024.
//

import Foundation
import SwiftUI

struct AnimeEpisode {
    var episodeNumber: Int
    var videoURL: String
}

struct Anime: Identifiable {
    var id: String
    var name: String
    var des: String
    var img: String
    var imgCover : String
    var episodes: [AnimeEpisode]
}



