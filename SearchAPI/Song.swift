//
//  Song.swift
//  SearchAPI
//
//  Created by Sose Yeritsyan on 7/15/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import Foundation
class Song {
  
    let artistName: String
    let imageURL: String
    let primaryGenreName: String
    let trackName: String
    let songURL:String

    init() {
        artistName = String()
        imageURL = String()
        primaryGenreName = String()
        trackName = String()
        songURL = String()
    }
    
    init(artist: String, image: String, genreName: String, track: String, song: String) {
        artistName = artist
        imageURL = image
        primaryGenreName = genreName
        trackName = track
        songURL = song
    }
    
    init(json: [String: Any]) {
        let artist = json["artistName"] as? String
        let image = json["artworkUrl100"] as? String
        let primaryGenre = json["primaryGenreName"] as? String
        let track = json["trackName"] as? String
        let song = json["previewUrl"] as? String
        
        
        artistName = artist!
        imageURL = image!
        primaryGenreName = primaryGenre!
        trackName = track!
        songURL = song!
        
    }
}
