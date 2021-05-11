//
//  NavigationController.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.colorBackground
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
