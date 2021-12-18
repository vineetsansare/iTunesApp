//
//  Helper.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 16/12/2021.
//

import Foundation

struct UIStrings {
    private static func localizedText(for key: String) -> String {
        return String.localizeStringForKey(key, fileName: CoreConstants.localizedFile)
    }

    ///MARK: SearchCriteria screen
    static let emptySearchErrorMessage = localizedText(for: "EmptySearchErrorMessage")
    
    ///MARK: SearchTermSelector screen    
}
