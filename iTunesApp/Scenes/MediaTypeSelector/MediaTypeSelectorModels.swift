//
//  MediaTypeSelectorModels.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 17/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum MediaTypeSelector
{
  // MARK: Use cases
  
  enum MediaType
  {
    struct Request
    {
        var mediaTypes: [String]
    }
    struct Response
    {
        var mediaTypes: [String]
    }
    struct ViewModel
    {
        var mediaTypes: [String]
    }
  }
}
