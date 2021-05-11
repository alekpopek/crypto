//
//  LocalRepository.swift
//  Crypto
//
//  Created by Aleksander Popek on 10/05/2021.
//

import Foundation

struct LocalRepository: Repository {
    typealias T = LocalData
    
    let fileName: String = "Masterdata"
    let fileExtension: String = "json"
    
    func get() -> LocalData? {
        do {
            if let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
                let content = try Data(contentsOf: fileUrl)
                let data = try JSONDecoder().decode(LocalData.self, from: content)
                return data
            }

        } catch {
            print("Error: \(error)")
        }
        return nil
    }
}
