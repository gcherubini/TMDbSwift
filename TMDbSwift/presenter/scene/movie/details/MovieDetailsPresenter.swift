//
//  MovieDetailsPresenter.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class MovieDetailsPresenter {
	let movieModel: MovieModel
	let view: MovieDetailsView?

	init(movieModel: MovieModel,
		 view: MovieDetailsView) {
		self.movieModel = movieModel
		self.view = view
	}

	func load() {
		view?.show(movie: movieModel)
	}
}
