//
//  RootView.swift
//  Vaultguard
//
//  Created by advay kankaria on 08/08/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appLockManager: AppLockManager

    var body: some View {
        Group {
            if appLockManager.isLocked {
                LoginView()
            } else {
                PasswordListView()
            }
        }
        .animation(.easeInOut, value: appLockManager.isLocked)
        .onAppear {
                    print("🟢 RootView: isLocked = \(appLockManager.isLocked)")
                }
    }
}

#Preview {
    RootView()
        .environmentObject(AppLockManager.shared)
}
