//
//  VCNovo_Elem.swift
//  Tabela
//
//  Created by Aluno on 21/05/2019.
//  Copyright © 2019 Benjamim. All rights reserved.
//

import UIKit

class VCNovo_Elem: UIViewController {
    
    var cidade:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden=false;
    }
    
    @IBOutlet weak var txtCidade: UITextField!
    
    //MARK: Segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (txtCidade.text == ""){
            print("nome tem de ser preenchido")
            return false
        }
        return true
    }
}

