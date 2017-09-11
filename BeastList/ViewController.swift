//
//  ViewController.swift
//  BeastList
//
//  Created by H on 9/11/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tasks = ["Something cool", "Something VERY cool", "Something EXTREMELY cool"]
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        tasks.append(taskTextField.text!)
        taskTextField.text = ""
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// TableView methods
//     How many cells are we going to need?
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // return an integer that indicates how many rows (cells) to draw
            return tasks.count
        }
        // How should I create each cell?
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Get the UITableViewCell and create/populate it with data then return it
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = tasks[indexPath.row]
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Section: \(indexPath.section) and Row: \(indexPath.row)")
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
}
