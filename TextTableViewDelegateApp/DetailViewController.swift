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
    
    @IBAction func exitButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        
        guard let name = nameTF.text else { return }
        guard let surname = surnameTF.text else { return }
        
        if name == "" {
            showAlert(with: "Empty field", message: "Please, enter your Name")
            return
        } else if surname == "" {
            showAlert(with: "Empty field", message: "Please, enter your Surname")
            return
        }
        
        let person = Person(Name: name, Surname: surname)
        
        StorageManager.shared.saveContact(person: person)
        
        delegate.sendName(person: person)
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
