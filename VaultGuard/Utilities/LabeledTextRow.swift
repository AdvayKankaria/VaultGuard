//
//  LabeledTextRow.swift
//  Vaultguard
//
//  Created by advay kankaria on 08/08/25.
//

import Foundation
import SwiftUI

struct LabeledTextRow: View {
    var icon: String
    var text: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.gray)
            Text(text)
                .foregroundColor(.primary)
            Spacer()
        }
    }
}
