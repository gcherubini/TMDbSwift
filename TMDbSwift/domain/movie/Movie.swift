//
//  Movie.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

struct Movie: Equatable {
	let id: Int
	let title: String?
	let posterImageUrl: String?
	let overview: String?
	let releaseDate: String?
	let genreIds: [Int]?
}

extension Movie {
	init(with response: MovieResponse) {
		id = response.id
		title = response.title
		posterImageUrl = response.posterPath
		overview = response.overview
		releaseDate = response.releaseDate
		genreIds = response.genreIds
	}
}
