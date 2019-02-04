//
//  MovieDetailsViewController.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/22/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
	
	
	@IBOutlet weak var movieImage: UIImageView!
	
	@IBOutlet weak var movieTitle: UILabel!
	
	@IBOutlet weak var movieOverView: UILabel!
	
	var movieDetailsViewModel : MovieDetailsViewModel = MovieDetailsViewModel()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadViewswithData()
    }
	
	private func loadViewswithData()  {
		movieTitle.text = movieDetailsViewModel.getMovietitle()
		movieOverView.text = movieDetailsViewModel.getMovieOverView()
		movieImage.sd_setImage(with: URL(string: movieDetailsViewModel.getMovieImageUrl()))
	}



}
