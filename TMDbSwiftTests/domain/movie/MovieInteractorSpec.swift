//
//  GenreInteractorSpec.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TMDbSwift

class MovieInteractorSpec: QuickSpec {

	var repositoryMock: MovieRepositoryMock!
	var genreInteractorMock: GenreInteractorMock!

	override func spec() {
		describe("MovieInteractor") {
			describe("fire completion with") {
				it("movies models from repository with genres info") {
					let genresMock = [
						Genre(id: 1, name: "Action"),
						Genre(id: 2, name: "Comedy"),
						Genre(id: 3, name: "Adventure")
					]
					let moviesMock = [
						Movie(id: 1, title: "The Movie", posterImageUrl: "/abc.jpg", overview: "Overview", releaseDate: "01-01-2019", genreIds: [1, 2])
					]

					let sut = self.setupSut(moviesMock: moviesMock, genresMock: genresMock)

					let expectedMoviesModels = [
						MovieModel(title: "The Movie",
								   imageUrl: "https://image.tmdb.org/t/p/w185/abc.jpg",
								   overview: "Overview",
								   genres: "Action, Comedy",
								   releaseDate: "01-01-2019")
					]

					waitUntil(timeout: 5) { done in
						sut.fetchUpcomingMovies { movies, _ in
							expect(movies).to(equal(expectedMoviesModels))
							done()
						}
					}
				}

				it("movies models from repository with nil values") {
					let moviesMock = [
						Movie(id: 1, title: nil, posterImageUrl: nil, overview: nil, releaseDate: nil, genreIds: nil)
					]

					let sut = self.setupSut(moviesMock: moviesMock, genresMock: nil)

					let expectedMoviesModels = [
						MovieModel(title: nil,
								   imageUrl: nil,
								   overview: nil,
								   genres: nil,
								   releaseDate: nil)
					]

					waitUntil(timeout: 5) { done in
						sut.fetchUpcomingMovies { movies, _ in
							expect(movies).to(equal(expectedMoviesModels))
							done()
						}
					}
				}

				it("error when movie repository fail") {
					let errorMock = ErrorMock.mock

					let sut = self.setupSut(moviesErrorMock: errorMock)

					waitUntil(timeout: 5) { done in
						sut.fetchUpcomingMovies { _, error in
							if let error = error {
								expect(error.localizedDescription == errorMock.localizedDescription)
									.to(beTrue())
							} else {
								fail()
							}
							done()
						}
					}
				}
			}
		}
	}

	func setupSut(moviesMock: [Movie]? = nil,
							  moviesErrorMock: Error? = nil,
							  genresMock: [Genre]? = nil) -> MovieInteractor {
		repositoryMock = MovieRepositoryMock(moviesMock: moviesMock, errorMock: moviesErrorMock)
		genreInteractorMock = GenreInteractorMock(genresMock: genresMock)

		return MovieInteractor(genreInteractor: genreInteractorMock,
							   movieRepository: repositoryMock)
	}
}
