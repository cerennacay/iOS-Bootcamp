//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by Ceren Acay on 2.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblSonuc: UILabel!
    @IBOutlet weak var tfSayi1: UITextField!
    
    @IBOutlet weak var tfSayi2: UITextField!
    
    var viewModel = AnasayfaViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = viewModel.sonuc.subscribe(onNext: {s in // Dinleme
                  
                  self.lblSonuc.text = s
              })
        
    }

    
    @IBAction func btnToplama(_ sender: Any) {
        
        if let alinanSayi1 = tfSayi1.text , let alinanSayi2 = tfSayi2.text {
                    viewModel.toplamYap(alinansayi1: alinanSayi1, alinansayi2: alinanSayi2)
                }
    }
    
    
    @IBAction func btnCarpma(_ sender: Any) {
        
        if let alinanSayi1 = tfSayi1.text , let alinanSayi2 = tfSayi2.text {
                    viewModel.carpmaYap(alinansayi1: alinanSayi1, alinansayi2: alinanSayi2)
                    
                }
    }
    
}

