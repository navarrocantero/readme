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
    @Binding var image: UIImage?
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 16) {
                BookMarkButton(book: book)
                TitleAndAuthorStack(book:book,titleFont: .title,authorFont: .title2)
            }
            
       
            DetailsPropertiesView(book: book, image: $image, showImagePicker: showImagePicker, showAlert: showAlert)
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            //            PHPickerViewController.View(image: $image)
            PHPickerViewController.View(image: $image)
            
            
        }.alert(isPresented: .constant(showAlert)){
            
            .init(title: .init("Delete image for \(book.title)?"),
                  primaryButton: .destructive(.init("Delete")){
                    showAlert = false
                    deleteImage()
                  }, secondaryButton: .cancel(){
                    showAlert = false
                  })
        }
    }
   
    
    func deleteImage(){
        self.image = nil
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(),image: .constant(nil)).previewColored
    }
}



struct DetailsPropertiesView: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State var showImagePicker = false
    @State var showAlert = false
   
    var body: some View {
        VStack {
            Divider().padding(.vertical)
            TextField("Review...", text: $book.microReview)
            Divider().padding(.vertical)
            Book.Image(uiImage:image,title:book.title,cornerRadius:16).scaledToFit()
            HStack{
                if(image != nil){
                    Button("Delete image"){
                        showAlert = true
                    }}
                Button("Upadate image..."){
                    showImagePicker = true
                }
            }.padding()
        }
    }
}
