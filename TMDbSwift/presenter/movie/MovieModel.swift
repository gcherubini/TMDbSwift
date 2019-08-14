//
//  MovieModel.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

struct MovieModel: Equatable {
	let title: String?
	let imageUrl: String?
	let overview: String?
	let genres: String?
	let releaseDate: String?
}

