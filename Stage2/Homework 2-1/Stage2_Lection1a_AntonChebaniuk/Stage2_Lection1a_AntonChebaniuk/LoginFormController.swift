//
//  LoginFormController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 21.12.2020.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollPage: UIScrollView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkresult = checkUserData()
        if !checkresult {
            showLoginError()
        }
        return checkresult
    }
    
    func checkUserData() -> Bool {
        guard let email = emailField.text, let password = passwordField.text else { return false }
        if email == "1" && password == "1" {
            return true
        } else { return false }
    }
    
    func showLoginError() {
        let alter = UIAlertController(title: "Error", message: "Input credential are incorrect", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: UIButton) {
        
    }
    

}
