//
//  ContentView.swift
//  readme
//
//  Created by Adam Armstrong on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Library().sortedBooks, id: \.title) { book in
                BookRowView(book: book)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookRowView: View {
    let book: Book
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book)) {
        HStack {
            Book.Image(title: book.title, size: 80)
            TitleAndAuthorView(book: book, titleFont: .title2, authorFont: .title3)
                .lineLimit(1)
        }
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




