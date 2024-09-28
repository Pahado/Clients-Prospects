//
//  SearchCustomerView.swift
//  Clients & Prospects
//
//  Created by Paul on 28/09/2024.
//
// SearchCustomerView.swift
import SwiftUI
import CoreData

struct SearchCustomerView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = ""
    @State private var searchType = 0
    let searchTypes = ["Telefon", "E-mail", "Nazwa firmy", "Adres", "Nazwisko reprezentanta"]
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Customer.companyName, ascending: true)],
        animation: .default)
    private var customers: FetchedResults<Customer>
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Wyszukaj po", selection: $searchType) {
                    ForEach(Array(searchTypes.enumerated()), id: \.offset) { index, searchType in
                        Text(searchType).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("Wyszukaj...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List {
                    ForEach(filteredCustomers, id: \.self) { (customer: Customer) in
                        NavigationLink(destination: CustomerDetailView(customer: customer)) {
                            Text(customer.companyName ?? "Nieznana firma")
                        }
                    }
                }
            }
            .navigationTitle("Wyszukaj klienta")
        }
    }

    
    var filteredCustomers: [Customer] {
        if searchText.isEmpty {
            return Array(customers)
        } else {
            return customers.filter { customer in
                switch searchType {
                case 0: return (customer.phone ?? "").lowercased().contains(searchText.lowercased())
                case 1: return (customer.email ?? "").lowercased().contains(searchText.lowercased())
                case 2: return (customer.companyName ?? "").lowercased().contains(searchText.lowercased())
                case 3: return (customer.address ?? "").lowercased().contains(searchText.lowercased())
                case 4: return (customer.representative ?? "").lowercased().contains(searchText.lowercased())
                default: return false
                }
            }
        }
    }
}

