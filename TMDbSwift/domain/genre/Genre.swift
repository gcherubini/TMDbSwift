//
//  Movie.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

struct Genre: Equatable {
	let id: Int
	let name: String
}

extension Genre {
	init(with response: GenreResponse) {
		id = response.id
		name = response.name
	}
}

