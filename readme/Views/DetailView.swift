//
//  DetailView.swift
//  readme
//
//  Created by Adam Armstrong on 26/08/2022.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    @Binding var image: Image?
    @State var imagePickerIsShowing = false
    @State var deleteImageDialogIsShowing = false
    @ObservedObject var book: Book
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (spacing: 16) {
                Button(action: {
                    book.readMe.toggle()
                }, label: {
                    Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
                })
                TitleAndAuthorView(book: book, titleFont: .title, authorFont: .title2)
            }
            
            VStack {
                Divider()
                    .padding(.vertical)
                TextField("Review...", text: $book.microReview)
                Divider()
                    .padding(.vertical)
                Book.Image(image: image, title: book.title, cornerRadius: 16.0)
                    .scaledToFit()
                HStack {
                    if (image != nil) {
                        Spacer()
                        Button("Delete Image") {
                            deleteImageDialogIsShowing = true
                        }
                    }
                    Spacer()
                    Button("Update Image...") {
                        imagePickerIsShowing = true
                    }
                    Spacer()
                }
                .padding()
            }
            .padding()
            Spacer()
        }
        .padding()
        .sheet(isPresented: $imagePickerIsShowing) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog("Delete image for \(book.title)", isPresented: $deleteImageDialogIsShowing) {
            Button("Delete", role: .destructive) {image = nil }
        } message: {
            Text("Delete image for \(book.title)?")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: .constant(nil), book: .init())
            .previewedInAllColorSchemes
    }
}
