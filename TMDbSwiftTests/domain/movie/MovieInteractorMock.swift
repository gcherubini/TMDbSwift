//
//  GenreRepositoryMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

@testable import TMDbSwift

class MovieInteractorMock: MovieInteractor {

	let moviesModelMock: [MovieModel]?
	let errorMock: Error?
	let callFetchComplete: Bool

	init(moviesModelMock: [MovieModel]? = nil,
		 errorMock: Error? = nil,
		 callFetchComplete: Bool = true) {
		self.moviesModelMock = moviesModelMock
		self.errorMock = errorMock
		self.callFetchComplete = callFetchComplete
	}

	override func fetchUpcomingMovies(completion: @escaping ([MovieModel]?, Error?) -> Void) {
		if callFetchComplete {
			completion(moviesModelMock, errorMock)
		}
	}
}
