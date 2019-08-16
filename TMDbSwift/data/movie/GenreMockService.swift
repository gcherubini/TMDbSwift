//
//  MovieService.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class GenreMockService: GenreRepository {
	func getGenres(completion: @escaping ([Genre]?, Error?) -> Void) {
		completion([
			Genre(id: 1, name: "Action"),
			Genre(id: 2, name: "Adventure"),
			Genre(id: 3, name: "Horror"),
			Genre(id: 4, name: "Mystery"),
			Genre(id: 5, name: "Fantasy"),
			Genre(id: 6, name: "Comedy")
		], nil)
	}
}
