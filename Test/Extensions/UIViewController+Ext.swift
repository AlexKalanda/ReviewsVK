//
//  UIViewController+Ext.swift
//  Test
//
//  Created by admin on 28/2/2025.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    /// запускает ActivityIndicator
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = CustomActivityIndicator()
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        
    }
    /// убирает ActivityIndicator
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
        }
    }
    
}
