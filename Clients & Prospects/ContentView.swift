//
//  ContentView.swift
//  Clients & Prospects
//
//  Created by Paul on 28/09/2024.
//
// ContentView.swift
import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection = 0
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView(selection: $selection) {
            AddCustomerView()
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Image(systemName: "person.badge.plus")
                    Text("Wprowadź dane")
                }
                .tag(0)
            
            SearchCustomerView()
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Wyszukaj klienta")
                }
                .tag(1)
        }
    }
}
