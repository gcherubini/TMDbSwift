//
//  MoviesRepository.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

protocol MovieRepository {
	func getMovies(completion: @escaping ([Movie]?, Error?) -> Void)
}
