//
//  AllMoviesTableViewCell.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/28/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import UIKit

class AllMoviesTableViewCell: UITableViewCell {
	
	enum Storyboards {
		static let movieDetailsScreen = "movieDetailsViewController"
	}
	
	static var cellId = "AllMoviesTableViewCell"
	
	var categoryViewModels : [MovieCardViewModel]? {
		didSet {
			moviesCollectionView.reloadData()
		}
	}
	
	@IBOutlet weak var moviesCollectionView: UICollectionView!
	
	@IBOutlet weak var categoryTitle: UILabel!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
		setUpCollectionView()
		
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
	
	private	func setUpCollectionView() {
		moviesCollectionView.delegate = self
		moviesCollectionView.dataSource = self
		let nib = UINib(nibName: CategoryCollectionViewCell.categoryCellId, bundle: nil )
		moviesCollectionView.register(nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.categoryCellId)
		
	}
    
}

	//MARK: UICollectionview Delegation Methods

extension AllMoviesTableViewCell : UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		
		if let viewController = (self.superview  as? UITableView)?.delegate as? AllMoviesViewController {
			let movieDetails = viewController.storyboard?.instantiateViewController(withIdentifier: Storyboards.movieDetailsScreen) as! MovieDetailsViewController
			
			if let viewmodels = categoryViewModels {
				movieDetails.movieDetailsViewModel = viewmodels[indexPath.item].getMovieDetailsViewModel()
			}
			
			viewController.navigationController?.pushViewController(movieDetails, animated: true)
		}
	}
}

	//MARK: UICollectionview DataSource Methods

extension AllMoviesTableViewCell : UICollectionViewDataSource {
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.categoryCellId, for: indexPath) as! CategoryCollectionViewCell
		if let viewmodels =  categoryViewModels {
			cell.imageUrl = viewmodels[indexPath.item].getImageUrlforCategoryCell()
		}
	
		return cell
	}
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		 if let count = categoryViewModels?.count {
			return count
		}else {
			return 0
		}
	}
}

	//MARK: UICollectionview Delegation FlowLayout Methods

extension AllMoviesTableViewCell : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: moviesCollectionView.frame.width/3  , height: moviesCollectionView.frame.height )
	}
	
}
