//
//  YoutubeSearchResponse.swift
//  netflix
//
//  Created by Duver on 10/1/23.
//

import Foundation

struct YoutubeSearchResponse: Codable{
  let items: [VideoElement]
}

struct VideoElement: Codable{
  let id: IdVideoElement
}

struct IdVideoElement: Codable {
  let kind: String
  let videoId: String
}
