//
//  PlaySongViewController.swift
//  SearchAPI
//
//  Created by Sose Yeritsyan on 7/24/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation

class PlaySongViewController: UIViewController {
    
    var song = Song()
    var player: AVPlayer?
    @IBOutlet weak var artistName:UILabel!
    @IBOutlet weak var songName:UILabel!
    @IBOutlet weak var songGenre:UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var playButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        artistName.text = song.artistName
        songName.text = song.trackName
        songGenre.text = song.primaryGenreName
        artistImageView.sd_setImage(with: URL(string: song.imageURL), placeholderImage: UIImage(named: "country.png"))
        
    }
    
    @IBAction func playButtonClick(_ sender: UIButton) {
        let url = URL(string: song.songURL )
        let playerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)

        player?.play()

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
