//
//  ImageViewExtensions.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
	func load(url: String?) {
		load(url: URL(string: url ?? ""))
	}
	
	func load(url: URL?) {
		DispatchQueue.global().async { [weak self] in
			if let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data)  {
				DispatchQueue.main.async {
					self?.image = image
				}
			} else {
				DispatchQueue.main.async {
					self?.image = #imageLiteral(resourceName: "placeholder")
				}
			}
		}
	}
}
