//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Ceren Acay on 2.09.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var sonuc = BehaviorSubject<String>(value: "0")
    var mrepo = MatematikRepository()
    
    init(){
        
        sonuc = mrepo.sonuc
    }
    
    func toplamYap (alinansayi1 :String , alinansayi2:String) {
        
        mrepo.toplamYap(alinansayi1: alinansayi1, alinansayi2: alinansayi2)
        
    }

    func carpmaYap (alinansayi1 :String , alinansayi2:String) {
        
        mrepo.carpmaYap(alinansayi1: alinansayi1, alinansayi2: alinansayi2)
        
        }
    }
    
