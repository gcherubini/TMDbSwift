//
//  MovieResponse.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

struct UpcomingMoviesResponse: Decodable {
	let results: [MovieResponse]
	
	enum CodingKeys: String, CodingKey {
		case results = "results"
	}
}
