//
//  Category.swift
//  Caffeine and Me
//
//  Created by Mitchell Schuster on 11/2/21.
//

import Foundation

struct Category {
    private(set) var title: String
    private(set) var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
