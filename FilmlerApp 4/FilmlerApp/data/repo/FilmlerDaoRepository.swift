//
//  FilmlerDaoRepository.swift
//  FilmlerApp
//
//  Created by Kasım on 9.08.2023.
//

import Foundation
import RxSwift
import Alamofire

class FilmlerDaoRepository {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    func filmleriYukle(){
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php",method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data)
                    if let liste = cevap.filmler {
                        self.filmlerListesi.onNext(liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
