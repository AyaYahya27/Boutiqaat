//
//  MenuController.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 07/11/2021.
//

import UIKit

protocol MenuControllerDelegate{
    func didSelectMenuItem(named: String)
}

class MenuController: UITableViewController{
    
    //MARK: -Properties
    
    private let menuItems : [String]
    public var delegate: MenuControllerDelegate?
    
    //MARK: -Initialization
    
    init(with menuItems: [String]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.layer.backgroundColor = UIColor.clear.cgColor
//        tableView.view.backgroundColor = UIColor.clear
       

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .darkGray
//        view.backgroundColor = UIColor(white: 0.3, alpha: 0.9)
//        tableView.layer.backgroundColor = UIColor.clear.cgColor
    }
    //MARK: -Table
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
//        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
        
    }
    
    
}
