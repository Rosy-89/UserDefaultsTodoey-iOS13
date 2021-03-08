//
//  ViewController.swift
//  Todoey
//

//save the data using UserDefaults
import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = ["Find Mike", "Buy eggos", "Cleaning"]
    //var itemArray = [Item()]
    //step 1
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let item1 = Item()
//        item1.title = "Find Mike"
//        item1.done = true
//        itemArray.append(item1)
//
//        let item2 = Item()
//        item2.title = "Buy eggos"
//        item2.done = true
//        itemArray.append(item2)
        
        //step 3 load the defaults array data into an array and show
//        if let  items = defaults.array(forKey: "TodoListArray") as? [Item]{
//            itemArray = items
//        }
        if let  items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
    }
    
   //MARK:- TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        
        return itemArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        //cell.accessoryType = (itemArray[indexPath.row].done) == true ? .checkmark : .none
        
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        //if itemArray[indexPath.row]. = .check!itemArray[indexPath.row]
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Other Methods

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            //let newItem = Item()
            //newItem.title = textField.text!
            //self.itemArray.append(newItem)
            //step 2 setting into userdefaults using the key Todolist
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new item"
            textField = alertTextfield
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

