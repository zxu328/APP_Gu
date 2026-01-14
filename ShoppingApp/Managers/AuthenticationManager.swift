import Foundation
import Combine

class AuthenticationManager: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "currentUser"
    
    init() {
        loadUser()
    }
    
    func register(email: String, password: String, firstName: String, lastName: String, phoneNumber: String?) {
        // In a real app, this would make an API call
        // For now, we'll simulate registration
        let newUser = User(
            id: UUID().uuidString,
            email: email,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            address: nil
        )
        
        // Simulate API delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.currentUser = newUser
            self.isAuthenticated = true
            self.saveUser()
        }
    }
    
    func login(email: String, password: String) {
        // In a real app, this would make an API call
        // For now, we'll simulate login
        let user = User(
            id: UUID().uuidString,
            email: email,
            firstName: "John",
            lastName: "Doe",
            phoneNumber: nil,
            address: nil
        )
        
        // Simulate API delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.currentUser = user
            self.isAuthenticated = true
            self.saveUser()
        }
    }
    
    func logout() {
        currentUser = nil
        isAuthenticated = false
        userDefaults.removeObject(forKey: userKey)
    }
    
    func updateUser(_ user: User) {
        currentUser = user
        saveUser()
    }
    
    private func saveUser() {
        if let encoded = try? JSONEncoder().encode(currentUser) {
            userDefaults.set(encoded, forKey: userKey)
        }
    }
    
    private func loadUser() {
        if let data = userDefaults.data(forKey: userKey),
           let user = try? JSONDecoder().decode(User.self, from: data) {
            currentUser = user
            isAuthenticated = true
        }
    }
}
