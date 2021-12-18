//
//  AppEnvironement.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 17/12/2021.
//

import Foundation

enum AppEnvironement {
    case production
    case development
}

extension AppEnvironement {
    static var currentState: AppEnvironement {
        return .development
    }
}

//swiftlint:disable force_unwrapping
extension AppEnvironement {
    static var baseURL: URL {
        switch AppEnvironement.currentState {
        case .production:
            return URL(string: NetworkConstants.Servers.production)!
        case .development:
            return URL(string: NetworkConstants.Servers.development)!
        }
    }
}

extension AppEnvironement {
    static var showLog: Bool {
        switch AppEnvironement.currentState {
        case .production:
            return false
        case .development:
            return true
        }
    }
}
