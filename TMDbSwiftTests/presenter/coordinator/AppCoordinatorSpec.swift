//
//  UpcomingMoviePresenterSpec.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TMDbSwift

class AppCoordinatorSpec: QuickSpec {
	override func spec() {
		var windowMock: UIWindowMock!
		var navigationControllerMock: UINavigationController!
		var upcomingMoviesCoordinatorMock: UpcomingMoviesCoordinatorMock!
		var coordinatorFactoryMock: CoordinatorsFactoryMock!
		var sut: AppCoordinator!
		
		describe("AppCoordinator") {
			beforeEach {
				windowMock = UIWindowMock()
				navigationControllerMock = UINavigationController()
				upcomingMoviesCoordinatorMock = UpcomingMoviesCoordinatorMock(navigationController: UINavigationController())
				coordinatorFactoryMock = CoordinatorsFactoryMock(upcomingMoviesCoordinatorMock: upcomingMoviesCoordinatorMock)

				sut = AppCoordinator(window: windowMock,
					navigationController: navigationControllerMock,
					coordinatorsFactory: coordinatorFactoryMock)
			}
			
			describe("on init") {
				it("setup window") {
					expect(windowMock.rootViewController)
						.to(equal(navigationControllerMock))
					expect(windowMock.hasMakeKeyAndVisible)
						.to(beTrue())
				}
			}
			
			describe("on start") {
				it("start upcoming movies coordinators") {
					sut.start()
					expect(upcomingMoviesCoordinatorMock.hasStarted)
						.to(beTrue())
				}
			}
		}
	}
}
