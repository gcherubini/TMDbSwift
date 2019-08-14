//
//  FetchUpcomingMovies.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class UpcomingMoviesInteractor {
	
	private let movieRepository: MovieRepository
	private let genreRepository: GenreRepository
	
	init(movieRepository: MovieRepository = MovieService(),
		 genreRepository: GenreRepository = GenreService()) {
		self.movieRepository = movieRepository
		self.genreRepository = genreRepository
	}
	
	func fetchUpcomingMovies(completion: @escaping ([MovieModel]?, Error?) -> ()) {
		genreRepository.getGenres(completion: { [weak self] genres, error in
			self?.fetchMovies(genres: genres, completion: completion)
		})
	}
	
	func fetchMovies(genres: [Genre]?, completion: @escaping ([MovieModel]?, Error?) -> ()) {
		movieRepository.getMovies { movies, error in
			if let safeMovies = movies {
				let moviesModel = safeMovies.map({
					MovieModel(with: $0, genres: genres)
				})
				completion(moviesModel, nil)
			} else {
				completion(nil, error)
			}
		}
	}
}
