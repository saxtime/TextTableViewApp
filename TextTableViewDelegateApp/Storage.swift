//
//  Storage.swift
//  TextTableViewDelegateApp
//
//  Created by Андрей Василевский on 3/23/22.
//

import Foundation

struct StorageManager {
    
    private let key = "contact"
    
    private init() {}
    
    static let shared = StorageManager()
    
    func saveContact(person: Person) {
        var personArray = fetchContacts()
        personArray.append(person)
        guard let data = try? JSONEncoder().encode(personArray) else { return }
        UserDefaults.standard.setValue(data, forKey: key)
    }
    
    func fetchContacts() -> [Person] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else { return [] }
        guard let personArray = try? JSONDecoder().decode([Person].self, from: data) else { return [] }
        return personArray
    }
    
    func deleteContact(at index: Int) {
        var personArray = fetchContacts()
        personArray.remove(at: index)
        guard let data = try? JSONEncoder().encode(personArray) else { return }
        UserDefaults.standard.setValue(data, forKey: key)
    }
}
