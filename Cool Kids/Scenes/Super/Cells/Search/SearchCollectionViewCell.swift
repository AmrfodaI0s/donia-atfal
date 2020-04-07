//
//  SearchCollectionViewCell.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/16/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var search_textfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        search_textfield.delegate = self
    }
    
    @IBAction func serachBtnTapped(_ sender: UIButton) {
        checkTextifEmpty()
    }

}

//MARK: - Search TextFiled Delegate methods
extension SearchCollectionViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        search_textfield.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkTextifEmpty()
        return true
    }
    func checkTextifEmpty() {
        if search_textfield.text!.isEmpty {
            search_textfield.placeholder = "الرجاء ملئ هذا الحقل"
        } else {
            search_textfield.endEditing(true)
            search_textfield.placeholder = ""
        }
    }
}
