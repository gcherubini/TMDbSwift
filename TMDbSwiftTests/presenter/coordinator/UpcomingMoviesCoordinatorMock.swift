//
//  UpcomingMoviesCoordinatorMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
@testable import TMDbSwift

class UpcomingMoviesCoordinatorMock: UpcomingMoviesCoordinator {
	var hasStarted: Bool?

	override func start() {
		hasStarted = true
	}
}
