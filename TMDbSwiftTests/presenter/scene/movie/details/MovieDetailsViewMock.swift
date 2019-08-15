//
//  MovieDetailsViewMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

@testable import TMDbSwift

class MovieDetailsViewMock: MovieDetailsView {
	var showedMovie: MovieModel?
	
	func show(movie: MovieModel) {
		showedMovie = movie
	}
}
