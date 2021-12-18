//
//  UIAlertController+Core.swift
//  iTunesApp
//
//  Created by Vineet Sansare on 19/12/2021.
//

import UIKit

extension UIAlertController {
    class func show(title: String?, message: String?,
                    okButtonText: String? = nil,
                    cancelButtonText: String? = nil,
                    action: UIAlertAction.Type = UIAlertAction.self,
                    from controller: UIViewController,
                    okButtonTapped: (() -> Void)?, cancelButtonTapped: (() -> Void)?) {

        let alertTitle = title
        let alertMessage = message
        let alertOk = okButtonText
        let alertController: UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: alertOk, style: UIAlertAction.Style.default) { _ in }
        alertController.addAction(confirmAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
