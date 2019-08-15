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
		var tableViewControllerMock: UpcomingMoviesTableViewController!
		var sceneFactoryMock: SceneFactoryMock!
		var sut: UpcomingMoviesCoordinator!
		
		describe("UpcomingMoviesCoordinator") {
			beforeEach {
				navigationControllerMock = UINavigationControllerMock()
				tableViewControllerMock = UpcomingMoviesTableViewController()
				sceneFactoryMock = SceneFactoryMock(
					tableViewControllerMock: tableViewControllerMock
				)
				
				sut = UpcomingMoviesCoordinator(
					navigationController: navigationControllerMock,
					sceneFactory: sceneFactoryMock)
			}
			
			describe("on start") {
				it("start upcoming movies TableView") {
					sut.start()
					expect(navigationControllerMock.pushedViewController)
						.to(equal(tableViewControllerMock))
					expect(navigationControllerMock.isAnimated)
						.to(beTrue())
				}
			}
			
			describe("on movie is selected") {
				it("start upcoming movies TableView") {
					sut.start()
					expect(navigationControllerMock.pushedViewController)
						.to(equal(tableViewControllerMock))
					expect(navigationControllerMock.isAnimated)
						.to(beTrue())
				}
			}
		}
	}
}
