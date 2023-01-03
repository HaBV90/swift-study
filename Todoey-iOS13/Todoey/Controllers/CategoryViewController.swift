//
//  CategoryViewController.swift
//  Todoey
//
//  Created by HaBV on 15/12/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    @IBOutlet weak var titleCategoryItem: UILabel!
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        loadCategories()
        guard let navBar = navigationController?.navigationBar else {
            fatalError("Navigation controller does not exits.")
        }
        if let navColor = navBar.barTintColor {
            var appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(hexString: navColor.hexValue())
            self.navigationItem.standardAppearance = appearance
            self.navigationItem.scrollEdgeAppearance = appearance
        }
        
    }
    
    // MARK: - Add category button press
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add category", style: .default) { (action) in
            
            if let safeText = textField.text {
                let newCategory = Category()
                newCategory.name = safeText
                newCategory.color = UIColor.randomFlat().hexValue()
                self.saveCategories(category: newCategory)
            }
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = categories?[indexPath.row] {
            cell.textLabel?.text = item.name
            cell.backgroundColor = UIColor(hexString: item.color ?? "1D9BF6")
        }
        return cell
    }
    
    // MARK: - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if(tableView.isEditing){
            return false;
        } else {
            return true;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    // MARK: - Data manipulation Methods
    func saveCategories(category: Category) {
        do {
            try! realm.write{
                realm.add(category)
            }
        } catch {
            print("Error save category -> \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = self.realm.objects(Category.self)
        tableView.reloadData()
        
    }
    
    // MARK: - Remove data from swipe
    override func updateModel(at indexPath: IndexPath) {
        if let categoryItemDelete = self.categories?[indexPath.row] {
            do {
                try! self.realm.write{
                    self.realm.delete(categoryItemDelete)
                }
            } catch {
                print("error delete category item -> \(error)")
            }
        }
    }
}
