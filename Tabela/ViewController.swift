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
    var arrayB = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Atributtes
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    //MARK: Actions
    
    @IBAction func butActionValidar(_ sender: Any) {
        verifyChosen()
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
        
        if tableView == tableView1{
                cell.textLabel?.text = array[indexPath.row]
                cell.detailTextLabel?.text = "Texto Extra"
                return cell
        }
        
        if tableView == tableView2{
            cell.textLabel?.text = array[indexPath.row]
            cell.detailTextLabel?.text = "Texto Extra da segunda"
            cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
            //cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            //if arrayB[indexPath.row] {
                //cell.accessoryType = UITableViewCellAccessoryType.checkmark
            //} else {
              //  cell.accessoryType = UITableViewCellAccessoryType.none
            //}
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        if tableView == tableView1{let editar = UITableViewRowAction(style: .default, title: "Editar"){action,index in
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
        } else {
            let editar = UITableViewRowAction(style: .default, title: "Editar"){action,index in
                print("Editar: " + String(index.row) + " " + self.array[index.row])
                self.performSegue(withIdentifier: "segue1", sender: indexPath)
            }
            
            editar.backgroundColor = UIColor.blue
            let delete = UITableViewRowAction(style: .default, title: "Apagar"){action,index in
                print("Apagar: " + String(index.row) + " " + self.array[index.row])
            }
            delete.backgroundColor = UIColor.red
            return [editar, delete]
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableView1{
            if arrayB[indexPath.row] {
                tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
                arrayB[indexPath.row] = false
            } else {
                tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
                arrayB[indexPath.row] = true
            }
        } else {
        }
        
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if tableView == tableView2 {
            let alert = UIAlertController(title: "Alert", message: array[indexPath.row], preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            print(indexPath.row)
        }
    }
    
    func verifyChosen(){
        print("---------")
        for index in 0...arrayB.count-1 {
            if arrayB[index]{
                print(array[index])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "segue1", sender: tableView2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue1") {
            let idx = sender as! IndexPath
            let vcdetalhe = (segue.destination as! VCDetalhe)
            vcdetalhe.cidade = array[idx.row]
        }
        
        
    }

}
