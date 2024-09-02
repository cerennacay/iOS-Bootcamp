//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Ceren Acay on 28.08.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var srcBarKisiler: UISearchBar!
    
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        srcBarKisiler.delegate = self
        
        kisilerTableView.delegate = self
        
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ceren", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeytin", kisi_tel: "2222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Murat", kisi_tel: "3333")
        
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya dönüldü")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetay"
        {
            if let kisi = sender as? Kisiler
            {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.Kisi = kisi
            }
        }
    }
}
extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara : \(searchText)")
    }
}
    
extension Anasayfa : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kisi = kisilerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        hucre.lblKisiAd.text = kisi.kisi_ad
        hucre.lblKisiTel.text = kisi.kisi_tel
            
            return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {contextualAction, view, bool in
            
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi ?" , preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) {action in
                
                print("Kişi Sil : \(kisi.kisi_id!)")
                      
        }
            
                      alert.addAction(evetAction)
                      
                      self.present(alert, animated: true)
                      
        }
                      
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
    


