//
//  ViewController.swift
//  Date&TimePickerKullanimi
//
//  Created by Ceren Acay on 1.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfSaat: UITextField!
    @IBOutlet weak var tfTarih: UITextField!
    
    var datePicker : UIDatePicker?
    var timePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        let dokunmaAlgilama = UITapGestureRecognizer (target: self, action: #selector(dokunmaAlgilamaMethod))
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
        
        view.addGestureRecognizer(dokunmaAlgilama)
        
    }
    
    @objc func dokunmaAlgilamaMethod() {
        print("Ekrana Dokunuldu")
        view.endEditing(true)
    }
    
    @objc func tarihGoster(uiDatePicker : UIDatePicker)
    {
        let format = DateFormatter()
        format.dateFormat = "MM//dd//yyyy"
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster(uiDatePicker : UIDatePicker)
    {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }

}

