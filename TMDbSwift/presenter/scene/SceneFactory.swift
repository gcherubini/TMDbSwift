//
//  SceneFactory.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class SceneFactory {
	func buildUpcomingMovies(delegate: UpcomingMoviesDelegate) -> UpcomingMoviesTableViewController {
		let viewController = UpcomingMoviesTableViewController()
		let presenter = UpcomingMoviesPresenter(
			view: viewController,
			delegate: delegate
		)
		viewController.presenter = presenter
		return viewController
	}
}
