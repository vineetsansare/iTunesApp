//
//  MediaService.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//

import Foundation

protocol MediaServiceProtocol: NetworkServiceProtocol {
    func searchMovie(term: String, entity: String,
                     success: @escaping (SearchResult) -> Void, failure: @escaping(FailureCompletion))
}

class MediaService: MediaServiceProtocol {
    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol = NetworkClient.shared) {
        self.networkClient = networkClient
    }

    func searchMovie(term: String, entity: String,
                     success: @escaping (SearchResult) -> Void,
                     failure: @escaping(FailureCompletion)) {
        networkClient.makeRequest(route: .searchMedia(term: term,
                                                      entity: entity),
                              responseModel: SearchResult.self,
                              success: success,
                              failure: failure)
    }
}
