//
//  NetworkConstants.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 17/12/2021.
//

import Foundation

struct NetworkConstants {
    static let requestTimeOut = 4.0
    static let retryInterval = 1.0
    static let validationRange = 200..<300

    struct Search {
        static let term = "term"
        static let entity = "entity"
    }
    
    struct Servers {
        /** In Real World: Change this later to production url */
        static let production = "PROD_URL"
        static let development = "DEV_URL"
    }
    
    struct BaseURL {
        static let itunesBaseUrl = "https://itunes.apple.com/"
    }

    struct SearchPath {
        static let mediaSearch = "search"
    }
}
