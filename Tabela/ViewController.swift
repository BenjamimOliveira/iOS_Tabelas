//
//  ViewController.swift
//  Tabela
//
//  Created by Benjamim on 07/05/19.
//  Copyright © 2019 Benjamim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {

    var array = ["Viana", "Braga", "Barcelos", "Porto"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    //MARK: UiTableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = array[indexPath.row]
        cell.detailTextLabel?.text = "Texto Extra"
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editar = UITableViewRowAction(style: .default, title: "Editar"){action,index in
            print("Editar: " + String(index.row) + " " + self.array[index.row])
        }
        editar.backgroundColor = UIColor.blue
        
        let delete = UITableViewRowAction(style: .default, title: "Apagar"){action,index in
            print("Apagar: " + String(index.row) + " " + self.array[index.row])
        }
        delete.backgroundColor = UIColor.red
        
        let teste = UITableViewRowAction(style: .default, title: "Teste"){action,index in
            print("Teste: " + String(index.row) + " " + self.array[index.row])
        }
        teste.backgroundColor = UIColor.green
        
        return [editar, delete, teste]
        
    }
    
}

