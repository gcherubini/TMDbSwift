//
//  MovieApi.swift
//  TMDbSwift
//
//  Created by Guilherme Cherubini on 13/08/19.
//  Copyright © 2019 gcherubini. All rights reserved.
//

import Foundation
import Moya

enum MovieApi {
	case getMovies
	case getGenres
}

extension MovieApi: TargetType {
	private var apiKey: String { return "1f54bd990f1cdfb230adb312546d765d" }
	var baseURL: URL { return URL(string: "https://api.themoviedb.org/3")! }
	
	var path: String {
		switch self {
		case .getMovies:
			return "/movie/upcoming"
		case .getGenres:
			return "/genre/movie/list"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .getMovies, .getGenres:
			return .get
		}
	}
	
	var task: Task {
		switch self {
		case .getMovies, .getGenres:
			return .requestParameters(parameters: ["apikey": apiKey], encoding: URLEncoding.queryString)
		}
	}
	
	var sampleData: Data {
		switch self {
		case .getMovies, .getGenres:
			return Data()
		}
	}
	
	var headers: [String: String]? {
		return ["Content-type": "application/x-www-form-urlencoded"]
	}
}
