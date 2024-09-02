//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Ceren Acay on 28.08.2024.
//

import UIKit

class KisiDetay: UIViewController {
    
    
    @IBOutlet weak var tfKisi_Ad: UITextField!
    
    @IBOutlet weak var tfKisi_Tel: UITextField!
    
    var Kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = Kisi{
            
            tfKisi_Ad.text = k.kisi_ad
            tfKisi_Tel.text = k.kisi_tel
        }
    }
    
    @IBAction func btnGuncelle(_ sender: Any) {
        
        if let ka = tfKisi_Ad.text , let kt = tfKisi_Tel.text , let k = Kisi{
            
            guncelle(kisi_id: k.kisi_id! , kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    func guncelle (kisi_id:Int , kisi_ad:String , kisi_tel:String){
        
        print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
}
