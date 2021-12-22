//
//  NetworkMock.swift
//  iTunesAppTests
//
//  Created by Vineet Sansare on 22/12/2021.
//

import Foundation
@testable import iTunesApp

final class MediaServiceMock: MediaServiceProtocol {
    let networkClient: NetworkClientProtocol
    var searchMovieCalled: Bool = false
    
    init(networkClient: NetworkClientProtocol = NetworkClient.shared) {
        self.networkClient = networkClient
    }
    
    func searchMovie(term: String, entity: String,
                     success: @escaping (SearchResult) -> Void, failure: @escaping(FailureCompletion)) {
        searchMovieCalled = true
        networkClient.makeRequest(route: .searchMedia(term: term, entity: entity),
                                  responseModel: SearchResult.self, success: success, failure: failure)
    }
}


//MARK: Dependency Injectors

/// Name of the protocol to inject the network dependency managing the launches
protocol SearchMediaNetworkInjected { }

/// Structure used to inject a instance of MediaService into the SearchMediaNetworkInjected protocol
struct SearchMediaNetworkInjector {
    static var networkManager: MediaServiceProtocol = MediaService()
//    static var networkManager: LaunchesDataManager = LaunchesNetworkManager()
}

// MARK: - Extension of protocol including variable containing mechanism to inject
extension SearchMediaNetworkInjected {
    var searchMediaDataManager: MediaServiceProtocol {
        return SearchMediaNetworkInjector.networkManager
    }
}
