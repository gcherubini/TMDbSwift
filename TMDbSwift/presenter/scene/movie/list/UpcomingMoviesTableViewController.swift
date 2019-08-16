//
//  UpcomingMoviesViewController.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation

import UIKit

protocol UpcomingMoviesView: class {
	func endPullRefreshControl()
	func toogleIndicator(active: Bool)
	func show(movies: [MovieModel])
	func show(error: String)
}

class UpcomingMoviesTableViewController: UITableViewController {

	var presenter: UpcomingMoviesPresenter?

	var movies = [MovieModel]()

	private var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
	private var errorLabel: UILabel = UILabel()

	// MARK: View lifecycle
	override func viewDidLoad() {
		self.navigationItem.title = "Upcoming movies"
		setupIndicatorView()
		setupTableView()
		presenter?.load()
	}

	// MARK: Setup UI
	private func setupIndicatorView() {
		indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
		indicator.style = .gray
		indicator.center = self.view.center
		indicator.hidesWhenStopped = true
	}

	func setupTableView() {
		refreshControl = UIRefreshControl()
		if let refreshControl = refreshControl {
			refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
			tableView.refreshControl = refreshControl
		}

		setupTableErrorLabel()
	}

	private func setupTableErrorLabel() {
		errorLabel = UILabel(frame: CGRect(x: 0,
										   y: 0,
										   width: tableView.bounds.size.width,
										   height: tableView.bounds.size.height))
		errorLabel.textColor = .black
		errorLabel.textAlignment = .center
	}

	// MARK: TableView configuration
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = Bundle.main.loadNibNamed(UpcomingMovieCell.cellNibName, owner: self, options: nil)?.first as? UpcomingMovieCell
		cell?.loadMovie(with: movies[indexPath.row])
		return cell ?? UITableViewCell()
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter?.didSelect(movie: movies[indexPath.row])
	}

	@objc private func didPullToRefresh(_ sender: Any) {
		presenter?.load()
	}
}

extension UpcomingMoviesTableViewController: UpcomingMoviesView {
	func endPullRefreshControl() {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }

			self.refreshControl?.endRefreshing()
		}
	}

	func toogleIndicator(active: Bool) {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }

			if active {
				self.indicator.startAnimating()
				self.view.addSubview(self.indicator)
				self.tableView.backgroundView = self.indicator
			} else {
				self.indicator.stopAnimating()
			}
		}
	}

	func show(error: String) {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }

			self.errorLabel.text = error
			self.tableView.backgroundView = self.errorLabel
		}
	}

	func show(movies: [MovieModel]) {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }

			self.movies = movies
			self.tableView.reloadData()
		}
	}
}
