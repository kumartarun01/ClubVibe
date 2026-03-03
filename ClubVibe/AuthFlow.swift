//
//  AuthViewModel.swift
//  ClubVibe
//
//  Created by iMac1 on 21/02/26.
//

import SwiftUI
import Combine
import Firebase
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
   
    private let db = Firestore.firestore()
    
    func login(email: String, password: String) {
            errorMessage = nil
            isLoading = true
            
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                        return
                    }
                    
                    self.isAuthenticated = true
                }
            }
        }
        
        // MARK: SIGNUP
        func signup(email: String, password: String, username: String) {
            
            errorMessage = nil
            isLoading = true
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if let error = error {
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.errorMessage = error.localizedDescription
                    }
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                // Save extra data to Firestore
                self.db.collection("users").document(uid).setData([
                    "uid": uid,
                    "username": username,
                    "email": email,
                    "createdAt": Timestamp()
                ]) { error in
                    
                    DispatchQueue.main.async {
                        self.isLoading = false
                        
                        if let error = error {
                            self.errorMessage = error.localizedDescription
                        } else {
                            self.isAuthenticated = false
                        }
                    }
                }
            }
        }
        
        // MARK: LOGOUT
        func logout() {
            try? Auth.auth().signOut()
            isAuthenticated = false
        }
    }

struct AuthView: View {
    @ObservedObject var auth: AuthViewModel
    @State private var selection: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("background")
                    .resizable()
                    .opacity(0.2)
                VStack {
                    
                    Picker("Auth", selection: $selection) {
                        Text("Login").tag(0)
                        Text("Sign Up").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    if selection == 0 {
                        LoginPage(auth: auth)
                    }
                    else {
                        SignUpPage(auth: auth)
                    }
                    
                    if let error = auth.errorMessage {
                        Text(error)
                            .font(.footnote)
                            .foregroundStyle(Color.red)
                            .padding(.horizontal)
                    }
                    
                    if auth.isLoading {
                        ProgressView().padding(.top, 8)
                    }
                }
            }.ignoresSafeArea()
        }.toolbar(.hidden)
    }
    
}

struct LoginPage: View {
    @ObservedObject var auth: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {

        NavigationStack {
            VStack(spacing: 12) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                NavigationLink{
                    ForgotPassword()
                }label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                }.padding(EdgeInsets(top: 0, leading: 70, bottom: 10, trailing: -150))
                Button(action: { auth.login(email: email, password: password) }) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(auth.isLoading)
                BottomSection()
            }
            .padding(.horizontal)
        }.toolbar(.hidden)
    }
}



struct BottomSection: View {
    var body: some View {
            VStack{
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.gray)
                    Text("Don't have an account?")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                }
                HStack(spacing: 20) {
                    Image(systemName: "applelogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Image(systemName: "g.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Image(systemName: "f.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
    }
}

struct SignUpPage: View {
    @ObservedObject var auth: AuthViewModel
//    private var isLoading: Bool { auth.isLoading }
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
            VStack(spacing: 12) {
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Button(action: { auth.signup(email: email, password: password, username: username) }) {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                HStack(spacing: 20) {
                    Image(systemName: "applelogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Image(systemName: "g.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Image(systemName: "f.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                .disabled(auth.isLoading)
            }
        .padding(.horizontal)
    }
}

struct ForgotPassword: View {
    @State private var email: String = ""
    var body: some View {
        NavigationStack{
            ZStack {
                Rectangle()
                    .frame(height: 430)
                    .foregroundStyle(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                VStack(spacing: 30){
                    Text("Forgot Your Password")
                        .font(.largeTitle)
                    VStack(alignment: .leading, spacing: 50) {
                        Text("Please enter the email address you'd like your password reset information sent to ")
                            .font(Font.system(size: 20, weight: .regular))
                        Text("Enter email address")
                            .font(Font.system(size: 16, weight: .semibold))
                    }
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(.roundedBorder)
                    Text("Request reset link")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    NavigationLink {
                        ContentView()
                    }label: {
                        Text("Back to login")
                    }
                }.padding()
            }.padding()
        }.toolbar(.hidden)
    }
}

#Preview {
    AuthView(auth: AuthViewModel())
}
