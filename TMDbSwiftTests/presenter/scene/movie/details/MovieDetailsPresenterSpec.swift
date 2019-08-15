//
//  MoviePresenterSpec.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 15/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TMDbSwift

class MovieDetailsPresenterSpec: QuickSpec {
	override func spec() {
		var movieModelMock: MovieModel!
		var viewMock: MovieDetailsViewMock!
		
		var sut: MovieDetailsPresenter!
		
		describe("MovieDetailsPresenter") {
			beforeEach {
				movieModelMock = MovieModel(title: nil, imageUrl: nil, overview: nil, genres: nil, releaseDate: nil)
				viewMock = MovieDetailsViewMock()
				sut = MovieDetailsPresenter(
					movieModel: movieModelMock,
					view: viewMock
				)
				
			}
			
			describe("on load") {
				it("show movie model with view") {
					sut.load()
					expect(viewMock.showedMovie).to(equal(movieModelMock))
				}
			}
		}
	}
}
