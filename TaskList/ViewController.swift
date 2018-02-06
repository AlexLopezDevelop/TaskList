//
//  ViewController.swift
//  TaskList
//
//  Created by Alex Lopez on 30/1/18.
//  Copyright © 2018 alex.lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var type: UIPickerView!
    
    var typeList = ["Personal","Trabajo"]
    var defaultType = "Personal"
    
    @IBAction func save(_ sender: Any) {//Asociamos el titulo y la descripcion a la tarea
        let tarea = task.text
        let descripcion = desc.text
        let t = Tarea( nombre: tarea!, descripcion: descripcion!, tipo: defaultType, finalizada: false)
        tareas.append(t)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        type.delegate = self
        type.dataSource = self
        
        if(defaultType == "Trabajo"){
            self.view.backgroundColor = UIColor.brown
        }else{
            self.view.backgroundColor = UIColor.cyan
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaultType = typeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeList[row]
    }
    
}

