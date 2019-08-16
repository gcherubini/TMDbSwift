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

class GenreInteractorSpec: QuickSpec {
	override func spec() {
		let genresMock = [
			Genre(id: 1, name: "mock1"),
			Genre(id: 1, name: "mock2")
		]

		var repositoryMock: GenreRepositoryMock!
		var sut: GenreInteractor!

		describe("GenreInteractor") {
			beforeEach {
				repositoryMock = GenreRepositoryMock(genresMock: genresMock)
				sut = GenreInteractor(genreRepository: repositoryMock)
			}

			describe("get") {
				it("genres from repository when they had not been fetched yet") {
					waitUntil(timeout: 5) { done in
						sut.fetchGenres { genres in
							expect(genres).to(equal(genresMock))
							expect(repositoryMock.isGetGenresCalled).to(beTrue())
							done()
						}
					}
				}

				it("genres from interactor when they already have been stored") {
					waitUntil(timeout: 5) { done in
						sut.fetchGenres { genres in
							repositoryMock = GenreRepositoryMock(genresMock: genresMock)
							sut.fetchGenres { genres in
								expect(genres).to(equal(genresMock))
								expect(repositoryMock.isGetGenresCalled).to(beFalse())
							}
							done()
						}
					}
				}
			}
		}
	}
}
