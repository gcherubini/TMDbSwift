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
		
		releaseDate = movie.releaseDate
		
		var genresFound = [String]()
		
		if let movieGenresIds = movie.genreIds, let genres = genres {
			for movieGenreId in movieGenresIds {
				for genre in genres {
					if movieGenreId == genre.id {
						genresFound.append(genre.name)
					}
				}
			}
		}
		
		self.genres = genresFound.isEmpty ? nil : genresFound.joined(separator:", ")
	}
}
