//
//  Tv.swift
//  netflix
//
//  Created by Duver on 5/1/23.
//

import Foundation

struct TrendingTvResponse: Codable{
  var results:[Tv]
  
}

struct Tv: Codable{
  let id: Int
  let media_type: String?
  let original_name: String?
  let original_title: String?
  let poster_path: String?
  let overview: String?
  let vote_count: Int
  let release_date: String?
  let vote_average: Double
}
