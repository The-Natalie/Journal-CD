//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Natalie Hall on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    // MARK: - Properties
    var entry: Entry?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
              let bodytext = bodyTextView.text,
              !title.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry, title: title, bodytext: bodytext)
        } else {
            EntryController.shared.createEntry(title: title, bodytext: bodytext)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Helper methods
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext
    }
    
}  // End of Class
