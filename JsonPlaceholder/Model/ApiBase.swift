
//
//  ApiBase.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/14/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//
import Foundation
struct ApiBase : Codable {
	let albumId : Int?
	let id : Int?
	let title : String?
	let url : String?
	let thumbnailUrl : String?

	enum CodingKeys: String, CodingKey {

		case albumId = "albumId"
		case id = "id"
		case title = "title"
		case url = "url"
		case thumbnailUrl = "thumbnailUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		albumId = try values.decodeIfPresent(Int.self, forKey: .albumId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
	}

}
