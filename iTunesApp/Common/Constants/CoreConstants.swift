//
//  CoreConstants.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 16/12/2021.
//

import UIKit

struct CoreConstants {
    static let localizedFile = "iTunes-Localization"    
    
    struct Fonts {
        static let HELVETICA_NEUE = "HelveticaNeue"
        static let HELVETICA_NEUE_BOLD = "HelveticaNeue-Bold"
    }
    
    struct ImagePlaceHolders {
        static let artist = "artist"
    }
    
    struct CellIdentifiers {
        static let mediaTypeCell = "mediaTypeCell"
        static let gridCellIdentifier = "gridCell"
        static let listCellIdentifier = "listCell"
    }
    
    struct SegueIdentifiers {
        static let segueToMediaTypeSelector = "segueToMediaTypeSelector"
    }
    
    struct Themes {
        static let primaryColor: UIColor = .white
        static let secondaryColor: UIColor = .lightGray
        static let secondaryDarkColor: UIColor = .lightGray
        static let backgroundColor: UIColor = .black
    }
}


extension UIColor {
    class var translucent: UIColor {
           return  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
}
