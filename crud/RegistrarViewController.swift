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
                   // self.navigationController?.pushViewController(InicioViewController(email: result.user.email!, provider: .basic), animated: true)
                    self.performSegue(withIdentifier: "inicio", sender: InicioViewController.self)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Error al registrar al usuario", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inicio"{
            let usuario = segue.destination as! InicioViewController
            usuario.email = email.text!
            usuario.pass = password.text!
           
        }
    }
    
}
