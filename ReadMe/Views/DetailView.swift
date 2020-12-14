//
//  DetailView.swift
//  ReadMe
//
//  Created by navarrocantero on 13/12/20.
//
import class PhotosUI.PHPickerViewController

import SwiftUI

struct DetailView: View {
   @ObservedObject var book: Book
    @State var showImagePicker = false
    @State var showAlert = false
    @EnvironmentObject var library : Library

    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 16) {
                BookMarkButton(book: book)
                TitleAndAuthorStack(book:book,titleFont: .title,authorFont: .title2)
            }
            
            DetailsPropertiesView(book: book, image: $library.uiImages[book])
            Spacer()
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init()).environmentObject(Library()).previewColored
    }
}



struct DetailsPropertiesView: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State var showImagePicker = false
    @State var showAlert = false

    var body: some View {
      VStack {
        Divider()
          .padding(.vertical)
        TextField("Review…", text: $book.microReview)
        Divider()
          .padding(.vertical)

        Book.Image(
          uiImage: image,
          title: book.title,
          cornerRadius: 16
        )
        .scaledToFit()

        let updateButton =
          Button("Update Image…") {
            showImagePicker = true
          }
          .padding()

        if image != nil {
          HStack {
            Spacer()

            Button("Delete Image") {
              showAlert = true
            }

            Spacer()
            updateButton
            Spacer()
          }
        } else {
          updateButton
        }

        Spacer()
      }
      .sheet(isPresented: $showImagePicker) {
        PHPickerViewController.View(image: $image)
      }
      .alert(isPresented: $showAlert) {
        .init(
          title: .init("Delete image for \(book.title)?"),
          primaryButton: .destructive(.init("Delete")) {
            image = nil
          },
          secondaryButton: .cancel()
        )
      }
    }
}
