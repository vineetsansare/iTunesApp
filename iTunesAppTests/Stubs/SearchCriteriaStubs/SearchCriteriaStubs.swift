//
//  SearchCriteriaStubs.swift
//  iTunesAppTests
//
//  Created by Vineet Sansare on 22/12/2021.
//

import Foundation
@testable import iTunesApp

extension SearchResult {
    static func stub(fileName: String? = "itunesSearchResponse")-> SearchResult? {
        guard let file = fileName, let jsonData = JSONHelper.readLocalJSONFile(forName: file),
              let model = try? JSONDecoder().decode(SearchResult.self, from: jsonData) else {
            return nil
        }
        return model
    }
}
