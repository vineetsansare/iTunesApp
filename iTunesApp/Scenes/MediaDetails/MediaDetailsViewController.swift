//
//  MediaDetailsViewController.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 18/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import AVKit

protocol MediaDetailsDisplayLogic: AnyObject {
    func displayInfo(viewModel: MediaResponseModel)
}

class MediaDetailsViewController: UIViewController {
    var interactor: MediaDetailsBusinessLogic?
    var router: (NSObjectProtocol & MediaDetailsRoutingLogic & MediaDetailsDataPassing)?
    var data: MediaResponseModel?
    
    @IBOutlet private (set) weak var mediaTitleLabel: UILabel?
    @IBOutlet private (set) weak var trackTitleLabel: UILabel?
    @IBOutlet private (set) weak var playButton: UIButton?
    @IBOutlet private (set) weak var imageView: CoreWebImageView?
    @IBOutlet private (set) weak var priceLabel: UILabel?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = MediaDetailsInteractor()
        let presenter = MediaDetailsPresenter()
        let router = MediaDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        informInteractor()
    }
    
    func informInteractor() {
        interactor?.updateDetail()
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        if let videoURL = data?.previewUrl {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
}

extension MediaDetailsViewController: MediaDetailsDisplayLogic {
    func displayInfo(viewModel: MediaResponseModel) {
        data = viewModel
        mediaTitleLabel?.text = viewModel.trackName ?? viewModel.collectionName
        trackTitleLabel?.text = viewModel.artistName.isEmpty ? nil : "(\(viewModel.artistName))"
        imageView?.loadImageUsingUrlString(url: viewModel.artworkUrl100, placeHolderImage: nil)
        playButton?.isHidden = !(viewModel.previewUrl != nil)
        
        if let collectionPrice = viewModel.collectionPrice {
            let price = collectionPrice == 0.0 ? "Free" : "\(collectionPrice) \(viewModel.currency ?? "$")"
            priceLabel?.text = "\("Price"): \(price)\n\(viewModel.copyright ?? "")"
        }
        
        if let _ = viewModel.collectionViewUrl {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search,
                                                                target: self, action: #selector(openBrowser))
        }
    }
    
    @objc private func openBrowser() {
        if let collectionViewUrl = data?.collectionViewUrl {
            if UIApplication.shared.canOpenURL(collectionViewUrl) {
                UIApplication.shared.open(collectionViewUrl, completionHandler: nil)
            }
        }
    }
}
