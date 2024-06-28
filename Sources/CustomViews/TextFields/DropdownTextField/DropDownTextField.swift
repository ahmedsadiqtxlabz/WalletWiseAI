//
//  DropDownTextField.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 28/06/2024.
//

import UIKit

// Protocol to handle dropdown selection in SwiftUI
protocol DropDownTextFieldDelegate: AnyObject {
    func dropdown(textField: DropDownTextField, selectedItem: String)
}

class DropDownTextField: UITextField, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    weak var ddDelegate: DropDownTextFieldDelegate?
    var picker: UIPickerView = UIPickerView()
    var itemsList: [String] = []
    var isImageDropDown: Bool = false
    var selectedItem: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    private func initialize() {
        picker.dataSource = self
        picker.delegate = self
        self.delegate = self
        self.inputView = picker
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let btnDone: UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done, target: self,
            action: #selector(donePressed(sender:)))
        let btnFlexible: UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([btnFlexible, btnDone], animated: false)
        self.inputAccessoryView = toolBar
    }

    @objc func donePressed(sender: UIBarButtonItem) {
        if let del = ddDelegate {
            if itemsList.count > 0 && self.selectedItem == nil {
                del.dropdown(textField: self, selectedItem: itemsList[0])
                self.text = itemsList[0]
            }
        }
        self.endEditing(true)
    }

    // MARK: Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsList.count
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int,
                    forComponent component: Int, reusing view: UIView?) -> UIView {
        if isImageDropDown == true {
            let imgView = UIImageView(image: UIImage(named: itemsList[row]))
            imgView.frame = CGRect(x: 145, y: 5, width: 30, height: 30)
            imgView.contentMode = .scaleAspectFit
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
            view.addSubview(imgView)
            return view
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 5, width: 320, height: 30))
            label.text = itemsList[row]
            label.textAlignment = .center
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
            view.addSubview(label)
            return view
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 320
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if itemsList.count > 0 {
            if !isImageDropDown {
                self.selectedItem = itemsList[row]
                self.text = self.selectedItem
            }
            if let del = ddDelegate {
                del.dropdown(textField: self, selectedItem: itemsList[row])
            }
        }
    }

    func setItemList(list: [String]) {
        self.itemsList = list
        picker.reloadAllComponents()
    }
}
