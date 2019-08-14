//
//  UpcomingMoviesViewMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
@testable import TMDbSwift

class UpcomingMoviesViewMock: UpcomingMoviesView {
	var isIndicatorActive: Bool?
	var showedMovies: [MovieModel]?
	var showedError: String?
	
	func toogleIndicator(active: Bool) {
		self.isIndicatorActive = active
	}
	
	func show(movies: [MovieModel]) {
		showedMovies = movies
	}
	
	func show(error: String) {
		showedError = error
	}
}
