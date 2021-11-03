//
//  Product.swift
//  Caffeine and Me
//
//  Created by Mitchell Schuster on 11/2/21.
//

import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var caffeineContent: String
    private(set) public var imageName: String
    
    init(title: String, caffeineContent: String, imageName: String) {
        self.title = title
        self.caffeineContent = caffeineContent
        self.imageName = imageName
    }
}
