//
//  UpcomingMoviesCoordinatorSpec.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TMDbSwift

class UpcomingMoviesCoordinatorSpec: QuickSpec {
	override func spec() {
		var navigationControllerMock: UINavigationControllerMock!
		var moviesTableViewControllerMock: UpcomingMoviesTableViewController!
		var detailsViewControllerMock: MovieDetailsViewController!
		var sceneFactoryMock: SceneFactoryMock!
		var sut: UpcomingMoviesCoordinator!
		
		describe("UpcomingMoviesCoordinator") {
			beforeEach {
				navigationControllerMock = UINavigationControllerMock()
				moviesTableViewControllerMock = UpcomingMoviesTableViewController()
				detailsViewControllerMock = MovieDetailsViewController()

				sceneFactoryMock = SceneFactoryMock(
					tableViewControllerMock: moviesTableViewControllerMock,
					movieDetailsViewControllerMock: detailsViewControllerMock
				)
				
				sut = UpcomingMoviesCoordinator(
					navigationController: navigationControllerMock,
					sceneFactory: sceneFactoryMock)
			}
			
			describe("on start") {
				it("start upcoming movies TableView") {
					sut.start()
					expect(navigationControllerMock.pushedViewController)
						.to(equal(moviesTableViewControllerMock))
					expect(navigationControllerMock.isAnimated)
						.to(beTrue())
				}
			}
			
			describe("on movie is selected") {
				it("start movie details view controller") {
					let any = MovieModel(title: nil, imageUrl: nil, overview: nil, genres: nil, releaseDate: nil)
					sut.didSelect(movie: any)
					expect(navigationControllerMock.pushedViewController)
						.to(equal(detailsViewControllerMock))
					expect(navigationControllerMock.isAnimated)
						.to(beTrue())
				}
			}
		}
	}
}
