//
//  ViewController.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/21/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var moviesCollectionView: UICollectionView!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	@IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
	
	let homeViewModel = HomeViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpMoviesCollectionView()
		
			homeViewModel.loadData { 
				self.moviesCollectionView.reloadData()
			}
		stopActivityIndicator()
		
	}
	
	
  private func setUpMoviesCollectionView() {
	let nib = UINib(nibName: MovieCollectionViewCell.cellId, bundle: nil)
		moviesCollectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.cellId)
	}
	
	func loadMoreMovies() {
		homeViewModel.loadData {
			self.stopActivityIndicator()
			self.moviesCollectionView.reloadData()
		}
	}
	
	
	
	func stopActivityIndicator()  {
		activityIndicator.stopAnimating()
		activityIndicator.isHidden = true
		collectionViewBottomConstraint.constant = 0
	}
	
	func startActivityIndicator() {
		activityIndicator.startAnimating()
		activityIndicator.isHidden = false
		collectionViewBottomConstraint.constant = 30
	}

}

	//MARK: UICollectionview Delegation Methods

extension HomeViewController : UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let movieDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "movieDetailsViewController") as! MovieDetailsViewController
		movieDetailsViewController.movieDetailsViewModel = homeViewModel.getMovieDetailsViewModel(indexPath: indexPath)
		self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
		if indexPath.row == homeViewModel.getCountOfAllMovies()-1  && homeViewModel.isLastPage() {
			print(indexPath.row)
			startActivityIndicator()
			loadMoreMovies()
			
		}else {
			print(indexPath.row)
			stopActivityIndicator()
		}
	}
	
}

	//MARK: UICollectionview DataSource Methods

extension HomeViewController : UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return homeViewModel.getCountOfAllMovies()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellId , for: indexPath) as! MovieCollectionViewCell
		cell.movieCardViewModel = homeViewModel.getMovieCardViewModel(indexPath: indexPath)
		return cell
	}
	
}

	//MARK: UICollectionview Delegation FlowLayout Methods

extension HomeViewController : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
	 return	CGSize(width: view.frame.width/2 , height: view.frame.height/3)
	}
	
}


 
  
 
 
 
 
 
