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
	
	init(with movie: Movie, genres: [Genre]?) {
		title = movie.title
	
		if let posterImageUrl = movie.posterImageUrl {
			imageUrl = "https://image.tmdb.org/t/p/w185\(posterImageUrl)"
		} else {
			imageUrl = nil
		}

		overview = movie.overview
		
		self.genres = nil
		// TODO: proccess genres
			
		releaseDate = movie.releaseDate
	}
}
