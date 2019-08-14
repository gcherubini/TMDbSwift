//
//  MovieResponse.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

struct GenreResponse: Decodable {
	let id: Int
	let name: String
	
	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
	}
}
