//
//  TableViewCell.swift
//  TextField
//
//  Created by Zwelithini Mathebula on 2017/08/22.
//  Copyright © 2017 Zwelithini Mathebula. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    typealias TextFieldShouldReturn = () -> (Bool)
    typealias FieldSetupHandler = (_ cell: TableViewCell, _ textfield: UITextField) -> ()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    var shouldReturn: TextFieldShouldReturn?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*:
     ### USE THIS FUNC TO SETUP YOUR TEXTFIELD
     * Text color and font
     * Fieldtype(Password)
     * Keyboard Type,etc
     * also note you can have unlimited params,take the use of title as an example
     */
    func setup(title: String = "",config: FieldSetupHandler?) {
        
        titleLabel.text = title
        config?(self,textField)
    }
}

extension TableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return shouldReturn?() ?? true
    }
    
    override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
        return true
    }
}
