//
//  MovieService.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class MovieMockService: MovieRepository {
	func getMovies(completion: @escaping ([Movie]?, Error?) -> ()) {
		completion([
			Movie(id: 1,
				  title: "Fast & Furious Presents: Hobbs & Shaw",
				  posterImageUrl: "/keym7MPn1icW1wWfzMnW3HeuzWU.jpg",
				  overview: "A spinoff of The Fate of the Furious, focusing on Johnson's US Diplomatic Security Agent Luke Hobbs forming an unlikely alliance with Statham's Deckard Shaw.\r Director: David Leitch Writers: Chris Morgan (story by), Chris Morgan (screenplay by) And Stars:  More Details:-https://4igpost.in/TMDB  Dwayne Johnson, Jason Statham, Idris Elba",
				  releaseDate: "2019-08-02",
				  genreIds: [8,3,2]
			),
			Movie(id: 2,
				  title: "The Divine Fury",
				  posterImageUrl: "/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg",
				  overview: "Yong-hu, a world champion martial artist who believes in no God, only himself, suddenly develops stigmata on his palms. Visiting a church in hopes of healing the stigmata, he ends up saving Father Ahn, who falls into danger while performing an exorcism. In this way he learns of the power of the stigmata. As time passes Yong-hu accepts his new calling and begins saving people who are possessed by demons, but then he must prepare for a final confrontation with the evil Jisin, who ensnares people with the power of the devil.",
				  releaseDate: "2019-07-31",
				  genreIds: [3,1,6]
			),
			Movie(id:3,
				  title: nil,
				  posterImageUrl: "/w185/9Z2qT9iZYLzzsCSYu7A4SEQsKX0.jpg",
				  overview: "Yong-hu, a world champion martial artist who believes in no God, only himself, suddenly develops stigmata on his palms. Visiting a church in hopes of healing the stigmata, he ends up saving Father Ahn, who falls into danger while performing an exorcism. In this way he learns of the power of the stigmata. As time passes Yong-hu accepts his new calling and begins saving people who are possessed by demons, but then he must prepare for a final confrontation with the evil Jisin, who ensnares people with the power of the devil. Visiting a church in hopes of healing the stigmata, he ends up saving Father Ahn, who falls into danger while performing an exorcism. In this way he learns of the power of the stigmata. As time passes Yong-hu accepts his new calling and begins saving people who are possessed by demons, but then he must prepare for a final confrontation with the evil Jisin, who ensnares people with the power of the devil Visiting a church in hopes of healing the stigmata, he ends up saving Father Ahn, who falls into danger while performing an exorcism. In this way he learns of the power of the stigmata. As time passes Yong-hu accepts his new calling and begins saving people who are possessed by demons, but then he must prepare for a final confrontation with the evil Jisin, who ensnares people with the power of the devil",
				  releaseDate: "2019-07-31",
				  genreIds: [3, 4, 5, 1, 2, 3, 1, 2, 3, 4, 5, 6, 7, 8, 9]
			),
			Movie(id: 4,
				  title: "Scary Faces",
				  posterImageUrl: "/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg",
				  overview: nil,
				  releaseDate: nil,
				  genreIds: nil
			),
			Movie(id: 5,
				  title: "Scary Stories and animated to Tell in the Dark and on the Clouds",
				  posterImageUrl: nil,
				  overview: "The shadow of the Bellows family has loomed large in the small town of Mill Valley for generations. It's in a mansion that young Sarah Bellows turns her tortured life and horrible secrets into a series of scary stories. These terrifying tales soon have a way of becoming all too real for a group of unsuspecting teens who stumble upon Sarah's spooky home.",
				  releaseDate: "2019-08-08",
				  genreIds: [1, 2]
			),
		], nil)
	}
}

