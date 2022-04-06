//
//  DetailViewController.swift
//  TextTableViewDelegateApp
//
//  Created by Андрей Василевский on 4/6/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name = ""

    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        nameLabel.textColor = .white

        
        nameLabel.text = "You`re picked up \n\(name)"
        
    }
    
    
}
