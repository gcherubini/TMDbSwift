//
//  MovieResponse.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
	let id: Int
	let title: String?
	let posterPath: String?
	let overview: String?
	let releaseDate: String?
	let genreIds: [Int]?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case title = "title"
		case posterPath = "poster_path"
		case overview = "overview"
		case releaseDate = "release_date"
		case genreIds = "genre_ids"
	}
}
