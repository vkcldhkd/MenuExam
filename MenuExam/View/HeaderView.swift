//
//  HeaderView.swift
//  MenuExam
//
//  Created by 1 on 23/10/2018.
//  Copyright © 2018 Sung hyun. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
}

extension HeaderView {
    func setView(title : String){
        backgroundColor = .white
        titleLabel.text = title
    }
}
