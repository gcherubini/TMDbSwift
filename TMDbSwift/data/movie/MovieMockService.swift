//
//  MovieService.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

class MovieMockService: MovieRepository {
	func getMovies(completion: @escaping ([MovieModel]?, Error?) -> ()) {
		completion([
			MovieModel(title: "Fast & Furious Presents: Hobbs & Shaw",
					   imageUrl: "/keym7MPn1icW1wWfzMnW3HeuzWU.jpg",
					   overview: "A spinoff of The Fate of the Furious, focusing on Johnson's US Diplomatic Security Agent Luke Hobbs forming an unlikely alliance with Statham's Deckard Shaw.\r Director: David Leitch Writers: Chris Morgan (story by), Chris Morgan (screenplay by) And Stars:  More Details:-https://4igpost.in/TMDB  Dwayne Johnson, Jason Statham, Idris Elba",
					   genres: "Action",
					   releaseDate: "2019-08-02"),
			MovieModel(title: "The Divine Fury",
					   imageUrl: "/4MDYpCwqSVO5RcTiZ4GEfePzDdl.jpg",
					   overview: "Yong-hu, a world champion martial artist who believes in no God, only himself, suddenly develops stigmata on his palms. Visiting a church in hopes of healing the stigmata, he ends up saving Father Ahn, who falls into danger while performing an exorcism. In this way he learns of the power of the stigmata. As time passes Yong-hu accepts his new calling and begins saving people who are possessed by demons, but then he must prepare for a final confrontation with the evil Jisin, who ensnares people with the power of the devil.",
					   genres: "Drama",
					   releaseDate: "2019-07-31"),
			MovieModel(title: "Scary Stories to Tell in the Dark",
					   imageUrl: "/spCU6e6opWCmA3Q0SdKhsMqo5OI.jpg",
					   overview: "The shadow of the Bellows family has loomed large in the small town of Mill Valley for generations. It's in a mansion that young Sarah Bellows turns her tortured life and horrible secrets into a series of scary stories. These terrifying tales soon have a way of becoming all too real for a group of unsuspecting teens who stumble upon Sarah's spooky home.",
					   genres: "Action",
					   releaseDate: "2019-08-08"),
		], nil)
	}
}

