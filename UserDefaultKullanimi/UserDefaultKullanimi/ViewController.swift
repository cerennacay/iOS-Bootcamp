//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by Kasım on 9.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tanımlama
        let ud  = UserDefaults.standard
        
        //Kayıt
        ud.set("Ahmet", forKey: "ad")
        ud.set(23, forKey: "yas")
        ud.set(1.78, forKey: "boy")
        ud.set(true, forKey: "bekar")
        
        let liste = ["ali","ece"]
        ud.set(liste, forKey: "liste")
        
        let sehirler = ["16":"BURSA","34":"İSTANBUL"]
        ud.set(sehirler, forKey: "sehirler")
        
        //Silme
        //ud.removeObject(forKey: "ad")
        
        //Okuma
        let gelenAd = ud.string(forKey: "ad") ?? "isim yok"
        let gelenYas = ud.integer(forKey: "yas")//0
        let gelenBoy = ud.double(forKey: "boy")//0.0
        let gelenBekar = ud.bool(forKey: "bekar")//false
        print("Gelen Ad    : \(gelenAd)")
        print("Gelen Yaş   : \(gelenYas)")
        print("Gelen Boy   : \(gelenBoy)")
        print("Gelen Bekar : \(gelenBekar)")
        
        let gelenListe = ud.array(forKey: "liste") ?? [String]()
        
        for a in gelenListe {
            print("Gelen Liste : \(a)")
        }
        
        let gelenSehirler = ud.dictionary(forKey: "sehirler") ?? [String:String]()
        
        for (anahtar,deger) in gelenSehirler {
            print("Gelen Şehir : \(anahtar) -> \(deger)")
        }
        
        //Sayaç Uygulaması
        var sayac = ud.integer(forKey: "sayac")//0
        
        sayac = sayac + 1
        
        ud.set(sayac, forKey: "sayac")
        
        labelSayac.text = "Açılış Sayısı : \(sayac)"
    }
}

