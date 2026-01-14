import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var showEditProfile = false
    
    var body: some View {
        NavigationView {
            List {
                if let user = authManager.currentUser {
                    Section {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 8)
                    }
                    
                    Section("Account Information") {
                        HStack {
                            Text("Email")
                            Spacer()
                            Text(user.email)
                                .foregroundColor(.secondary)
                        }
                        
                        if let phone = user.phoneNumber {
                            HStack {
                                Text("Phone")
                                Spacer()
                                Text(phone)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        if let address = user.address {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Address")
                                Text(address.formatted)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    Section {
                        Button(action: {
                            showEditProfile = true
                        }) {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Edit Profile")
                            }
                        }
                    }
                    
                    Section {
                        Button(role: .destructive, action: {
                            authManager.logout()
                        }) {
                            HStack {
                                Image(systemName: "arrow.right.square")
                                Text("Logout")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showEditProfile) {
                EditProfileView()
            }
        }
    }
}

struct EditProfileView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName: String
    @State private var lastName: String
    @State private var phoneNumber: String
    @State private var street: String
    @State private var city: String
    @State private var state: String
    @State private var zipCode: String
    @State private var country: String = "United States"
    
    init() {
        if let user = authManager.currentUser {
            _firstName = State(initialValue: user.firstName)
            _lastName = State(initialValue: user.lastName)
            _phoneNumber = State(initialValue: user.phoneNumber ?? "")
            if let address = user.address {
                _street = State(initialValue: address.street)
                _city = State(initialValue: address.city)
                _state = State(initialValue: address.state)
                _zipCode = State(initialValue: address.zipCode)
                _country = State(initialValue: address.country)
            } else {
                _street = State(initialValue: "")
                _city = State(initialValue: "")
                _state = State(initialValue: "")
                _zipCode = State(initialValue: "")
            }
        } else {
            _firstName = State(initialValue: "")
            _lastName = State(initialValue: "")
            _phoneNumber = State(initialValue: "")
            _street = State(initialValue: "")
            _city = State(initialValue: "")
            _state = State(initialValue: "")
            _zipCode = State(initialValue: "")
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
                
                Section("Address") {
                    TextField("Street", text: $street)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("ZIP Code", text: $zipCode)
                    TextField("Country", text: $country)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    saveProfile()
                }
            )
        }
    }
    
    private func saveProfile() {
        guard let currentUser = authManager.currentUser else { return }
        
        let address = Address(
            street: street,
            city: city,
            state: state,
            zipCode: zipCode,
            country: country
        )
        
        let updatedUser = User(
            id: currentUser.id,
            email: currentUser.email,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber.isEmpty ? nil : phoneNumber,
            address: address
        )
        
        authManager.updateUser(updatedUser)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationManager())
}
