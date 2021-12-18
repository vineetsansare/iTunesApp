//
//  URLRequestBuilder.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//

import Foundation
import Alamofire

enum URLRequestBuilder {
    case searchMedia(term: String, entity: String)
}

extension URLRequestBuilder: URLRequestConvertible {
    
    var method: HTTPMethod {
        switch self {
        case .searchMedia:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .searchMedia:
            return NetworkConstants.SearchPath.mediaSearch
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .searchMedia(let term, let entity):
            return [NetworkConstants.Search.term: term,
                    NetworkConstants.Search.entity: entity]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest
        let url = try NetworkConstants.BaseURL.itunesBaseUrl.asURL()
        // Create urlRequest
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // Set method
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        // Set parameters
        urlRequest = try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        // Set max timeout time
        urlRequest.timeoutInterval = NetworkConstants.requestTimeOut
        return urlRequest
    }
}

