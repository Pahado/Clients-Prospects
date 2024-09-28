//
//  AddCustomerView.swift
//  Clients & Prospects
//
//  Created by Paul on 28/09/2024.
//
// AddCustomerView.swift
import SwiftUI
import CoreData

struct AddCustomerView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var companyName = ""
    @State private var address = ""
    @State private var representative = ""
    @State private var function = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var workScope = ""
    @State private var additionalDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Dane firmy")) {
                    TextField("Nazwa firmy", text: $companyName)
                    TextField("Adres", text: $address)
                }
                
                Section(header: Text("Dane reprezentanta")) {
                    TextField("Imię i nazwisko", text: $representative)
                    TextField("Funkcja", text: $function)
                    TextField("Telefon", text: $phone)
                    TextField("E-mail", text: $email)
                }
                
                Section(header: Text("Dodatkowe informacje")) {
                    TextField("Zakres prac", text: $workScope)
                    TextEditor(text: $additionalDescription)
                }
                
                Button("Zapisz") {
                    saveCustomer()
                }
            }
            .navigationTitle("Nowy klient")
        }
    }
    
    private func saveCustomer() {
        let newCustomer = Customer(context: viewContext)
        newCustomer.companyName = companyName
        newCustomer.address = address
        newCustomer.representative = representative
        newCustomer.function = function
        newCustomer.phone = phone
        newCustomer.email = email
        newCustomer.workScope = workScope
        newCustomer.additionalDescription = additionalDescription
        
        do {
            try viewContext.save()
            clearFields()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func clearFields() {
        companyName = ""
        address = ""
        representative = ""
        function = ""
        phone = ""
        email = ""
        workScope = ""
        additionalDescription = ""
    }
}


