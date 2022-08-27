//
//  ContentView.swift
//  readme
//
//  Created by Adam Armstrong on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    
    var body: some View {
        NavigationView {
            List(library.sortedBooks) { book in
                BookRowView(image: $library.images[book], book: book)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookRowView: View {
    @Binding var image: Image?
    @ObservedObject var book: Book
    
    var body: some View {
        NavigationLink(
            destination: DetailView(image: $image, book: book)) {
        HStack {
            Book.Image(image: image, title: book.title, cornerRadius: 12.0, size: 80)
            VStack(alignment: .leading) {
                TitleAndAuthorView(book: book, titleFont: .title2, authorFont: .title3)
                
                if !book.microReview.isEmpty {
                    Spacer()
                    Text(book.microReview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .lineLimit(1)
        }
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}




