//
//  HomeViewModel.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/21/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomeViewModel  {
	
	var networkManager = NetworkManager()
	var databaseManager = DatabaseManager()
	var movieManager = MovieManager()
	var currentPage  = 1
	var totalPages = 5
	

	func isLastPage() -> Bool {
		if currentPage == totalPages {
			return false
		}else {
			currentPage+=1
			return true
		}
	}
	
	func loadData(completion : @escaping  () -> ()) {
		movieManager.getMoviesFromApi(page: currentPage) { 
			completion()
		}
	}
	
	func getCountOfAllMovies() -> Int {
		return movieManager.getCountOfMovies()
	}
	
	func getMovieCardViewModel(indexPath : IndexPath) -> MovieCardViewModel {
		let movieCardViewModel = MovieCardViewModel()
		movieCardViewModel.movie = movieManager.getMovieAtIndexPath(indexpath: indexPath)
		return movieCardViewModel
	}
	
	
	func getMovieDetailsViewModel(indexPath : IndexPath) -> MovieDetailsViewModel {
		let movieDetailsViewModel = MovieDetailsViewModel()
		movieDetailsViewModel.movie = movieManager.getMovieAtIndexPath(indexpath: indexPath)
		return movieDetailsViewModel
	}
	
}
