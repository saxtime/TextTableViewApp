//
//  Model.swift
//  TextTableViewDelegateApp
//
//  Created by Андрей Василевский on 3/23/22.
//

import Foundation

struct Person: Codable {
    let Name: String
    let Surname: String
    
    var Fullname: String {
        "\(Name) \(Surname)"
    }
}

struct SomeoneElse: Codable {
    let Name: String
    let Surname: String
}
