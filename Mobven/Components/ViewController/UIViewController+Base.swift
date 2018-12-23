//
//  UIViewController+Base.swift
//  Mobven
//
//  Created by macbookair on 23.12.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    public func showAlertView(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func showLoadingView() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    public func hiddenLoadingView() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
