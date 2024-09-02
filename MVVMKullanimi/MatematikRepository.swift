//
//  MatematikRepository.swift
//  MVVMKullanimi
//
//  Created by Ceren Acay on 2.09.2024.
//

import Foundation
import RxSwift

class MatematikRepository {
    
var sonuc = BehaviorSubject<String>(value: "0")

func toplamYap (alinansayi1 :String , alinansayi2:String) {
    
    if let sayi1 =  Int(alinansayi1) , let sayi2 = Int(alinansayi2) {
        let toplam = sayi1 + sayi2
        sonuc.onNext(String(toplam)) // Tetikleme
    }
}
func carpmaYap (alinansayi1 :String , alinansayi2:String) {
    if let sayi1 =  Int(alinansayi1) , let sayi2 = Int(alinansayi2) {
        let carpma = sayi1 * sayi2
        sonuc.onNext(String(carpma)) // Tetikleme
    }
}

}
