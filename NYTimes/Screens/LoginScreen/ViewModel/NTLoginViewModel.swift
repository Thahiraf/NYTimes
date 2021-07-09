//
//  NTLoginViewModel.swift
//  NYTimes

import Foundation

class NTLoginViewModel: NTLoadingAnimatable, NTAlertable {
    
    var showLoading: (() -> Void)!
    var hideLoading: (() -> Void)!
    var showSuccessAlert: ((String, String) -> Void)!
    var showFailureAlert: ((String, String) -> Void)!
    
    var loginSucceeded: ((_ loginResponse: NTLoginResponse) -> Void)!
    
    func login(userName email: String, password: String) {
        self.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.hideLoading()
            if email == "thahiraf@gmail.com" {

                let loginResponse: NTLoginResponse = NTLoginResponse.init("OK", "Login Successful")
                self.loginSucceeded(loginResponse)
            } else {
                self.showFailureAlert("Login Failed", "Invalid username or password")
            }
        }
    }
}
