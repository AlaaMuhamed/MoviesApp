//
//  AllMoviesViewController.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/28/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import UIKit

class AllMoviesViewController: UIViewController {
	
	@IBOutlet weak var allMoviesTableView: UITableView!
	let allMoviesViewModel = AllMoviesViewModel()
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupTableView()
		
		allMoviesViewModel.loadCategories {
			self.allMoviesTableView.reloadData()
		} 
		
    }
	
	private func setupTableView()  {
		let nib = UINib(nibName:AllMoviesTableViewCell.cellId , bundle: nil)
		allMoviesTableView.register(nib, forCellReuseIdentifier: AllMoviesTableViewCell.cellId)
	}

}

	//MARK: Enums For Constants

extension AllMoviesViewController {
	
	enum Categories {
		static let upcoming = "upcoming"
		static let nowPlaying = "nowPlaying"
		static let popular  = "popular"
		static let topRated = "topRated"
	}
	
	enum Storyboards {
		static let homeScreen = "HomeViewController"
	}
	
	enum CellCategories {
		static let popularMovies = "Popular Movies"
		static let topRatedMovies = "Top Rated Movies"
		static let nowPlayingMovies  = "Now Playing Movies"
		static let upcomingMovies = "Upcoming Movies"
	}
	
}

	//MARK: UITableView Delegation Methods 

extension AllMoviesViewController : UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: Storyboards.homeScreen) as? HomeViewController  else {
			return
		}	
		self.navigationController?.pushViewController(homeViewController, animated: true)
	} 
}

	//MARK: UITableview DataSource Methods

extension AllMoviesViewController : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: AllMoviesTableViewCell.cellId, for: indexPath) as? AllMoviesTableViewCell  else {
			return AllMoviesTableViewCell()
		}	
		cell.selectionStyle = .none
		switch indexPath.row {
		case 0:
			cell.categoryTitle.text = CellCategories.popularMovies
			cell.categoryViewModels = allMoviesViewModel.getCountOfPopularMovies()
		case 1:
			cell.categoryTitle.text = CellCategories.topRatedMovies
			cell.categoryViewModels = allMoviesViewModel.getCountOfTopRatedMovies()
		case 2:
			cell.categoryTitle.text = CellCategories.nowPlayingMovies
			cell.categoryViewModels = allMoviesViewModel.getCountOfNowPlayingMovies()
		case 3:
			cell.categoryTitle.text = CellCategories.upcomingMovies
			cell.categoryViewModels = allMoviesViewModel.getCountOfUpcomingMovies()
		default:
			cell.categoryTitle.text = ""
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat(UIScreen.main.bounds.size.height/3)
	}
	
}
