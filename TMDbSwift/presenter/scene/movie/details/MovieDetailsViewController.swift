//
//  MovieDetailsViewController.swift
//  
//
//  Created by Guilherme Cherubini on 15/08/19.
//

import UIKit

protocol MovieDetailsView {
	func show(movie: MovieModel)
}

class MovieDetailsViewController: UIViewController {

	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var genresLabel: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!
	@IBOutlet weak var overviewLabel: UITextView!

	var presenter: MovieDetailsPresenter?

	override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.load()
    }
}

extension MovieDetailsViewController: MovieDetailsView {
	func show(movie: MovieModel) {
		posterImage.load(url: movie.imageUrl)
		titleLabel.text = movie.title ??
			NSLocalizedString("unknown title", comment: "Unknown title message when value is nil")
		genresLabel.text = movie.genres ??
			NSLocalizedString("unknown genres", comment: "Unknown genres message when value is nil")
		releaseDateLabel.text = movie.releaseDate ??
			NSLocalizedString("unknown", comment: "Unknown release date message when value is nil")
		overviewLabel.text = movie.overview ??
			NSLocalizedString("unknown overview", comment: "Unknown overview message when value is nil")
	}
}
