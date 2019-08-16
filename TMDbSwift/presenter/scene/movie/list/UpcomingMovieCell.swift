//
//  UpcomingMovieCell.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import UIKit

class UpcomingMovieCell: UITableViewCell {

	static let cellNibName = "UpcomingMovieCell"

	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var genres: UILabel!
	@IBOutlet weak var releaseDate: UILabel!

	func loadMovie(with movieModel: MovieModel) {
		posterImage.load(url: movieModel.imageUrl)
		title.text = movieModel.title ?? "Unknown Title"
		genres.text = movieModel.genres ?? "Unknown Genre"
		releaseDate.text = movieModel.releaseDate ?? "Unknown Release Date"
	}
}
