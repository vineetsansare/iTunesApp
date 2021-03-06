//
//  SearchResultsInteractorTests.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 22/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import iTunesApp
import Quick
import Nimble

class SearchResultsInteractorTests: QuickSpec {
    override func spec() {
        describe("SearchResultsInteractor tests") {
            // MARK: Subject under test
            var sut: SearchResultsInteractor!
            var searchResultsPresentationLogicSpy: SearchResultsPresentationLogicSpy!
            
            beforeEach {
                setupLaunchesInteractor()
            }
            
            // MARK: Test setup
            func setupLaunchesInteractor() {
                sut = SearchResultsInteractor()
            }
            
            // MARK: Test doubles
            class SearchResultsPresentationLogicSpy: SearchResultsPresentationLogic {
                var showResultCalled = false
                
                func showResult(items: [[MediaResponseModel]], types: [String]) {
                    showResultCalled = true
                }
            }
            
            // MARK: Tests
            context("when updateMedia is called on interactor") {
                beforeEach {
                    setupLaunchesInteractor()
                    let searchResults = SearchResult.stub()
                    searchResultsPresentationLogicSpy = SearchResultsPresentationLogicSpy()
                    if let media = searchResults?.results {
                        sut.searchedItems = [media]
                    }
                    sut.types = ["Album","Artist","Book","Movie","Music Video","Podcast","Song"]
                    sut.presenter = searchResultsPresentationLogicSpy
                    sut.updateMedia()
                }
                it("should call showResultCalled") {
                    expect(searchResultsPresentationLogicSpy.showResultCalled).to(beTrue())
                }
            }
        }
    }
}
