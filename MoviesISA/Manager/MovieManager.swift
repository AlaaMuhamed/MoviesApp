//
//  MovieManager.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/29/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation
import SwiftyJSON


class MovieManager {
	
	var networkManager = NetworkManager()
	var databaseManager = DatabaseManager()
	
	
	func getMoviesFromApi(page : Int ,completion : @escaping () -> () ){
		networkManager.connectToApi(page: page) { result in
			if let moviesJson = result {
				self.loadAllMovies(moviesJson: moviesJson)
				completion()
			}
		}
	}
	
	
	func getMoviesForCategory( url : String , page : Int , completion : @escaping ([JSON]) -> () ){
		networkManager.getAllCategories(url : url , page: page) { result in
			if let moviesJson = result {
				completion(moviesJson)
			}
		}
	}
	
	
	
	private func loadAllMovies(moviesJson : [JSON]) {
		for i in moviesJson.indices {
			let movie = Movie(value: moviesJson[i])
			witeMoviesInDataBase(movie: movie)
		}
	}
	
	
	func witeMoviesInDataBase(movie : Movie) {
		databaseManager.writeMovieInDatabase(movie: movie)
	}
	
	func getCountOfMovies() -> Int {
		return databaseManager.getAllMoviesCountFromDatabase() 
	}
	
	func getMovieAtIndexPath(indexpath : IndexPath) -> Movie  {
		return databaseManager.getMovieFromDatabase(index: indexpath.row)
	}
	
	
	
}
