//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeTableViewController {
    
    @IBOutlet weak var titleToDoItem: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let realm = try! Realm()
    
    var items: Results<Item>?
    
    var selectedCategory: Category? {
        didSet{
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let navAppearance = UINavigationBarAppearance()
        
        guard let navBar = navigationController?.navigationBar else {
            fatalError("Navigation controller does not exist.")
        }
        
        if let colorHex = selectedCategory?.color {
            title = selectedCategory?.name
            
            navAppearance.configureWithOpaqueBackground()
            navAppearance.backgroundColor = UIColor(hexString: colorHex)
            self.navigationItem.standardAppearance = navAppearance
            self.navigationItem.scrollEdgeAppearance = navAppearance
            
            if let navBarColor = UIColor(hexString: colorHex) {
                navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
                navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ContrastColorOf(navBarColor, returnFlat: true)]
                navAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:  ContrastColorOf(navBarColor, returnFlat: true)]
            }
            
            searchBar.barTintColor = UIColor(hexString: colorHex)
            searchBar.searchTextField.backgroundColor = .white
        }
        
    }
    
    // MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = items?[indexPath.row] {
            
            cell.textLabel?.text = item.title
            
            if let colour = UIColor(hexString: selectedCategory!.color!)?.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(items!.count)) {
                cell.backgroundColor = colour
                cell.textLabel?.textColor = ContrastColorOf(colour, returnFlat: true)
            }
            
            cell.accessoryType = item.done ? .checkmark : .none
        }
        
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = items?[indexPath.row] {
            self.updateItem(item: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            print("Delete")
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            // delete the item here
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    // MARK: - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todo item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // what will happen once the  user clicks the add item button on our UIAlert
            
            if let safeText = textField.text {
                let newItem = Item()
                newItem.title = safeText
                newItem.done = false
                newItem.dateCreated = Date()
                self.saveItems(item: newItem)
            }
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Save data
    func saveItems(item: Item) {
        if let currentCategory = self.selectedCategory {
            do {
                try! realm.write{
                    currentCategory.items.append(item)
                }
                
            } catch {
                print("Error save item -> \(error)")
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Load data
    func loadItems() {
        
        items = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
        
    }
    
    // MARK: - Remove data
    func removeItem(indexPath: IndexPath) {
        if let safeItem = self.items?[indexPath.row] {
            do {
                try! realm.write{
                    realm.delete(safeItem)
                }
                
            } catch {
                print("Error remove item -> \(error)")
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Update data
    func updateItem(item: Item) {
        
        do {
            try! realm.write{
                item.done = !item.done
            }
            
        } catch {
            print("Error update item -> \(error)")
        }
        
        tableView.reloadData()
    }
}

// MARK: - Search bar methods
extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //        items = items?.filter( "title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        items = items?.filter( "title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
}
