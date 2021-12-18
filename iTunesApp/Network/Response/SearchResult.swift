//
//  SearchResult.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int?
    let results: [MediaResponseModel]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([MediaResponseModel].self, forKey: .results)
    }
}
