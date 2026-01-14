import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let firstName: String
    let lastName: String
    let phoneNumber: String?
    let address: Address?
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let zipCode: String
    let country: String
    
    var formatted: String {
        "\(street), \(city), \(state) \(zipCode), \(country)"
    }
}
