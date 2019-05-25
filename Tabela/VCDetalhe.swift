//
//  VCDetalhe.swift
//  Tabela
//
//  Created by Aluno on 21/05/2019.
//  Copyright © 2019 Benjamim. All rights reserved.
//

import UIKit

class VCDetalhe: UIViewController {
    
    var cidade:String = ""
    var idCidade:Int = -1
    
    @IBOutlet weak var txt1: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden=false;
    }
    
    //MARK: Segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (txt1.text == ""){
            print("nome tem de ser preenchido")
            return false
        }
        return true
    }
    
}
