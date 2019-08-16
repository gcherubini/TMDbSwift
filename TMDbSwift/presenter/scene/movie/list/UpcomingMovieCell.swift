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
		title.text = movieModel.title ??
			NSLocalizedString("unknown title", comment: "Unknown title message when value is nil")
		genres.text = movieModel.genres ??
			NSLocalizedString("unknown genres", comment: "Unknown genres message when value is nil")
		releaseDate.text = movieModel.releaseDate ??
			NSLocalizedString("unknown release date", comment: "Unknown date message when value is nil")
	}
}
