//
//  LoginViewModel.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 23.03.2022..
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    private let useCase: LoginUseCaseProtocol
    private var cancelBag = Set<AnyCancellable>()
    private var loginData = Login()
    private var userData = User()
    
    @Published var isLoading = false
    @Published var email = String()
    @Published var password = String()
    
    init(useCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.useCase = useCase
    }
    
    func login() {
        isLoading = true
        let user = LoginParameters(password: "semir1234", email: "semir@antcolony.io")
        useCase.login(user)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.isLoading = false
                    case .finished:
                        break
                }
                
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.loginData = value
                self.setTokens()
                self.isLoading = false
                
                //For Testing the next API call
                self.fetchUserData()
            }
            .store(in: &cancelBag)
    }
    
    private func setTokens() {
        UserDefaults.standard.setAccessToken(value: loginData.accessToken)
        UserDefaults.standard.setRefreshToken(value: loginData.refreshToken)
    }
    
    private func fetchUserData() {
        email = "semir@antcolony.io"
        useCase.getUserBy(email)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            } receiveValue: { [weak self] user in
                guard let self = self else { return }
                self.userData = user
                print(self.userData.firstName ?? String())
            }
            .store(in: &cancelBag)
    }
    
    var userName: String {
        userData.firstName ?? String()
    }
}
