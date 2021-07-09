//
//  NTLoginVC.swift
//

import UIKit

class NTLoginVC: UIViewController {
    
    @IBOutlet weak var emailField: NTTextField!
    @IBOutlet weak var passwordField: NTTextField!
    
    let loginViewModel: NTLoginViewModel = NTLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.text = "thahiraf@gmail.com"
        self.passwordField.text = "12345"
        self.initializeLoginViewModel()
    }
    
    fileprivate func initializeLoginViewModel() {
        self.loginViewModel.showLoading = {
            self.startActivityIndicator()
        }
        self.loginViewModel.hideLoading = {
            self.stopActivityIndicator()
        }
        self.loginViewModel.showFailureAlert = {title, message in
            self.presentAlert(withTitle: title, message: message)
        }
        self.loginViewModel.loginSucceeded = {loginResponse in
            CommonRouting.navigateToDashBoard()
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard self.emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            self.presentAlert(withTitle: "Email Required", message: "Please enter email")
            return
        }
        guard self.passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            self.presentAlert(withTitle: "password Required", message: "Please enter password")
            return
        }
        self.loginViewModel.login(userName: self.emailField.text!, password: self.passwordField.text!)
    }
}
