//
//  MovieCollectionViewCell.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/21/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
	
	static var cellId = "MovieCollectionViewCell"
	var movieCardViewModel : MovieCardViewModel? {
		didSet {
			if let url = movieCardViewModel?.getImageUrl() {
				 let imageName = "\(Constants.imageBaseUrl)\(url)"
				movieCardImage.sd_setImage(with: URL(string: imageName))
			}
			
		}
		
	}
	
	@IBOutlet weak var movieCardImage: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

	
}
