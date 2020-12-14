//
//  Book.swift
//  ReadMe
//
//  Created by navarrocantero on 6/12/20.
//
import Combine

class Book:ObservableObject {
    
    
    @Published var title: String
    @Published var author: String
    @Published var microReview: String
    @Published var readme: Bool
    
    
    init(title: String = "Title",author: String = "Author",
         microReview: String = "",readme : Bool = true){
        self.title = title
        self.author = author
        self.microReview = microReview
        self.readme = readme
    }
}


extension Book:Hashable, Identifiable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Book: Equatable{
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    }}
