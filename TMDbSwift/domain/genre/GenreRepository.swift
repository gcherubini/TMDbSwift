//
//  MoviesRepository.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

protocol GenreRepository {
	func getGenres(completion: @escaping ([Genre]?, Error?) -> ())
}
