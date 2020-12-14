//
//  TitleAndAuthorStack.swift
//  ReadMe
//
//  Created by navarrocantero on 13/12/20.
//

import SwiftUI

struct TitleAndAuthorStack: View {
    let book:Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading){
            Text(book.title).font(titleFont)
            Text(book.author).font(authorFont).foregroundColor(.secondary)
        }
    }
}
