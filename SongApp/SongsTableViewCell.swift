//
//  SongsTableViewCell.swift
//  SongApp
//
//  Created by Mikel Aguirre on 22/4/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {

    @IBOutlet weak var caratulaDisco: UIImageView!
    @IBOutlet weak var tituloCancion: UILabel!
    @IBOutlet weak var nombreArtista: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
