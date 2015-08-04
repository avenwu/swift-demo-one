//
//  PickerHelper.swift
//  Dialog
//
//  Created by aven wu on 8/4/15.
//  Copyright (c) 2015 avenwu. All rights reserved.
//

import UIKit


class PickerSource: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

class PickerDelegate: NSObject, UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row) +1"
    }
}

func newPicerView(controller: UIViewController) -> UIPickerView {
    var picker = UIPickerView()
    picker.dataSource = PickerSource()
    picker.delegate = PickerDelegate()
    picker.center = controller.view.center
    controller.view.addSubview(picker)
    return picker
}