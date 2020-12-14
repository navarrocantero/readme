//
//  ContentView.swift
//  ReadMe
//
//  Created by navarrocantero on 6/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    @State var newBook = false
    var body: some View {
        NavigationView{
            List{
                Button{
                   newBook = true
                }label:{
                    Spacer()
                    VStack(spacing:6){
                        Image(systemName: "book.circle").font(.system(size:60))
                        Text("Add new Book")
                            .font(.title2)
                    }
                    Spacer()
                }
                
                .buttonStyle(BorderlessButtonStyle())
                .padding(.vertical,8)
                .sheet(
                isPresented: $newBook,
                    content:NewBookView.init
                )
                ForEach(library.sortedBooks) { book in
                    BookRowView(book:book, image : $library.uiImages[book])
                }
            }.navigationBarTitle(Text("My library"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewColored
    }
}
