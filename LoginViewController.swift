//
//  LoginViewController.swift
//  TestTendable
//
//  Created by Suprabha Dhavan on 30/05/24.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    private let networkManager = NetworkManager()
    var lblText = "Valid"
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func loginFun() {
        let url = "http://localhost:5001/api/login"
        networkManager.getLogin(username: usernameTextField.text!, password: passwordTextField.text!, urlStr: url)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : UIViewController = storyboard.instantiateViewController(withIdentifier: "ChoiceViewController") as UIViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    func registerFun() {
        let url = "http://localhost:5001/api/register"
        networkManager.getRegister(username: usernameTextField.text!, password: passwordTextField.text!, urlStr: url)
    }
    @IBAction func loginBtnAction(_ sender: Any) {
        if !(usernameTextField.text == "" && passwordTextField.text == "") {
            
            if lblText == "Valid" {
                loginBtnOutlet.setTitle("LOGIN", for: .normal)
                loginFun()
            }else{
                loginBtnOutlet.setTitle("REGISTER", for: .normal)
                registerFun()
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
