//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Ceren Acay on 24.08.2024.
//

import UIKit

class OyunEkraniVC: UIViewController {
    
    var kisi : Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi
        {
            print("--- OyunEkraniVC ---")
            print("Kişi Ad : \(k.ad!)")
            print("Kişi Yaş : \(k.yas!)")
            print("Kişi Boy : \(k.boy!)")
            print("Kişi Bekar mı ? : \(k.bekar!)")
            
            
        }

        
    }
    
    @IBAction func btnGeri(_ sender: Any) {
        
       // navigationController?.popViewController(animated: true) // Bir önceki sayfaya döner.
        navigationController?.popToRootViewController(animated: true) // Anasayfaya döner.
    }
    @IBAction func btnBitir(_ sender: Any) {
        
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
        
    }
}
