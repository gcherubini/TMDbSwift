//
//  UpcomingMoviesCoordinator.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit

protocol UpcomingMoviesDelegate: class {
	func didSelect(movie: MovieModel)
}

class UpcomingMoviesCoordinator: Coordinator {
	
	private let navigationController: UINavigationController
	private let sceneFactory: SceneFactory
	
	init(navigationController: UINavigationController,
		 sceneFactory: SceneFactory = SceneFactory()) {
		self.navigationController = navigationController
		self.sceneFactory = sceneFactory
	}
	
	func start() {
		let viewController = sceneFactory.buildUpcomingMovies(delegate: self)
		navigationController.pushViewController(viewController, animated: true)
	}
}

extension UpcomingMoviesCoordinator: UpcomingMoviesDelegate {
	func didSelect(movie: MovieModel) {
		let viewController = sceneFactory.buildMovieDetails(movieModel: movie)
		navigationController.pushViewController(viewController, animated: true)
	}
}
