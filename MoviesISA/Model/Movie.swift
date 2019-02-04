//
//  Movie.swift
//  MoviesISA
//
//  Created by Esraa Yasser on 1/21/19.
//  Copyright © 2019 Modeso. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON
class Movie : Object , NSCopying{
	
    @objc dynamic var id  = 0
	@objc dynamic var title = ""
	@objc dynamic var popularity : Float = 0
	@objc dynamic var poster_path = ""
	@objc dynamic var adult = false
	@objc dynamic var overview = ""
	
	
	override static func primaryKey() -> String? {
		return "id"
	}
	
	convenience init(value: JSON) {
		self.init()
		self.title = value["title"].stringValue
		self.popularity = value["popularity"].floatValue
		self.adult = value["adult"].boolValue
		self.poster_path = value["poster_path"].stringValue
		self.overview = value["overview"].stringValue
		self.id = value["id"].intValue
	}
	
	
	func copy(with zone: NSZone? = nil) -> Any {
		let copy = Movie()
		copy.title = title
		copy.adult = adult
		copy.overview = overview
		copy.poster_path = poster_path
		copy.id = id
		return copy
	}
	
	
}
