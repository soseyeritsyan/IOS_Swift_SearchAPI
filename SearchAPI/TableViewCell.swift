//
//  TableViewCell.swift
//  SearchAPI
//
//  Created by Sose Yeritsyan on 7/16/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var artsistImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var track: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(song: Song) {
        name.text = song.artistName
        genre.text = song.primaryGenreName
        track.text = song.trackName
        artsistImage.sd_setImage(with: URL(string: song.imageURL), placeholderImage: UIImage(named: "country.png"))
    }
    
}
