//
//  BaseViewController.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 16/12/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CoreConstants.Themes.backgroundColor
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func showLoader() {
        ProgressView.sharedInstance.showProgressViewNow()
    }

    func hideLoader() {
        ProgressView.sharedInstance.hideProgressView()
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ooops!! 🤔", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default, .cancel, .destructive:
                alert.dismiss(animated: true, completion: nil)
            @unknown default:
                break
            }
        }))
        present(alert, animated: true, completion: nil)
    }
}
