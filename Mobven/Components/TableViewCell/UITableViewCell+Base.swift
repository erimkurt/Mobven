//
//  UITableViewCell+Base.swift
//  Mobven
//
//  Created by macbookair on 23.12.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}
