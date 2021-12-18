//
//  NetworkClient.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//

import Foundation
import Alamofire

protocol NetworkClientProtocol {
    func makeRequest<T>(route: URLRequestBuilder, responseModel: T.Type,
                        success: @escaping (T) -> Void,
                        failure: @escaping (Error, NetworkError) -> Void) where T: Decodable
}

protocol NetworkServiceProtocol {
    var networkClient: NetworkClientProtocol { get }
}

typealias FailureCompletion = (Error, NetworkError) -> Void

final class NetworkClient: NetworkClientProtocol {
    
    static let shared = NetworkClient()
    
    private init() { }
    
    // MARK: - Alamofire manager
    private var AFManager: Alamofire.Session = {
        let interceptor = Interceptor.init(adapters: [], retriers: [RetryPolicy(retryLimit: 1)])
        let session = Alamofire.Session(interceptor: interceptor)
        session.sessionConfiguration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return session
    }()
    
    //MARK: Network service
    func makeRequest<T>(route: URLRequestBuilder, responseModel: T.Type, success: @escaping (T) -> Void, failure: @escaping (Error, NetworkError) -> Void) where T: Decodable {
        AFManager.request(route)
            .validate(statusCode: NetworkConstants.validationRange)
            .responseDecodable(of: responseModel) { (response) in
                switch response.result {
                case .success(let data):
                    success(data)
                case .failure(let error):
                    guard let statusCode = response.response?.statusCode else {
                        failure(error, NetworkError.generalServiceError)
                        return
                    }
                    failure(error, StatusCodes.apiErrorType(statusCode))
                }
            }
    }
}

