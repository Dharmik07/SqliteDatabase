//
//  ViewController.swift
//  commitPullDemo
//
//  Created by user11 on 9/1/17.
//  Copyright © 2017 user11. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet var txtNo: UITextField!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtDepartment: UITextField!
    @IBOutlet var txtYear: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func btnSaveClicked(_ sender: Any)
    {
        var success: Bool = false
        var alertString: String = "Data Insertion failed"
        if txtNo.text?.characters.count != 0 && txtName.text?.characters.count != 0 && txtDepartment.text?.characters.count != 0 && txtYear.text?.characters.count != 0
        {
            success = DBManager.getSharedInstance().saveData(txtNo.text, name: txtName.text, department: txtDepartment.text, year: txtYear.text)
//            success = true
        }
        else
        {
            alertString = "Enter all fields"
        }
        if success == false
        {
            let alert = UIAlertView(title: alertString, message: "Please enter your details", delegate: self as? UIAlertViewDelegate,cancelButtonTitle: "Ok")
            alert.show()
        }
        else
        {
            let alert = UIAlertView(title: "SqliteDatabase", message: "Data Save Successfully", delegate: self as? UIAlertViewDelegate,cancelButtonTitle: "Ok")
            alert.show()
            print("Data Save Successfully")
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

