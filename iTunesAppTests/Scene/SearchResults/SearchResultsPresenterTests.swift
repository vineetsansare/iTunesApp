//
//  SearchResultsPresenterTests.swift
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

class SearchResultsPresenterTests: QuickSpec {
    override func spec() {
        describe("SearchResultsPresenterTests tests") {
            
            // MARK: Subject under test
            var sut: SearchResultsPresenter!
            var searchResult: SearchResult!
            var spy: SearchResultsPresenterSpy!
            
            beforeSuite {
                SearchMediaNetworkInjector.networkManager = MediaServiceMock()
                setupLaunchesPresenter()
                searchResult = SearchResult.stub()
            }
            
            // MARK: Test setup
            func setupLaunchesPresenter() {
                sut = SearchResultsPresenter()
            }
            
            // MARK: Test doubles
            class SearchResultsPresenterSpy: SearchResultsDisplayLogic {
                var showResultCalled = false
                
                func showResult(items: [[MediaResponseModel]], types: [String]) {
                    showResultCalled = true
                }
            }
            
            // MARK: Tests
            context("when interactor calls showResult func with proper data") {
                beforeEach {
                    spy = SearchResultsPresenterSpy()
                    sut.viewController = spy
                    let results = [searchResult.results!]
                    sut.showResult(items: results,
                                   types: ["Album","Artist","Book","Movie","Music Video","Podcast","Song"])
                }
                it("should show results on screen") {
                    expect(spy.showResultCalled).to(beTrue())
                }
            }
            
//            context("when interactor calls presentResultsScreenWith func with empty media objects") {
//                beforeEach {
//                    spy = SearchResultsPresenterSpy()
//                    sut.viewController = spy
//                    sut.showResult(items: [],
//                                   types: [])
//                }
//                it("should show results on screen") {
//                    expect(spy.showResultCalled).to(beTrue())
//                }
//            }
        }
    }
}
