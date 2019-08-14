//
//  UpcomingMoviesCoordinator.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit

class UpcomingMoviesCoordinator: Coordinator {
	
	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewController = UpcomingMoviesTableViewController()
		navigationController.pushViewController(viewController, animated: true)
	}
}
