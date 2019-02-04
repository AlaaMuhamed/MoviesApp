//
//  CategoryCollectionViewCell.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/28/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

	static var categoryCellId = "CategoryCollectionViewCell"
	
	@IBOutlet weak var categoryCellImageView: UIImageView!
	var imageUrl : String? {
		didSet{
			if let url = imageUrl {
				categoryCellImageView.sd_setImage(with: URL(string: url))
			}
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
