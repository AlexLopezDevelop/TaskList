//
//  ViewControllerEdit.swift
//  TaskList
//
//  Created by Alex Lopez on 31/1/18.
//  Copyright © 2018 alex.lopez. All rights reserved.
//

import UIKit

class ViewControllerEdit: UIViewController {

    
    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var desc: UITextField!
    
    var position: Int?
    
    @IBAction func save(_ sender: Any) {//editamos tanto el atitulo como el asunto
        let tarea = task.text
        let descripcion = desc.text
        tareas[position!].nombre = tarea!
        tareas[position!].descripcion = descripcion!
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {//el titulo y descripcion actual lo asociamos a los input text
        super.viewDidLoad()
        task.text = tareas[position!].nombre
        desc.text = tareas[position!].descripcion
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
