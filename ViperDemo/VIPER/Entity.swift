//
//  Entity.swift
//  ViperDemo
//
//  Created by Rathakrishnan Ramasamy on 25/04/22.
//

import Foundation
// Model

struct User: Codable {
    let name: String
    let email: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
}
