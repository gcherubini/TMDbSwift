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
		titleLabel.text = movie.title ?? "Unknown Title"
		genresLabel.text = movie.genres ?? "Unknown Genres"
		releaseDateLabel.text = movie.releaseDate ?? "Unknown Date"
		overviewLabel.text = movie.overview ?? "Unknown Overview"
	}
}
