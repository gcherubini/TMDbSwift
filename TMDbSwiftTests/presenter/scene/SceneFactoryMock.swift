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
	let movieDetailsViewControllerMock: MovieDetailsViewController
	
	init(tableViewControllerMock: UpcomingMoviesTableViewController,
		 movieDetailsViewControllerMock: MovieDetailsViewController) {
		self.tableViewControllerMock = tableViewControllerMock
		self.movieDetailsViewControllerMock = movieDetailsViewControllerMock
	}
	
	override func buildUpcomingMovies(delegate: UpcomingMoviesDelegate) -> UpcomingMoviesTableViewController {
		return tableViewControllerMock
	}
	
	override func buildMovieDetails(movieModel: MovieModel) -> MovieDetailsViewController {
		return movieDetailsViewControllerMock
	}
}
