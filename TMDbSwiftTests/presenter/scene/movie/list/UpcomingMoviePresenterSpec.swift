//
//  UpcomingMoviePresenterSpec.swift
//  TMDbSwiftTests
//
//  Created by Guilherme Cherubini on 14/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TMDbSwift

class UpcomingMoviesPresenterSpec: QuickSpec {
	override func spec() {
		var movieInteractorMock: MovieInteractor!
		var viewMock: UpcomingMoviesViewMock!
		var delegateMock: UpcomingMoviesDelegateMock!

		var sut: UpcomingMoviesPresenter!
		
		describe("UpcomingMoviesPresenter") {
			beforeEach {
				viewMock = UpcomingMoviesViewMock()
				movieInteractorMock = MovieInteractorMock()
				delegateMock = UpcomingMoviesDelegateMock()
			}
			
			describe("on load") {
				it("toogle indicator as active") {
					movieInteractorMock = MovieInteractorMock(callFetchComplete: false)
					sut = UpcomingMoviesPresenter(
						view: viewMock,
						interactor: movieInteractorMock,
						delegate: delegateMock
					)
					
					sut.load()
					expect(viewMock.isIndicatorActive).to(beTrue())
				}
				
				it("fetch and show upcoming movies") {
					let moviesModelsMock = [
						MovieModel(title: "Title", imageUrl: "ImageUrl", overview: "Overview", genres: "Genre1, Genre2", releaseDate: "Date")
					]
					
					movieInteractorMock = MovieInteractorMock(
						moviesModelMock: moviesModelsMock,
						errorMock: nil)
		
					sut = UpcomingMoviesPresenter(
						view: viewMock,
						interactor: movieInteractorMock)
					
					sut.load()
					
					expect(viewMock.showedMovies).to(equal(moviesModelsMock))
					expect(viewMock.isIndicatorActive).to(beFalse())
					expect(viewMock.hasEndedPullRefresh).to(beTrue())
				}
				
				it("show no data found error when movies model are empty") {
					let moviesModelsMock = [MovieModel]()
					
					movieInteractorMock = MovieInteractorMock(
						moviesModelMock: moviesModelsMock,
						errorMock: nil)
					
					sut = UpcomingMoviesPresenter(
						view: viewMock,
						interactor: movieInteractorMock)
					
					sut.load()
					
					expect(viewMock.showedError).to(equal("No data found"))
					expect(viewMock.isIndicatorActive).to(beFalse())
					expect(viewMock.hasEndedPullRefresh).to(beTrue())
				}
				
				it("show generic error when movies list is nil") {
					let moviesModelsMock: [MovieModel]? = nil
					
					movieInteractorMock = MovieInteractorMock(
						moviesModelMock: moviesModelsMock)
					
					sut = UpcomingMoviesPresenter(
						view: viewMock,
						interactor: movieInteractorMock)
					
					sut.load()
					
					expect(viewMock.showedError).to(equal("Some error happened retrieving data"))
					expect(viewMock.isIndicatorActive).to(beFalse())
					expect(viewMock.hasEndedPullRefresh).to(beTrue())
				}
			}
			
			describe("on movie selection") {
				it("fire didSelect delegate") {
					sut = UpcomingMoviesPresenter(
						view: viewMock,
						interactor: movieInteractorMock,
						delegate: delegateMock
					)
					let movieMock: MovieModel =
						MovieModel(title: "", imageUrl: "", overview: "", genres: "", releaseDate: "")
					sut.didSelect(movie: movieMock)
					expect(delegateMock.didSelectMovie).to(equal(movieMock))
				}
			}
		}
	}
}
