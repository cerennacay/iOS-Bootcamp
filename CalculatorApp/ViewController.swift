import UIKit

class ViewController: UIViewController {
    
    var ekranLabel: UILabel!
    var sayi1: Double = 0
    var sayi2: Double = 0
    var sonuc: Double = 0
    var secilenIslem: String = ""
    var islemSecildi: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // Label'ı oluştur
        ekranLabel = UILabel()
        ekranLabel.text = "0"
        ekranLabel.textAlignment = .right
        ekranLabel.font = UIFont.systemFont(ofSize: 64)
        ekranLabel.textColor = .white
        ekranLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ekranLabel)
        
        // Label'ın konumlandırılması
        NSLayoutConstraint.activate([
            ekranLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            ekranLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ekranLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ekranLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Düğme dizilimi
        let buttonTitles = [
            
            
            ["7", "8", "9", "*"],
            ["4", "5", "6", "-" ],
            ["1", "2", "3", "+"],
            ["0", ".", "="],
            ["C" , "DEL" , "%" ,"/"],
            
        ]
        
        let buttonColors: [String: UIColor] = [
            "numbers": UIColor.darkGray,
            "operations": UIColor.orange,
            "zero": UIColor.darkGray
        ]
        
        var buttons = [[UIButton]]()
        
        for row in buttonTitles {
            var buttonRow = [UIButton]()
            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                button.translatesAutoresizingMaskIntoConstraints = false
                
                // Buton renkleri
                if "+-*/=".contains(title) {
                    button.backgroundColor = buttonColors["operations"]
                } else if title == "0" {
                    button.backgroundColor = buttonColors["zero"]
                } else {
                    button.backgroundColor = buttonColors["numbers"]
                }
                
                // "0" köşeli yap (tamamen köşeli)
                              if title == "0" {
                                  button.layer.cornerRadius = 10// Daha köşeli yapmak için küçük bir değer
                              } else {
                                  button.layer.cornerRadius = 40// Diğer butonlar yuvarlak kalıyor
                              }
                              
                              button.clipsToBounds = true
                              view.addSubview(button)
                              buttonRow.append(button)
                          }
                          buttons.append(buttonRow)
                      }
        
        // Butonların yerleşimi
               for (i, row) in buttons.enumerated() {
                   for (j, button) in row.enumerated() {
                       // 0, . ve = butonlarının olduğu sıra için farklı aralıklar belirliyoruz
                       if i == 3 {
                           if j == 0 { // 0 butonu için daha geniş alan
                               NSLayoutConstraint.activate([
                                   button.widthAnchor.constraint(equalToConstant: 160), // 2 birim geniş
                                   button.heightAnchor.constraint(equalToConstant: 80),
                                   button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                   button.topAnchor.constraint(equalTo: ekranLabel.bottomAnchor, constant: CGFloat(i) * 100 + 20)
                               ])
                           } else { // . ve = butonları için boşluk arttırıldı
                               NSLayoutConstraint.activate([
                                   button.widthAnchor.constraint(equalToConstant: 80),
                                   button.heightAnchor.constraint(equalToConstant: 80),
                                   button.leadingAnchor.constraint(equalTo: buttons[i][j-1].trailingAnchor, constant: 30),
                                   button.topAnchor.constraint(equalTo: ekranLabel.bottomAnchor, constant: CGFloat(i) * 100 + 20)
                               ])
                           }
                       } else { // Diğer sıralar için standart yerleşim
                           NSLayoutConstraint.activate([
                               button.widthAnchor.constraint(equalToConstant: 80),
                               button.heightAnchor.constraint(equalToConstant: 80),
                               button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(j) * 100 + 20),
                               button.topAnchor.constraint(equalTo: ekranLabel.bottomAnchor, constant: CGFloat(i) * 100 + 20)
                           ])
                       }
                   }
               }
           }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "0"..."9", ".":
            if islemSecildi {
                ekranLabel.text = title
                islemSecildi = false
            } else {
                ekranLabel.text = (ekranLabel.text == "0") ? title : ekranLabel.text! + title
            }
            
        case "+", "-", "*", "/":
            islemSecildi = true
            sayi1 = Double(ekranLabel.text!) ?? 0
            secilenIslem = title
            
        case "=":
            sayi2 = Double(ekranLabel.text!) ?? 0
            hesapla()
            
        case "C": // Tüm ekranı temizle
            ekranLabel.text = "0"
            sayi1 = 0
            sayi2 = 0
            sonuc = 0
            secilenIslem = ""
            islemSecildi = false
            
        case "Del": // Son karakteri sil
            if var text = ekranLabel.text, !text.isEmpty {
                text.removeLast()
                ekranLabel.text = text.isEmpty ? "0" : text
            }
            
        default:
            break
        }
    }
    
    func hesapla() {
        switch secilenIslem {
        case "+":
            sonuc = sayi1 + sayi2
        case "-":
            sonuc = sayi1 - sayi2
        case "*":
            sonuc = sayi1 * sayi2
        case "/":
            sonuc = sayi1 / sayi2
        default:
            sonuc = 0
        }
        
        ekranLabel.text = "\(sonuc)"
        islemSecildi = true
    }
}

