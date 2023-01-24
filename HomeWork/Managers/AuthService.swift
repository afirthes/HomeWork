//
//  AuthService.swift
//  HomeWork
//
//  Created by Afir Thes on 24.01.2023.
//

import Foundation

enum UserDefaultKeys {
    static let storageKey = "Registrations"
    static let rememberKey = "Remembered"
}

class AuthService {
    static let shared = AuthService()

    private var registeredUsers: [String: RegistrationInfo] = [:]
    private let defaults = UserDefaults.standard
    private init() {}

    func loadRegistrations() -> [String: RegistrationInfo] {
        let defaults = UserDefaults.standard
        guard let savedRegistrations = defaults.object(forKey: UserDefaultKeys.storageKey) as? Data else {
            return [:]
        }

        let decoder = JSONDecoder()
        if let registeredUsers = try? decoder.decode([String: RegistrationInfo].self, from: savedRegistrations) {
            return registeredUsers
        } else {
            return [:]
        }
    }

    func register(with registration: RegistrationInfo) -> Bool {
        var registeredUsers = loadRegistrations()

        if registeredUsers.index(forKey: registration.login) != nil {
            return false
        }

        registeredUsers[registration.login] = registration

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(registeredUsers) {
            defaults.set(encoded, forKey: UserDefaultKeys.storageKey)
        }

        return true
    }

    func auth(with login: String, and password: String) -> Bool {
        let registeredUsers = loadRegistrations()
        return registeredUsers[login]?.password == password
    }

    func rememberUser(with login: String) {
        defaults.set(login, forKey: UserDefaultKeys.rememberKey)
    }

    func isUserRemembered() -> Bool {
        defaults.object(forKey: UserDefaultKeys.rememberKey) != nil
    }

    func getRemembered() -> String? {
        defaults.object(forKey: UserDefaultKeys.rememberKey) as? String
    }

    func forgetUser() {
        defaults.removeObject(forKey: UserDefaultKeys.rememberKey)
    }
}
