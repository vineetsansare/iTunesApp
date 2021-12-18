//
//  SearchResultsPresenter.swift
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

protocol SearchResultsPresentationLogic {
    func showResult(items: [[MediaResponseModel]], types: [String])
}

class SearchResultsPresenter: SearchResultsPresentationLogic {
    weak var viewController: SearchResultsDisplayLogic?
    
    func showResult(items: [[MediaResponseModel]], types: [String]) {
        viewController?.showResult(items: items, types: types)
    }
}
