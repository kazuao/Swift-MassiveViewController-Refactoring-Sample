//
//  PersonCell.swift
//  MassiveViewControllerRefactoring
//
//  Created by Kazunori Aoki on 2021/06/23.
//

import Foundation
import UIKit

class PersonCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleCell()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func styleCell() {
        textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        contentView.backgroundColor = .purple
        textLabel?.backgroundColor = .purple
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1.5
    }
}
