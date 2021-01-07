//
//  RegistrarViewController.swift
//  crud
//
//  Created by Ross on 06/01/21.
//

import UIKit
import Firebase

class RegistrarViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func register(_ sender: UIButton) {
        if let email = email.text, let pass = password.text{
            Auth.auth().createUser(withEmail: email, password: pass){
                (result, error) in
                
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(InicioViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Error al registrar al usuario", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    
}
