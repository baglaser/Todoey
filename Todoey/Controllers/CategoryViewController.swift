//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Bonnie Glaser on 5/14/19.
//  Copyright © 2019 Bonnie Glaser. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    var categoryArray = [TodoeyCategory]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    //MARK: Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArray.count
    }
    
    //MARK: Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: Model Manipulation Methods
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<TodoeyCategory> = TodoeyCategory.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
        
        tableView.reloadData()
    }

    //MARK: Add New Categories Methods
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            // what will happen once the user clicks the Add Item button on the UIAlert
            print(textField.text!)
            
            let newCategory = TodoeyCategory(context: self.context)
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            
            self.saveCategories()
            print("Success!")
        }
        
        alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
