//
//  CarrotShareViewModel.swift
//  CarrotShare
//
//  Created by Maertens Yann-Christophe on 30/11/22.
//

import SwiftUI

class CarrotShareViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    @Published var isApplyingSettings: Bool = false
    @Published var user: User?
    @Published var users: [User]?
    @Published var chores: [Chore] = []
    @Published var signInResponse: SignInResponse?
    @Published var isShowingLoginAlert: Bool = false
    @Published var flatshare: Flatshare?
    @Published var flatshares: [Flatshare]?
    @Published var flatshareResponse: FlatshareResponse?
    
    let choreUrl = "http://localhost:8080/chores/index"
    let flatshareUrl = "http://localhost:8080/flatshares/index"
    let signUpUrl = "http://localhost:8080/api/signup"
    let signInUrl = "http://localhost:8080/api/signin"
    let usersUrl = "http://localhost:8080/users/index"
    let currentUserUrl = "http://localhost:8080/users/"
    
    @Published var signInAlertError: SignInAlertError = .none
    
    enum SignInAlertError: String {
        case none = "No Error"
        case incompleteFields = "The fields need to be completed"
        case wrongLogins = "The logins are wrong"
        
        var title: String {
            switch self {
            case .none:
                return "No Error"
            case .incompleteFields:
                return "Incompleted Fields"
            case .wrongLogins:
                return "Incorrect Logins"
            }
        }
        
        var message: String {
            switch self {
            case .none:
                return "No Error"
            case .incompleteFields:
                return "The fields need to be completed"
            case .wrongLogins:
                return "The logins are wrong"
            }
        }
    }
    
    func getChore(from index: Int) -> Chore? {
        if let choreIndex = chores.firstIndex(where: {_ in
            return false
            //            $0.day == index
        }) {
            return chores[choreIndex]
        }
        return nil
    }
    
    func getFlatshares() async throws -> [Flatshare] {
        let apiManager = APIManager()
        let result = try await apiManager.getRequest(url: flatshareUrl, cachePolicy: .useProtocolCachePolicy, model: [Flatshare].self)
        
        return result
    }
    
    func getUsers() async throws -> [User] {
        let apiManager = APIManager()
        let users = try await apiManager.getRequest(url: usersUrl, cachePolicy: .useProtocolCachePolicy, model: [User].self)
        
        return users
    }
    
    func createFlatshare(name: String, personCount: String, roomCount: String, image: String?, code: String) async throws -> Flatshare {
        let apiManager = APIManager()
        let create = try await apiManager.postRequest(url: flatshareUrl, cachePolicy: .useProtocolCachePolicy, model: Flatshare.self, body:
                                                        [
                                                            "name": name,
                                                            "person_count": personCount,
                                                            "room_count": roomCount,
                                                            "image": image ?? "",
                                                            "code": code
                                                        ]
        )
        return create
    }
    
    func fetchChores() async throws -> [Chore]{
        let apiManager = APIManager()
        let result = try await apiManager.getRequest(url: choreUrl, cachePolicy: .useProtocolCachePolicy, model: [Chore].self)
        
        return result
    }
    
    
    func checkLogins(isAllFieldsFilled: Bool, username: String, password: String) async  {
        print("login check")
        let isLoggingCorrect = signInResponse?.username == username && signInResponse?.password == password
        if isAllFieldsFilled && isLoggingCorrect {
            DispatchQueue.main.async { self.isLoggedIn = true }
        }
    }
    
    func signIn(userName: String, password: String) async throws -> SignInResponse {
        let apiManager = APIManager()
        let connexion = try await apiManager.postRequest(url: signInUrl, cachePolicy: .useProtocolCachePolicy, model: SignInResponse.self, body: [
            "username": userName,
            "password": password,
        ])
        
        return connexion
    }
    
    func signUp(userName: String, email: String, password: String) async throws -> User {
        let apiManager = APIManager()
        let send = try await apiManager.postRequest(url: signUpUrl, cachePolicy: .useProtocolCachePolicy, model: User.self, body:
                                                        [
                                                            "username": userName,
                                                            "email": email,
                                                            "password": password
                                                        ])
        return send
    }
    
    func fetchUser() async throws -> User {
        let apiManager = APIManager()
        let url = currentUserUrl + "\(signInResponse!.id)"
        print(url)
        let currentUser = try await apiManager.getRequest(url: url, cachePolicy: .useProtocolCachePolicy, model: User.self)
        
        return currentUser
    }
    
    func joinFlatshare(index: Int, code: String) async throws -> FlatshareResponse{
        let apiManager = APIManager()
        let join = try await apiManager.postRequest(
            url: "joinFlatshareUrl\(index)",
            cachePolicy: .useProtocolCachePolicy,
            model: FlatshareResponse.self,
            body:
                [
                    "code": code,
                    "userId": user!.id
                ])
        
        return join
    }
}



