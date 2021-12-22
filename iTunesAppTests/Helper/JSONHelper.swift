//
//  JSONHelper.swift
//  iTunesAppTests
//
//  Created by Vineet Sansare on 22/12/2021.
//

import Foundation

class JSONHelper {
    class func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
