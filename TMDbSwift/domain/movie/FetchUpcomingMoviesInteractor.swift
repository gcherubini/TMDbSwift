//
//  FetchUpcomingMovies.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class UpcomingMoviesInteractor {
	
	let repository: MovieRepository
	
	init(repository: MovieRepository = MovieMockService()) {
		self.repository = repository
	}
	
	func fetchUpcomingMovies(completion: @escaping ([MovieModel]?, Error?) -> ()) {
		return repository.getMovies(completion: completion)
	}
}
