//
//  ViewController.swift
//  testAnimasi
//
//  Created by Audrey Saudjhana on 14/11/20.
//

import UIKit

class ViewController: UIViewController {

    // Background
    let background = UIImageView()
    let wok = UIImageView()
    
    //Trick 2 - Menjaga ukuran image view
    let box = UIView()
    
    // Wok Position & Size
    var wokX = 200
    var wokY = 300
    var wokWidth = 250
    var wokHeigth = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenWidth = view.layer.frame.width
        let screenHeight = view.layer.frame.height
        // Tips untuk tahu panjang & lebar screen
        // print ("width \(screenWidth)")
        // print ("heigth \(screenHeight)")
        
        
        //Timer
        let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(openWok), userInfo: nil, repeats: false)
        
        
        
        background.image = UIImage(named: "BgScreenDark")
        background.contentMode = UIView.ContentMode.scaleAspectFill
        background.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        background.center = self.view.center
        view.addSubview(background)
        
        wok.image = UIImage(named: "Wok")
        wok.contentMode = UIView.ContentMode.scaleAspectFill
        //wok.frame = CGRect(x: Int((screenWidth - CGFloat(wokWidth) / 2)), y: Int((screenHeight - CGFloat(wokHeigth) / 2)), width: wokWidth, height: wokHeigth)
        //view.addSubview(wok)
        
        // Trick #1
        wok.contentMode = UIView.ContentMode.scaleAspectFit
        
        // Trick #2
        wok.frame = CGRect(x: 0, y: 0, width: wokWidth, height: wokHeigth)
        //box.frame = CGRect(x: Int(screenWidth) - wokX) / 2)), y: Int(screenHeight) - wokY) / 2)), width: wokWidth, height: wokHeigth)
        box.frame = CGRect(x: (Int(screenWidth) - wokX)/2, y: (Int(screenHeight) - wokY)/2, width: wokWidth, height: wokHeigth)
        box.addSubview(wok)
        view.addSubview(box)
        
        // Enabled Box UIView to be tapable and triggers action zoom in
        //box.isUserInteractionEnabled = true
        //let tapgesture = UITapGestureRecognizer(target: self, action: #selector(getter: zoomIn))
        //box.addGestureRecognizer(tapgesture)
        
        
        shake()
        
        
        
        
    }
    
    // Di options: [] buat ngatur animasi
    // repeat: ke posisi transform selanjutnya langsung
    // autoreverse: balik ke posisi normal
    func shake() {
        UIView.animate(withDuration: 0.1, delay: 0.001, options: [.repeat, .autoreverse], animations: {
            // ubah bentuk bisa dari transform juga
            self.box.transform = CGAffineTransform(rotationAngle: .pi/10)
            self.box.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/10)
        }, completion: {_ in
            print("stopped")
            // cek disini
        })
        
        
        //func zoomIn() {
        //    box.layer.removeAllAnimations()
        //}
        
       // @objc func zoomIn() {
       //     box.layer.removeAllAnimations()
       // }
        }
        @objc func openWok() {
            box.layer.removeAllAnimations()
            UIView.animate(withDuration: 2){
                self.box.transform = CGAffineTransform(scaleX: 10, y: 10)
                UIView.animate(withDuration: 0.5, animations: {
                    self.box.frame.origin.y -= 750
                    self.box.frame.origin.x -= 150
                }, completion: {_ in
                    AudioPlayer.shared.playSound(filename: "Pintubuka", audiotype: "wav")
                    print("geser-ed")
                })
            } completion: { (true) in
                print("sudah diperbesar")
                UIView.animate(withDuration: 1, animations: {
                    
                    //self.background.image = UIImage(named: "wok") // "pintu1"
                    //view.addSubview(self.background)
                })
            }
        }
    }
    



