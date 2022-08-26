//
//  DetailView.swift
//  readme
//
//  Created by Adam Armstrong on 26/08/2022.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        VStack (alignment: .leading) {
            TitleAndAuthorView(book: book, titleFont: .title, authorFont: .title2)
            Book.Image(title: book.title)
            Spacer()
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}
