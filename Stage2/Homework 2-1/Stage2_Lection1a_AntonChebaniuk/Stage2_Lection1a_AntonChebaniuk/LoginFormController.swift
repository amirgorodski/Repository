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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnScroll))
        scrollPage.addGestureRecognizer(tapGesture)
        scrollPage.isUserInteractionEnabled = true

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbsize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbsize.size.height, right: 0)
        scrollPage.contentInset = insets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let insets = UIEdgeInsets.zero
        scrollPage.contentInset = insets
    }
    
    @objc func didTapOnScroll() {
        view.resignFirstResponder()
    }
    
    @IBAction func login(_ sender: UIButton) {
        header.text = "Wrong Email or Password"
        emailField.layer.borderColor = UIColor.red.cgColor
    }
    

}
