//
//  AllMoviesViewModel.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/28/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation
import SwiftyJSON

class AllMoviesViewModel  {
	
private	let networkManager = NetworkManager()
private	var popularMovies = [MovieCardViewModel]()
private	var playNowMovies = [MovieCardViewModel]()
private	var topRatedMovies = [MovieCardViewModel]()
private	var upcomingMovies = [MovieCardViewModel]()

	
	func loadCategories(completion : @escaping  () -> ()) {
		networkManager.getAllCategories(url: Constants.popularUrl , page: 1) { (result) in
			guard let moviesJson = result else {
				return
			}
			self.loadMovies(moviesJson: moviesJson, category: Categories.popular )
		}
		
		networkManager.getAllCategories(url: Constants.topRatedUrl , page: 1) { (result) in
			guard let moviesJson = result else {
				return
			}
			self.loadMovies(moviesJson: moviesJson, category:Categories.topRated )
		}
		
		
		networkManager.getAllCategories(url: Constants.nowPlayingUrl , page: 1) { (result) in
			guard let moviesJson = result else {
				return
			}
			self.loadMovies(moviesJson: moviesJson, category:Categories.nowPlaying )
		}
		
		networkManager.getAllCategories(url: Constants.upcomingUrl , page: 1) { (result) in
			guard let moviesJson = result else {
				return
			}
			self.loadMovies(moviesJson: moviesJson, category:Categories.upcoming )
			completion()
		}
		
	}
	
	
	private func loadMovies(moviesJson : [JSON] , category : String) {
		for i in moviesJson.indices {
			let movie = Movie(value: moviesJson[i])
			let movieCardViewModel = MovieCardViewModel()
			movieCardViewModel.movie = movie
			
			switch category {
			case Categories.popular :
	              popularMovies.append(movieCardViewModel)
			case Categories.upcoming :
				upcomingMovies.append(movieCardViewModel)
			case Categories.topRated :
				topRatedMovies.append(movieCardViewModel)
			case Categories.nowPlaying :
				playNowMovies.append(movieCardViewModel)
			default:
				print("Unknown")
			}
		}
		
	}
	
	func getCountOfTopRatedMovies() -> [MovieCardViewModel] {
		return topRatedMovies
	}
	
	func getCountOfNowPlayingMovies() ->  [MovieCardViewModel] {
		return playNowMovies
	}
	
	
	func getCountOfPopularMovies() ->  [MovieCardViewModel] {
		return popularMovies
	}
	
	func getCountOfUpcomingMovies() ->  [MovieCardViewModel] {
		return upcomingMovies
	}
	
}


	//MARK: Enum for Categories

extension AllMoviesViewModel {
	enum Categories {
		static let popular = "popular"
		static let nowPlaying  = "nowPlaying"
		static let topRated = "topRated"
		static let upcoming  = "upcoming"
	}
}

