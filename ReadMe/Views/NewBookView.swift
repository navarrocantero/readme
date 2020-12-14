//
//  NewBookView.swift
//  ReadMe
//
//  Created by navarrocantero on 13/12/20.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book: Book
    @State var showImagePicker = false
    @State var showAlert = false
    @Binding var image: UIImage?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        DetailsPropertiesView(book: book, image: $image, showImagePicker: showImagePicker, showAlert: showAlert)
        Spacer()
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView(
            book: Book.init(),
            image:.constant(nil))
    }
}
