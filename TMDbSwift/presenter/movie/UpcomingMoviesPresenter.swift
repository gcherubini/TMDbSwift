//
//  UpcomingMoviesPresenter.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

protocol UpcomingMoviesView: class{
	func toogleIndicator(active: Bool)
	func show(movies: [MovieModel])
	func show(error: String)
}

class UpcomingMoviesPresenter {
	
	private weak var view: UpcomingMoviesView?
	private let interactor: MoviesInteractor
	private let formatter = DateFormatter()
	
	init(view: UpcomingMoviesView?,
		 interactor: MoviesInteractor = MoviesInteractor()) {
		self.view = view
		self.interactor = interactor
	}
	
	func load() {
		view?.toogleIndicator(active: true)
		fetchUpcomingMovies()
	}
	
	private func fetchUpcomingMovies() {
		interactor.fetchUpcomingMovies { [weak self] movies, _ in
			guard let self = self else { return }
			
			if let safeMovies = movies {
				if safeMovies.isEmpty {
					self.view?.show(error: "No data found")
				} else {
					self.view?.show(movies: safeMovies)
				}
			} else {
				self.view?.show(error: "Some error happened retrieving data")
			}
			
			self.view?.toogleIndicator(active: false)
		}
	}
}
