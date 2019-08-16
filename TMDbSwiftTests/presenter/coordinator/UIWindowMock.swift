//
//  UIWindowMock.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit
@testable import TMDbSwift

class UIWindowMock: UIWindow {
	var hasMakeKeyAndVisible: Bool?

	override func makeKeyAndVisible() {
		hasMakeKeyAndVisible = true
	}
}
