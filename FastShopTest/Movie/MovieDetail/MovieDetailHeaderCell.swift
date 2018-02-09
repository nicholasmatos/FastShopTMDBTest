//
//  MovieDetailHeaderCell.swift
//  FastShopTest
//
//  Created by Nicholas Matos on 2/9/18.
//  Copyright © 2018 Nicholas Matos. All rights reserved.
//

import UIKit

class MovieDetailHeaderCell: UICollectionViewCell {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: BorderLabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var play: BorderLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
