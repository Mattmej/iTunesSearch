//
//  AlbumTableViewCell.swift
//  iTunesSearch
//
//  Created by Matt Mejia on 12/13/18.
//  Copyright © 2018 Matt_Mejia. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumArtistName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(album: Album) {
        self.albumName.text = album.albumName
        self.albumArtistName.text = album.artistName
//        self.albumImage.image = UIImage(data: <#T##Data#>)
        
    }

}
