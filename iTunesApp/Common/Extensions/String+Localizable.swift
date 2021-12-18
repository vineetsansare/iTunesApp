//
//  String+Localizable.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 16/12/2021.
//

import Foundation

extension String {
    static func localizeStringForKey(_ key: String, fileName paramFileName: String = "iTunes-Localization") -> String {
        return NSLocalizedString(key, tableName: paramFileName, bundle: Bundle.main, comment: key)
    }
}
