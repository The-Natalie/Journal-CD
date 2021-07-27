//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Natalie Hall on 7/26/21.
//

import CoreData

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    
    // MARK: - CRUD
    func createEntry(title: String, bodytext: String) {
        let entry = Entry(title: title, bodytext: bodytext)
        entries.append(entry)
        
        CoreDataStack.saveContext()
    }
        
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry, title: String, bodytext: String) {
        entry.title = title
        entry.bodytext = bodytext
        
        CoreDataStack.saveContext()
    }
    
} // End of Class
