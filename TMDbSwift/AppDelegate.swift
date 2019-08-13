//
//  AppDelegate.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var coordinator: AppCoordinator?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let navigationController = UINavigationController()
		let coordinatorsFactory = CoordinatorsFactory(
			navigationController: navigationController
		)
		coordinator = AppCoordinator(
			navigationController: navigationController,
			coordinatorsFactory: coordinatorsFactory
		)
		coordinator?.start()
		return true
	}
}
