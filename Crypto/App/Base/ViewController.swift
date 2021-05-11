//
//  ViewController.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import UIKit

class ViewController<View: ContentView, ViewModel: ViewModelProtocol>: UIViewController {

    let contentView: View
    let viewModel: ViewModel
    
    convenience init() {
        fatalError("init() has not been implemented")
    }
    
    required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.contentView = View()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
}
