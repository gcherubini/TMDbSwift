//
//  MovieService.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Moya

class MovieService: MovieRepository {
	let provider = MoyaProvider<MovieApi>(callbackQueue: DispatchQueue.global(qos: .utility))

	func getMovies(completion: @escaping ([Movie]?, Error?) -> Void) {
		provider.request(.getMovies) { result in
			switch result {
			case let .success(moyaResponse):
				let decoder = JSONDecoder()
				do {
					let response = try decoder.decode(UpcomingMoviesResponse.self, from: moyaResponse.data)
					let movies = response.results.map({
						Movie(with: $0)
					})
					completion(movies, nil)
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
