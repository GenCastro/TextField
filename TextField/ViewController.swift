//
//  ViewController.swift
//  TextField
//
//  Created by Zwelithini Mathebula on 2017/08/22.
//  Copyright © 2017 Zwelithini Mathebula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var firstFieldCell: TableViewCell!
    var secondFieldCell: TableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        configure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func configure(){
        configureFirstTextField()
        configure2ndTextField()
    }
    func configureFirstTextField() {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {return}
        
        firstFieldCell = cell
        
        firstFieldCell.setup(title: "Password", config: {(_,textfield) in
        
            textfield.isSecureTextEntry = true
            textfield.returnKeyType = .next
            
        })
        
        firstFieldCell.shouldReturn = {[unowned self] in
            
            //what must happen when next is clicked
            _ = self.secondFieldCell.becomeFirstResponder()
            return true
        }
        
    }
    
    func configure2ndTextField() {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {return}
        
        secondFieldCell = cell
        
        ///title will use default set value i.e ("") nothing
        secondFieldCell.setup { (cell, textField) in
            textField.placeholder = "Enter Number"
            textField.keyboardType = .numberPad
        }
        
        secondFieldCell.shouldReturn = {
            return false
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return indexPath.row == 0 ? firstFieldCell : secondFieldCell
    }
}

