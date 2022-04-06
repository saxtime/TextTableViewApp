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
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nameArray = StorageManager.shared.fetchContacts()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.shared.newNameControllerID {
            let secondVC = segue.destination as! NewNameViewController
            secondVC.delegate = self
        }
    }
}

//MARK: - TableView DataSourse & Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shared.cellID, for: indexPath)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let detailViewController = storyboard?.instantiateViewController(identifier: Constants.shared.detailVCID) as? DetailViewController
        self.navigationController?.pushViewController(detailViewController!, animated: true)
        detailViewController?.name = nameArray[indexPath.row].Fullname
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - Using delegate method

extension ViewController: FullNameDelegate {
    func sendName(person: Person) {
        
        nameArray.append(person)
        tableView.reloadData()
    }
}


