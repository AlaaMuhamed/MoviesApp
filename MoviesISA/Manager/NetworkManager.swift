//
//  NetworkManager.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/21/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
	
	
	func connectToApi(page : Int , completion : @escaping ([JSON]?)-> () ){
		Alamofire.request("\(Constants.popularUrl)\(page)").responseJSON { response  in
			
			if let json = response.result.value {
				let result = JSON(json).dictionary
				let arrayOfMovies = result!["results"]?.arrayValue
				completion(arrayOfMovies)
			}else{
				completion(nil)
			}
		}
	}
	
	
	
	func getAllCategories(url : String , page : Int , completion : @escaping ([JSON]?) -> () ) {
		Alamofire.request("\(url)\(page)").responseJSON { response  in
				if let json = response.result.value {
				let result = JSON(json).dictionary
				let arrayOfMovies = result!["results"]?.arrayValue
				completion(arrayOfMovies)
			}else{
				completion(nil)
			}
		}
	}
	
	
	
	
}
