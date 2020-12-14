//
//  BookRowView.swift
//  ReadMe
//
//  Created by navarrocantero on 13/12/20.
//

import SwiftUI

struct BookRowView: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library : Library
    
    var body: some View {
        NavigationLink(
            destination:DetailView(book:book)){
            HStack{
                Book.Image(uiImage: library.uiImages[book],title:book.title,size:80,cornerRadius: 12)
                
                VStack(alignment:.leading){
                    
                    TitleAndAuthorStack(book:book,titleFont:.title2,authorFont: .title3)
                    if(!book.microReview.isEmpty){
                        Spacer()
                        Text(book.microReview).font(.subheadline).foregroundColor(.secondary)
                    }
                }.lineLimit(1)
                Spacer()
                BookMarkButton(book: book).buttonStyle(BorderlessButtonStyle())
                
            }
            .padding(.vertical,8)
        }
    }
}

struct BookRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        BookRowView(book: .init()).environmentObject(Library())
    }
}


