//
//  SearchCriteriaPresenterTests.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 21/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import iTunesApp
import Quick
import Nimble

class SearchCriteriaPresenterTests: QuickSpec {
    override func spec() {
        describe("SearchCriteriaPresenterTests tests") {
            
            // MARK: Subject under test
            var sut: SearchCriteriaPresenter!
            var searchResult: SearchResult!
            var spy: SearchCriteriaPresenterSpy!
            
            beforeSuite {
                SearchMediaNetworkInjector.networkManager = MediaServiceMock()
                setupLaunchesPresenter()
                searchResult = SearchResult.stub()
            }
            
            // MARK: Test setup
            func setupLaunchesPresenter() {
                sut = SearchCriteriaPresenter()
            }
            
            // MARK: Test doubles
            class SearchCriteriaPresenterSpy: SearchCriteriaDisplayLogic {
                var showResultScreenCalled = false
                var showErrorCalled = false
                var showMediaTypeSelectorCalled = false
                
                func showResultScreenWith(viewModel: SearchCriteria.Entity.ViewModel) {
                    showResultScreenCalled = true
                }
                
                func showError(message: String) {
                    showErrorCalled = true
                }
                
                func showMediaTypeSelectorWith(viewModel: SearchCriteria.SelectedEntity.ViewModel) {
                    showMediaTypeSelectorCalled = true
                }
            }
            
            // MARK: Tests
            context("when interactor calls presentResultsScreenWith func with proper response") {
                beforeEach {
                    spy = SearchCriteriaPresenterSpy()
                    sut.viewController = spy
                    let results = [searchResult.results!]
                    let response = SearchCriteria.Entity.Response(media: results,
                                                                  types: ["Album","Artist","Book","Movie","Music Video","Podcast","Song"])
                    sut.presentResultScreenWith(response: response)
                }
                it("should show results on screen") {
                    expect(spy.showResultScreenCalled).to(beTrue())
                }
            }
            
            context("when interactor calls presentResultsScreenWith func with empty media objects") {
                beforeEach {
                    spy = SearchCriteriaPresenterSpy()
                    sut.viewController = spy
                    sut.presentError(message: "Something's wrong")
                }
                it("should show results on screen") {
                    expect(spy.showErrorCalled).to(beTrue())
                }
            }
            
            context("when interactor calls presentResultsScreenWith func with empty media objects") {
                beforeEach {
                    spy = SearchCriteriaPresenterSpy()
                    sut.viewController = spy
                    let response = SearchCriteria.SelectedEntity.Response(types: ["Album","Artist","Book","Movie","Music Video","Podcast","Song"])
                    sut.presentMediaTypeSelector(response: response)
                }
                it("should show results on screen") {
                    expect(spy.showMediaTypeSelectorCalled).to(beTrue())
                }
            }
        }
    }
}