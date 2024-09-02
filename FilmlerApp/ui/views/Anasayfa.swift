//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Ceren Acay on 30.08.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
        let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
        let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
        let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //tasarim.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        // 10 x 10 x 10 = 30 ( Topla )
        
        //15 x 10 x 10 x 15 = 50 ( Topla )
        
       
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30)/2
        //let itemGenislik = (ekranGenislik - 50)/3
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        
        filmlerCollectionView.collectionViewLayout = tasarim

    }
}

extension Anasayfa : UICollectionViewDelegate , UICollectionViewDataSource , HucreProtocol{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        hucre.ImageViewFilmler.image = UIImage(named: film.resim!)
        hucre.lblFiyat.text = "\(film.fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let film = sender as? Filmler{
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
                
            }
            
        }
    }
    func sepeteEkleTikla(indexpath: IndexPath) {
        let film = filmlerListesi[indexpath.row]
        print("\(film.ad!) sepete eklendi")
    }
}

