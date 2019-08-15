//
//  UpcomingMoviesDelegateMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

@testable import TMDbSwift

class UpcomingMoviesDelegateMock: UpcomingMoviesDelegate {
	
	var didSelectMovie: MovieModel?
	
	func didSelect(movie: MovieModel) {
		didSelectMovie = movie
	}
}
