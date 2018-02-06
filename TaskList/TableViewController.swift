//
//  TableViewController.swift
//  TaskList
//
//  Created by Alex Lopez on 30/1/18.
//  Copyright © 2018 alex.lopez. All rights reserved.
//

import UIKit
var tareas = [Tarea]()

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tareas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! MyCell
        
        cell.tittle.text = tareas[indexPath.row].nombre
        cell.descrip.text = tareas[indexPath.row].descripcion
        
        if(tareas[indexPath.row].tipo == "Personal"){ //Asociamos una imagen segun el tipo de tarea
            cell.typeTask.image = UIImage(named: "home")
        }else{
            cell.typeTask.image = UIImage(named: "trabajo")
        }
        
        if(tareas[indexPath.row].finalizada == true){//En el caso de que se marque la tarea como hecha saldra una imagen
            cell.done.image = UIImage(named: "tick");
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Eliminar"){
            (action, indexPath) -> Void in
            self.isEditing = true
            tareas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let finAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Finalizar"){
            (action, indexPath) -> Void in
            self.isEditing = true
            tareas[indexPath.row].finalizada = true
            tableView.reloadData()
        }
        finAction.backgroundColor = UIColor.green
        deleteAction.backgroundColor = UIColor.red
        return [finAction, deleteAction]

    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//Asociamos la vista de editar para cuando pulse entre a dicha vista
        if(segue.identifier == "segueModificar"){
            let pantalla: ViewControllerEdit = segue.destination as! ViewControllerEdit
            let fila = sender as! Int
            pantalla.position = fila
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueModificar", sender: indexPath.row)
    }

}
