//
//  ViewController.swift
//  Todoey
//
//  Created by Bonnie Glaser on 4/25/19.
//  Copyright © 2019 Bonnie Glaser. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Item: \(itemArray[indexPath.row])")
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            print("No Accessory")
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            print("Checkmark accessory")
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

