//
//  DatabaseManager.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/21/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager  {
	
	let realm = try! Realm()
	
	func writeMovieInDatabase(movie : Movie)  {
		try! realm.write {
			realm.add(movie , update : true)
		}
	}
	
	func getAllMoviesCountFromDatabase() -> Int {
		let movies = realm.objects(Movie.self)
		return movies.count
	}
	
	
	
	func getMovieFromDatabase(index : Int) -> Movie {
		let movies = realm.objects(Movie.self)
		let movie = Array(movies)[index]
		guard let copiedItem = movie.copy() as? Movie else {
			return Movie()
		}
		return copiedItem
	}
	
	
	
	
}
