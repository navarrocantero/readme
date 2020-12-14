//
//  NewBookView.swift
//  ReadMe
//
//  Created by navarrocantero on 13/12/20.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book = Book(title: "Title", author: "Author")
    @State var image: UIImage? = nil
    @EnvironmentObject var library: Library
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack {
                Divider()
                    .padding(.vertical)
                TextField("Title",text: $book.title)
                Divider()
                    .padding(.vertical)
                TextField("Author", text: $book.author)
                Divider()
                    .padding(.vertical)
                
                DetailsPropertiesView(book: book, image: $image)
                
            }.navigationBarTitle("Got a new book?")
            .toolbar(content: {
                
                ToolbarItem(placement: .status){
                    Button("Add to Library"){
                        library.addNewBook(book, image: image)
                        presentationMode.wrappedValue.dismiss()
                    }.disabled([book.title,book.author].contains(where: \.isEmpty))
                }
            })
        }
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView().environmentObject(Library())
    }
}
