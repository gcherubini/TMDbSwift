//
//  GenreRepositoryMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

@testable import TMDbSwift

class GenreRepositoryMock: GenreRepository {

	let genresMock: [Genre]?
	var isGetGenresCalled: Bool = false

	init(genresMock: [Genre]? = nil) {
		self.genresMock = genresMock
	}

	func getGenres(completion: @escaping ([Genre]?, Error?) -> Void) {
		isGetGenresCalled = true
		completion(genresMock, nil)
	}
}
