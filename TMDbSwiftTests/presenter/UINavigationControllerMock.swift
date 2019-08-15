//
//  UINavigationControllerMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit
@testable import TMDbSwift

class UINavigationControllerMock: UINavigationController {
	var pushedViewController: UIViewController?
	var isAnimated: Bool?
	
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		pushedViewController = viewController
		isAnimated = animated
	}
}
