//
//  UpcomingMoviesPresenter.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class UpcomingMoviesPresenter {
	private weak var view: UpcomingMoviesView?
	private let interactor: MovieInteractor
	private let delegate: UpcomingMoviesDelegate?
	private let formatter = DateFormatter()
	
	init(view: UpcomingMoviesView?,
		 interactor: MovieInteractor = MovieInteractor(),
		 delegate: UpcomingMoviesDelegate? = nil) {
		self.view = view
		self.interactor = interactor
		self.delegate = delegate
	}
	
	func load() {
		view?.toogleIndicator(active: true)
		fetchUpcomingMovies()
	}
	
	private func fetchUpcomingMovies() {
		interactor.fetchUpcomingMovies { [weak self] movies, _ in
			guard let self = self else { return }
			
			if let movies = movies {
				if movies.isEmpty {
					self.view?.show(error: "No data found")
				} else {
					self.view?.show(movies: movies)
				}
			} else {
				self.view?.show(error: "Some error happened retrieving data")
			}
			
			self.view?.toogleIndicator(active: false)
			self.view?.endPullRefreshControl()
		}
	}
	
	func didSelect(movie: MovieModel) {
		delegate?.didSelect(movie: movie)
	}
}
