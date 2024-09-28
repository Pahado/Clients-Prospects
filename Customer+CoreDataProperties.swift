//
//  Customer+CoreDataProperties.swift
//  Clients & Prospects
//
//  Created by Paul on 28/09/2024.
//
// Customer+CoreDataProperties.swift
import Foundation
import CoreData

extension Customer {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }
    
    @NSManaged public var additionalDescription: String?
    @NSManaged public var address: String?
    @NSManaged public var companyName: String?
    @NSManaged public var email: String?
    @NSManaged public var function: String?
    @NSManaged public var phone: String?
    @NSManaged public var representative: String?
    @NSManaged public var workScope: String?
}

extension Customer : Identifiable {
}

