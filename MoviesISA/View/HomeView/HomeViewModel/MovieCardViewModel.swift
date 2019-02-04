//
//  MovieCardViewModel.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/22/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation

class MovieCardViewModel {
	var movie = Movie()

	
	func getMovieTitle() -> String {
	  return movie.title
	}
	
	func getImageUrl() -> String {
	  return movie.poster_path
	}
	
	func getImageUrlforCategoryCell() -> String {
		let imageUrl = "\(Constants.imageBaseUrl)\(movie.poster_path)"
		return imageUrl 
	}
	
	func getMovieDetailsViewModel() -> MovieDetailsViewModel {
		let detailsViewModel = MovieDetailsViewModel()
		detailsViewModel.movie = movie
		return detailsViewModel
	}
	
	
}
