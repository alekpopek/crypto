//
//  ContentView.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit
import SnapKit

class ContentView: UIView {
    
    required convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = Style.colorBackground
    }
    
    func setupConstraints() {
        
    }
}
