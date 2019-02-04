//
//  MovieDetailsViewModel.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/22/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation

class MovieDetailsViewModel {
	
	var movie = Movie()
	
	func getMovietitle() -> String {
	return	movie.title
	}
	
	func getMovieImageUrl() -> String {
		 let imageName = "\(Constants.imageBaseUrl)\(movie.poster_path)"
		return imageName
	}
	
	func getMovieOverView() -> String {
		return movie.overview
	}
	
}
