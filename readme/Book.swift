//
//  Book.swift
//  readme
//
//  Created by Adam Armstrong on 26/08/2022.
//

import Foundation

struct Book {
    let title: String
    let author: String
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }
}
