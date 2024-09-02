//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Ceren Acay on 22.08.2024.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var lblAnasayfa: UILabel!
    
    // Leading : Sol (left)
    // Trailing : Sağ (right)
    
    override func viewDidLoad() { // Uygulama ilk açıldığında çalışır. ( 1 kere çalışır )
        super.viewDidLoad()
        
        lblAnasayfa.text = "Hoşgeldiniz"
        print("viewDidLoad çalıştı")
        
    }
    
    override func viewWillAppear(_ animated: Bool) { // Sayfa her göründüğünde çalışır.
        print("viewWillAppear çalıştı")
        // Sayfaya geri dönüldüğünde çalışır.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear çalıştı")
    }
    
    override func viewDidAppear(_ animated: Bool) { // Sayfa her görünmez olduğunda çalışır.
        print("viewDidAppear çalıştı")
    }

    @IBAction func btnYap(_ sender: Any) {
        
        lblAnasayfa.text = "Merhaba"
    }
    
    
    @IBAction func btnBasla(_ sender: Any) {
        let kisi = Kisiler(ad: "Ceren", yas: 25, boy: 1.60, bekar: true)
        
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("prepare metodu çalıştı")
        
        if segue.identifier == "oyunEkraninaGecis"
        {
            print("oyunEkraninaGecis çalıştı")
            
            if let veri = sender as? Kisiler
            {
                
                let gidilecekVC = segue.destination as! OyunEkraniVC
                gidilecekVC.kisi = veri
            }
            
        }
    }
    
    
    @IBAction func buttonAdd(_ sender: Any) {
        print("Add seçildi")
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        print("Save seçildi")
    }
    
    
}


