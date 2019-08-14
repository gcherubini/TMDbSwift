//
//  FetchUpcomingMovies.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class MoviesInteractor {
	
	private let movieRepository: MovieRepository
	private let genreInteractor: GenreInteractor
	
	init(genreInteractor: GenreInteractor = GenreInteractor(),
		 movieRepository: MovieRepository = ProcessInfo.processInfo.arguments.contains("MOCK")
		? MovieMockService() : MovieService()) {
		self.movieRepository = movieRepository
		self.genreInteractor = genreInteractor
	}
	
	func fetchUpcomingMovies(completion: @escaping ([MovieModel]?, Error?) -> ()) {
		genreInteractor.fetchGenres(completion: { [weak self] genres in
			self?.fetchMovies(genres: genres, completion: completion)
		})
	}
	
	func fetchMovies(genres: [Genre]?, completion: @escaping ([MovieModel]?, Error?) -> ()) {
		movieRepository.getMovies { movies, error in
			if let movies = movies {
				let moviesModels = movies.map({ MovieModel(with: $0, genres: genres) })
				completion(moviesModels, nil)
			} else {
				completion(nil, error)
			}
		}
	}
}
