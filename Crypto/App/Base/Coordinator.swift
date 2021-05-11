//
//  Coordinator.swift
//  Crypto
//
//  Created by Aleksander Popek on 08/05/2021.
//

import Foundation

class Coordinator {
    private let identifier: UUID = .init()
    private(set) var dependencies: [UUID: Any] = [:]
    
    func load(_ coordinator: Coordinator) {
        dependencies[coordinator.identifier] = coordinator
        coordinator.start()
    }
    
    func start() {
        fatalError("start() has not been implemented")
    }
    
    func stop(coordinator: Coordinator) {
        dependencies[coordinator.identifier] = nil
    }
    
    deinit {
        print("\(String(describing: self)) was deinitialized")
    }
}
