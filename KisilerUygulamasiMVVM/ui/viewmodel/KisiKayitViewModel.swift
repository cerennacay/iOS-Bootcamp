//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Ceren Acay on 2.09.2024.
//

import Foundation

class KisiKayitViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func kaydet(kisi_ad:String , kisi_tel:String) {
        
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
}
