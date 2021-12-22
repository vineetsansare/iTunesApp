//
//  MediaDetailsViewControllerTests.swift
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

class MediaDetailsViewControllerTests: QuickSpec {
    
    override func spec() {
        describe("MediaDetailsViewController Tests") {
            // MARK: Subject under test
            var sut: MediaDetailsViewController!
            var window: UIWindow!
            var mediaDetailsBusinessLogicSpy: MediaDetailsBusinessLogicSpy!
            
            // MARK: Test setup
            func setupMediaDetailsViewController() {
                sut = MediaDetailsViewController()
            }
            
            beforeEach {
                window = UIWindow(frame: UIScreen.main.bounds)
                setupMediaDetailsViewController()
            }
            
            afterEach {
                window = nil
            }
            
            func loadview() {
                window.addSubview(sut.view)
                sut.beginAppearanceTransition(true, animated: false)
                sut.endAppearanceTransition()
            }
            
            // MARK: Test doubles
            class MediaDetailsBusinessLogicSpy: MediaDetailsBusinessLogic {
                var updateDetailCalled = false

                func updateDetail() {
                    updateDetailCalled = true
                }
            }
            
            //MARK: - Test
            context("when view is loaded") {
                beforeEach {
                    mediaDetailsBusinessLogicSpy = MediaDetailsBusinessLogicSpy()
                    sut.interactor = mediaDetailsBusinessLogicSpy
                    let media = SearchResult.stub()?.results?.first!
                    sut.data = media
                    sut.interactor?.updateDetail()
                    loadview()
                }
                
                it("should be a MediaDetailsViewController") {
                    expect(sut).to(beAKindOf(MediaDetailsViewController.self))
                }
                
                it("should call updateMedia on interactor") {
                    expect(mediaDetailsBusinessLogicSpy.updateDetailCalled).to(beTrue())
                }
            }
        }
    }
}
