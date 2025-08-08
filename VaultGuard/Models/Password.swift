//
//  Password.swift
//  Vaultguard
//
//  Created by advay kankaria on 08/08/25.
//

import Foundation
import CoreData
extension Password: Hashable {}

struct Password: Identifiable {
    var id: UUID
    var serviceName: String
    var username: String
    var encryptedPassword: Data
    var createdAt: Date
    let category: String
    let isFavorite: Bool
    func decryptedPassword() -> String? {
        return EncryptionManager.shared.decrypt(data: encryptedPassword)
    }
}


