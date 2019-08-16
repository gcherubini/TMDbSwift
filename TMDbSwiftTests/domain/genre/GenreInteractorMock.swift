//
//  GenreRepositoryMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

@testable import TMDbSwift

class GenreInteractorMock: GenreInteractor {

	let genresMock: [Genre]?

	init(genresMock: [Genre]? = nil) {
		self.genresMock = genresMock
	}

	override func fetchGenres(completion: @escaping ([Genre]?) -> Void) {
		completion(genresMock)
	}
}
