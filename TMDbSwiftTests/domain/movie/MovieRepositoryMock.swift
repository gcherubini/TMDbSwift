//
//  GenreRepositoryMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

@testable import TMDbSwift

class MovieRepositoryMock: MovieRepository {
	
	let moviesMock: [Movie]?
	let errorMock: Error?
	
	init(moviesMock: [Movie]? = nil, errorMock: Error? = nil) {
		self.moviesMock = moviesMock
		self.errorMock = errorMock
	}
	
	func getMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
		completion(moviesMock, errorMock)
	}
}
