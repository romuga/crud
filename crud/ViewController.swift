//
//  ViewController.swift
//  crud
//
//  Created by Ross on 04/01/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var usuarioText: UITextField!
    @IBOutlet weak var contraText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func signIn(_ sender: UIButton) {
        if let email = usuarioText.text, let pass = contraText.text{
            Auth.auth().signIn(withEmail: email, password: pass){
                (result, error) in
                
                if let result = result, error == nil{
                    //self.navigationController?.pushViewController(InicioViewController(email: result.user.email!, provider: .basic), animated: true)
                    self.performSegue(withIdentifier: "inicio", sender: InicioViewController.self)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Usuario y/o contraseña incorrectos", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
    }
    
}

}
