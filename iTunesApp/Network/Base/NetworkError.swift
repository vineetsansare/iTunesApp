//
//  NetworkError.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//

import Foundation

enum NetworkError: Error {
    case generalServiceError
    case badRequestError
    case unauthorisedError
    case serviceUnavailable
    case jsonParsingError
}

enum StatusCodes: Int {
    case code400BadRequest = 400
    case code401Unauthorised = 401
    case code403Forbidden = 403
    case code404NotFound = 404
    case code500InternalServerError = 500
    case code501NotImplemented = 501
    case code502BadGateway = 502
    case code503ServiceUnavailable = 503
    
    var code: Int {
        return rawValue
    }
    
    static func apiErrorType(_ statusCode: Int) -> NetworkError {
        switch statusCode {
        case StatusCodes.code400BadRequest.code:
            return .badRequestError
        case StatusCodes.code401Unauthorised.code:
            return .unauthorisedError
        case StatusCodes.code500InternalServerError.code:
            return .serviceUnavailable
        default:
            return .generalServiceError
        }
    }
}
