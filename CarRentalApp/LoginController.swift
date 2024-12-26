//
//  LoginController.swift
//  CarRentalApp
//
//  Created by Elnur Mammadov on 21.12.24.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var emailTextFIeld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let manager = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func logInBittonAction(_ sender: Any) {
        guard let email = emailTextFIeld.text, !email.isEmpty,
        let password = passwordTextField.text, !password.isEmpty
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill all fields!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            return
        }
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        sceneDelegate.tabRoot()
        manager.setValue(value: true, key: .isLoggedIn)
    }
    
}
