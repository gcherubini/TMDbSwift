//
//  CoordinatorFactoryMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit
@testable import TMDbSwift

class CoordinatorsFactoryMock: CoordinatorsFactory {
	let upComingMoviesCoordinatorMock: UpcomingMoviesCoordinator
	
	init(upcomingMoviesCoordinatorMock: UpcomingMoviesCoordinator) {
		self.upComingMoviesCoordinatorMock = upcomingMoviesCoordinatorMock
		super.init(navigationController: UINavigationController())
	}
	
	override func buildUpcomingMoviesCoordinator() -> UpcomingMoviesCoordinator {
		return upComingMoviesCoordinatorMock
	}
}
