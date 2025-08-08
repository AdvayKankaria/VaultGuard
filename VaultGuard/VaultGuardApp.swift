//
//  SecureVaultApp.swift
//  Vaultguard
//
//  Created by advay kankaria on 08/08/25.
//
import SwiftUI

@main
struct VaultGuardApp: App {
    @StateObject private var authViewModel = AuthenticationViewModel()
    @StateObject var appLockManager = AppLockManager.shared
    private let persistenceController = PersistenceController.shared
    @StateObject private var categoryViewModel: CategoryViewModel

    init() {
        let context = persistenceController.container.viewContext
        _categoryViewModel = StateObject(wrappedValue: CategoryViewModel(context: context))
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authViewModel)
                .environmentObject(appLockManager)
                .environmentObject(categoryViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    DataSeeder.seedPasswords(context: PersistenceController.shared.context)
                }

        }
        
    }
    
}

