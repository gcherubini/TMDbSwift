//
//  MovieService.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Moya

class GenreService: GenreRepository {
	let provider = MoyaProvider<MovieApi>(callbackQueue: DispatchQueue.global(qos: .utility))
	
	func getGenres(completion: @escaping ([Genre]?, Error?) -> ()) {
		provider.request(.getGenres) { result in
			switch result {
			case let .success(moyaResponse):
				do {
					let response = try JSONDecoder().decode(GenresResponse.self, from: moyaResponse.data)
					let genres = response.genres.map({
						Genre(with: $0)
					})
					completion(genres, nil)
				} catch let error {
					print(error)
					completion(nil, error)
				}
			case let .failure(error):
				completion(nil, error)
			}
		}
	}
}
