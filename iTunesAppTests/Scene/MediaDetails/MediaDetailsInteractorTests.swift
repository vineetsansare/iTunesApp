//
//  MediaDetailsInteractorTests.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 23/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import iTunesApp
import Quick
import Nimble

class MediaDetailsInteractorTests: QuickSpec {
    override func spec() {
        describe("MediaDetailsInteractor Tests") {
            // MARK: Subject under test
            var sut: MediaDetailsInteractor!
            var mediaDetailsPresentationLogicSpy: MediaDetailsPresentationLogicSpy!
            
            beforeEach {
                setupLaunchesInteractor()
            }
            
            // MARK: Test setup
            func setupLaunchesInteractor() {
                sut = MediaDetailsInteractor()
            }
            
            // MARK: Test doubles
            class MediaDetailsPresentationLogicSpy: MediaDetailsPresentationLogic {
                var presentCalled = false
                
                func present(item: MediaResponseModel) {
                    presentCalled = true
                }
                
            }
            
            // MARK: Tests
            context("when updateWithSelectedMedia is called on interactor") {
                beforeEach {
                    setupLaunchesInteractor()
                    mediaDetailsPresentationLogicSpy = MediaDetailsPresentationLogicSpy()
                    sut.presenter = mediaDetailsPresentationLogicSpy
                    sut.itemDetail = SearchResult.stub()?.results?.first!
                    sut.updateDetail()
                }
                it("should call presentSearchCriteriaCalled") {
                    expect(mediaDetailsPresentationLogicSpy.presentCalled).to(beTrue())
                }
            }            
        }
    }
}
