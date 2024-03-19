//
//  ViewController.swift
//  zaratmaoyunu
//
//  Created by Dilruba YILMAZ on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblOyuncu1Skor: UILabel!
    @IBOutlet weak var lblOyuncu2Skor: UILabel!
    @IBOutlet weak var lblOyuncu1Puan: UILabel!
    @IBOutlet weak var lblOyuncu2Puan: UILabel!
    @IBOutlet weak var lblOyuncu1Durum: UIImageView!
    @IBOutlet weak var lblOyuncu2Durum: UIImageView!
    @IBOutlet weak var imgZar1: UIImageView!
    @IBOutlet weak var imgZar2: UIImageView!
    @IBOutlet weak var lvlSetSonucu: UILabel!
    
    var oyuncuPuanlari = (birinciOyuncuPuani : 0 , ikinciOyuncuPuani : 0)
    var oyuncuSkorlari = (birinciOyuncuSkoru : 0 , ikinciOyuncuSkoru : 0)
    var oyuncuSira : Int = 1
    var maxSet : Int = 5
    var suankiSet : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let arkaPlan = UIImage(named: "arkaPlan") {
            self.view.backgroundColor = UIColor(patternImage: arkaPlan)
        }
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if suankiSet > maxSet {
            return
        }
        zarDegerleriniUret()
        
    }
    func setSonuc(zar1 : Int, zar2 : Int) {
        
        if oyuncuSira == 1 {
            // yeni set başlangıcı
            oyuncuPuanlari.birinciOyuncuPuani = zar1 + zar2
            lblOyuncu1Puan.text = String(oyuncuPuanlari.birinciOyuncuPuani)
            lblOyuncu1Durum.image = UIImage(named: "bekle")
            lblOyuncu2Durum.image = UIImage(named: "onay")
            lvlSetSonucu.text = "Sıra 2. Oyuncuda"
            oyuncuSira = 2
            lblOyuncu2Puan.text = "0"
        }
        else {
            oyuncuPuanlari.ikinciOyuncuPuani = zar1 + zar2
            lblOyuncu2Puan.text = String(oyuncuPuanlari.ikinciOyuncuPuani)
            lblOyuncu2Durum.image = UIImage(named: "bekle")
            lblOyuncu1Durum.image = UIImage(named: "onay")
            oyuncuSira = 1
            
            
            // seti bitirme işlemleri
            
            if oyuncuPuanlari.birinciOyuncuPuani > oyuncuPuanlari.ikinciOyuncuPuani{
                
                print("1. oyuncu kazandı")
                oyuncuSkorlari.birinciOyuncuSkoru += 1
                lvlSetSonucu.text = "\(suankiSet). Seti 1. oyuncu Kazandı"
                suankiSet += 1
                lblOyuncu1Skor.text = String(oyuncuSkorlari.birinciOyuncuSkoru)
                
            }
            else if  oyuncuPuanlari.ikinciOyuncuPuani > oyuncuPuanlari.birinciOyuncuPuani{
                
                print("2. oyuncu kazandı")
                oyuncuSkorlari.ikinciOyuncuSkoru += 1
                lvlSetSonucu.text = "\(suankiSet). Seti 2. oyuncu Kazandı"
                suankiSet += 1
                lblOyuncu2Skor.text = String(oyuncuSkorlari.ikinciOyuncuSkoru)
            }
            else {
                print("Oyuncular Berabere Kaldı")
                lvlSetSonucu.text = "\(suankiSet). Set Berabere Sona Erdi"
            }
            
            oyuncuPuanlari.birinciOyuncuPuani = 0
            oyuncuPuanlari.ikinciOyuncuPuani = 0
            
        }
    }
    
    
    func zarDegerleriniUret() {
        let zar1 = arc4random_uniform(6) + 1
        let zar2 = arc4random_uniform(6) + 1
        
        imgZar1.image = UIImage(named: String(zar1))
        imgZar2
            .image = UIImage(named: String(zar2))
        
        setSonuc(zar1: Int(zar1), zar2: Int(zar2))
        
        if suankiSet > maxSet {
            
            if oyuncuSkorlari.birinciOyuncuSkoru > oyuncuSkorlari.ikinciOyuncuSkoru {
                
                lvlSetSonucu.text = (" Oyunun Galibi 1. Oyuncu")
            }
            else {
                lvlSetSonucu.text = (" Oyunun Galibi 2. Oyuncu")
            }
        }
    }
}
