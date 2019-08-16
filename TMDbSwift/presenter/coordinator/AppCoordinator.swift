//
//  AppCoordinator.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {

	private let window: UIWindow
	private let navigationController: UINavigationController
	private let coordinatorsFactory: CoordinatorsFactory

	init(window: UIWindow = UIWindow(),
		 navigationController: UINavigationController,
		 coordinatorsFactory: CoordinatorsFactory) {
		self.window = window
		self.navigationController = navigationController
		self.coordinatorsFactory = coordinatorsFactory
		setupWindow()
	}

	private func setupWindow() {
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}

	func start() {
		coordinatorsFactory
			.buildUpcomingMoviesCoordinator()
			.start()
	}
}
