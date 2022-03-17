//
//  BaseViewController.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import UIKit

class BaseViewController: UIViewController {

    var loaderView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(withTitle title: String = "GitHubAPI", message: String?, actions: [UIAlertAction]? = nil) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            if let actions = actions, actions.isEmpty == false {
                for action in actions {
                    alert.addAction(action)
                }
            } else {
                alert.addAction(UIAlertAction(title: "OK", style: .default))
            }
            self.present(alert, animated: true)
        }
    }
    
    func displayActivityIndicator(onView : UIView) {
        
        let containerView = UIView.init(frame: onView.bounds)
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = containerView.center
        DispatchQueue.main.async {
            containerView.addSubview(activityIndicator)
            onView.addSubview(containerView)
        }
        loaderView = containerView
    }

    func removeActivityIndicator() {
        
        DispatchQueue.main.async {
            self.loaderView?.removeFromSuperview()
            self.loaderView = nil
        }
    }

}
