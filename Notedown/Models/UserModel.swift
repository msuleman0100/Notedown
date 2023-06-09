//
//  UserModel.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id = UUID()
    let name: String
    let email: String
}
