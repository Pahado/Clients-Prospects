//
//  CustomerDetailView.swift
//  Clients & Prospects
//
//  Created by Paul on 28/09/2024.
//
// CustomerDetailView.swift
import SwiftUI
import CoreData

struct CustomerDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var customer: Customer
    @State private var isEditing = false
    
    var body: some View {
        Form {
            Section(header: Text("Dane firmy")) {
                if isEditing {
                    TextField("Nazwa firmy", text: Binding(
                        get: { customer.companyName ?? "" },
                        set: { customer.companyName = $0 }
                    ))
                    TextField("Adres", text: Binding(
                        get: { customer.address ?? "" },
                        set: { customer.address = $0 }
                    ))
                } else {
                    Text(customer.companyName ?? "")
                    Text(customer.address ?? "")
                }
            }
            
            Section(header: Text("Dane reprezentanta")) {
                if isEditing {
                    TextField("Imię i nazwisko", text: Binding(
                        get: { customer.representative ?? "" },
                        set: { customer.representative = $0 }
                    ))
                    TextField("Funkcja", text: Binding(
                        get: { customer.function ?? "" },
                        set: { customer.function = $0 }
                    ))
                    TextField("Telefon", text: Binding(
                        get: { customer.phone ?? "" },
                        set: { customer.phone = $0 }
                    ))
                    TextField("E-mail", text: Binding(
                        get: { customer.email ?? "" },
                        set: { customer.email = $0 }
                    ))
                } else {
                    Text(customer.representative ?? "")
                    Text(customer.function ?? "")
                    Text(customer.phone ?? "")
                    Text(customer.email ?? "")
                }
            }
            
            Section(header: Text("Dodatkowe informacje")) {
                if isEditing {
                    TextField("Zakres prac", text: Binding(
                        get: { customer.workScope ?? "" },
                        set: { customer.workScope = $0 }
                    ))
                    TextEditor(text: Binding(
                        get: { customer.additionalDescription ?? "" },
                        set: { customer.additionalDescription = $0 }
                    ))
                } else {
                    Text(customer.workScope ?? "")
                    Text(customer.additionalDescription ?? "")
                }
            }
        }
        .navigationTitle("Szczegóły klienta")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Zapisz" : "Edytuj") {
                    if isEditing {
                        do {
                            try viewContext.save()
                        } catch {
                            print("Nie udało się zapisać zmian: \(error)")
                        }
                    }
                    isEditing.toggle()
                }
            }
        }
    }
}

