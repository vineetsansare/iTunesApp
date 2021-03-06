//
//  SearchResultsViewController.swift
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
import CollectionKit
import SnapKit

protocol SearchResultsDisplayLogic: AnyObject {
    func showResult(items: [[MediaResponseModel]], types: [String])
}

class SearchResultsViewController: BaseViewController, SearchResultsDisplayLogic {
    var interactor: SearchResultsBusinessLogic?
    var router: (NSObjectProtocol & SearchResultsRoutingLogic & SearchResultsDataPassing)?
    var dataSources = [ArrayDataSource<MediaResponseModel>]()
    var sourcesType = [String]()
    let columnTypeView = UIView()
    
    @IBOutlet private (set) weak var segmentedControl: UISegmentedControl?
    @IBOutlet private (set) weak var collectionView: CollectionView?
    
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
        let interactor = SearchResultsInteractor()
        let presenter = SearchResultsPresenter()
        let router = SearchResultsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func infromInteractor() {
        interactor?.updateMedia()
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        infromInteractor()
    }
    
    func showResult(items: [[MediaResponseModel]], types: [String]) {
        print("\n\n SearchResults for \(types) - \n \(items) \n\n")
        if let segmentedControl = segmentedControl {
            for item in items {
                dataSources.append(ArrayDataSource<MediaResponseModel>(data: item))
            }
            sourcesType.append(contentsOf: types)
            segmentAction(segmentedControl)
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        let listView = sender.selectedSegmentIndex != 1
        let sections: [Provider] = dataSources.map { item in
            return BasicProvider(
                dataSource: item,
                viewSource: ComposedViewSource(viewSourceSelector: { _ in
                    if listView {
                        return self.listViewSource()
                    } else {
                        return self.gridViewSource()
                    }
                }),
                sizeSource: { (_, _, size) -> CGSize in
                    return listView
                        ? CGSize(width: (size.width / 4) - 10, height: 120)
                        : CGSize(width: size.width, height: 100)
                },
                layout: FlowLayout(lineSpacing: 10,
                                   interitemSpacing: 10,
                                   justifyContent: .start,
                                   alignItems: .center),
                animator: WobbleAnimator()) { context in
                
                // Navigating to MediaDetails screen
                self.router?.routeToDetail(with: context.data)
            }
        }
        
        let provider = ComposedHeaderProvider(
            headerViewSource: { (view: UILabel, _, index) in
                view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                view.textColor = .white
                view.textAlignment = .left
                let item = self.sourcesType[index]
                view.text = "  \(item)"
            },
            headerSizeSource: { (_, _, maxSize) -> CGSize in
                return CGSize(width: maxSize.width, height: 32)
            },
            sections: sections
        )
        
        collectionView?.provider = provider
        collectionView?.reloadData()
    }
}

extension SearchResultsViewController {
    func setupCollectionView() {
        collectionView?.contentInset = UIEdgeInsets.zero
        collectionView?.contentInsetAdjustmentBehavior = .never
    }
    
    func listViewSource() -> ClosureViewSource<MediaResponseModel, UIView> {
        return ClosureViewSource(viewUpdater: { (view: UIView, item: MediaResponseModel, _: Int) in
            _ = view.subviews.map({
                $0.removeFromSuperview()
            })
            
            let imageView = CoreWebImageView()
            view.addSubview(imageView)
            imageView.snp.makeConstraints({
                $0.edges.equalToSuperview()
            })
            
            imageView.contentMode = .scaleAspectFill
            imageView.loadImageUsingUrlString(url: item.artworkUrl100, placeHolderImage: UIImage())
            view.layer.cornerRadius = 8
            view.clipsToBounds = true
        })
    }
    
    func gridViewSource() -> ClosureViewSource<MediaResponseModel, UIView> {
        
        ClosureViewSource(viewUpdater: { (view: UIView, item: MediaResponseModel, _: Int) in
           _ = view.subviews.map({
               $0.removeFromSuperview()
           })
           let imageView = CoreWebImageView()
           view.addSubview(imageView)
           imageView.snp.makeConstraints({
               $0.leading.equalToSuperview().inset(8)
               $0.top.bottom.equalToSuperview().inset(4)
               $0.width.equalTo(96 - 8)
           })

           let trackName = UILabel()
           trackName.text = item.trackName ?? item.collectionName
           trackName.numberOfLines = 2
           trackName.font = UIFont.boldSystemFont(ofSize: 15)
           trackName.textColor = .white

           let artistName = UILabel()
           artistName.text = item.artistName
           artistName.textColor = .white
           artistName.numberOfLines = 2
           artistName.font = UIFont.systemFont(ofSize: 13)

           let stackView = UIStackView()
           stackView.distribution = .fillEqually
           stackView.alignment = .leading
           stackView.axis = .vertical
           stackView.addArrangedSubview(trackName)
           stackView.addArrangedSubview(artistName)

           view.addSubview(stackView)
           stackView.snp.makeConstraints({
               $0.top.bottom.equalTo(imageView).offset(4)
               $0.leading.equalTo(imageView.snp.trailing).offset(8)
               $0.trailing.equalToSuperview().inset(4)
           })

           imageView.contentMode = .scaleAspectFill
           imageView.loadImageUsingUrlString(url: item.artworkUrl100,
                                             placeHolderImage: UIImage())
           view.layer.cornerRadius = 8
           view.clipsToBounds = true
       })
    }
}

