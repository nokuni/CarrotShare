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
    @Published var chores: [Chore] = []
    @Published var signInResponse: SignInResponse?
    @Published var isShowingLoginAlert: Bool = false
    
    let choreUrl = "http://localhost:8080/chores/index"
    let flatshareUrl = "http://localhost:8080/flatshares/index"
    let signUpUrl = "http://localhost:8080/api/signup"
    let signInUrl = "http://localhost:8080/api/signin"
    
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
    
    func fetchChores() async throws -> [Chore]{
        let apiManager = APIManager()
        let result = try await apiManager.getRequest(url: choreUrl, cachePolicy: .returnCacheDataElseLoad, model: [Chore].self)
        
        return result
    }
    
    func fetchFlatshares() async throws -> [Flatshare] {
        let apiManager = APIManager()
        let result = try await apiManager.getRequest(url: flatshareUrl, cachePolicy: .returnCacheDataElseLoad, model: [Flatshare].self)
        
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
            "id": 1,
            "username": userName,
            "email": "iJoe@email.com",
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
}
