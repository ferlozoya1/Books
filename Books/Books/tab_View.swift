//
//  tabView.swift
//  Books
//
//  Created by Fernanda Lozoya Navarro on 15/11/23.
//

import SwiftUI

struct tab_View: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Label("Reading Now", systemImage: "book.fill") }
            Library()
                .tabItem { Label("Library", systemImage: "books.vertical.fill") }
            BooksStore()
                .tabItem { Label("Book Store", systemImage: "bag.fill") }
            Search()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
        }
    }
}

#Preview {
    tab_View()
}
