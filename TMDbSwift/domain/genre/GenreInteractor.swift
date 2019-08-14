//
//  FetchUpcomingMovies.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

/**
Fetch and return [Genres] from GenreRepositories with a completion,
If a genre has already been fetched, it is stored and returned in future requests
*/
class GenreInteractor {
	
	private let genreRepository: GenreRepository
	private var genres: [Genre]?
	
	init(genreRepository: GenreRepository = GenreService()) {
		self.genreRepository = genreRepository
	}
	
	func fetchGenres(completion: @escaping ([Genre]?) -> ()) {
		if genres != nil {
			completion(genres)
		} else {
			genreRepository.getGenres(completion: { [weak self] genres, _ in
				guard let self = self else { return }
				self.genres = genres
				completion(genres)
			})
		}
	}
}
