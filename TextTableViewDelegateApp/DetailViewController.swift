//
//  DetailViewController.swift
//  TextTableViewDelegateApp
//
//  Created by Андрей Василевский on 3/23/22.
//

import UIKit

protocol FullNameDelegate {
    func sendName(person: Person)
}

class DetailViewController: UIViewController {
    
    var delegate: FullNameDelegate!
    var someText = ""
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var surnameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
      
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        guard let name = nameTF.text else { return }
        guard let surname = surnameTF.text else { return }
        
        let person = Person(Name: name, Surname: surname)
        
        StorageManager.shared.saveContact(person: person)
        
        delegate.sendName(person: person)
        
        
        dismiss(animated: true, completion: nil)
    }
}
