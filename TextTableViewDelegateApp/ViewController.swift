//
//  ViewController.swift
//  TextTableViewDelegateApp
//
//  Created by Андрей Василевский on 3/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    var nameArray: [Person] = []

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        nameArray = StorageManager.shared.fetchContacts()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let secondVC = segue.destination as! DetailViewController
            secondVC.delegate = self
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nameArray[indexPath.row].Fullname
        print("cell for row", nameArray)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            nameArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            StorageManager.shared.deleteContact(at: indexPath.row)
            tableView.endUpdates()
            
        }
    }
}

extension ViewController: FullNameDelegate {
    func sendName(person: Person) {
        
        nameArray.append(person)
        tableView.reloadData()
    }
}


