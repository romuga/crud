//
//  InicioViewController.swift
//  crud
//
//  Created by Ross on 06/01/21.
//

import UIKit

enum ProviderType: String{
    case basic
}
class InicioViewController: UIViewController {

    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

}
