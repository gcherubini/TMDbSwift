//
//  SceneFactoryMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit
@testable import TMDbSwift

class SceneFactoryMock: SceneFactory {
	let tableViewControllerMock: UpcomingMoviesTableViewController
	
	init(tableViewControllerMock: UpcomingMoviesTableViewController) {
		self.tableViewControllerMock = tableViewControllerMock
	}
	
	override func buildUpcomingMovies(delegate: UpcomingMoviesDelegate) -> UpcomingMoviesTableViewController {
		return self.tableViewControllerMock
	}
}
