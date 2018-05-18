//
//  ViewController.swift
//  practice
//
//  Created by 松原 有城 on 2018/05/16.
//  Copyright © 2018年 松原 有城. All rights reserved.
//
///funkの中にfunkは入れられない。
///funk外でも使いたい時はclassの下に書く。
///クロージャの時は self.〜 にする。
///配列で書いている時に書きたくない時は〜: [] と書く。
import UIKit

class ViewController: UIViewController {
    
    let underView = UIView.init(frame: .zero)
    let btnA = UIButton(frame: .zero)
    let btnB = UIButton(frame: .zero)
    var isTappedA = true
    
    ///Aになったら強制的にする処理（監視・オブザーバー）underViewが謎の挙動をするため、今回はコメント。
    //    var isTappedA: Bool = true {
    //        didSet {
    //            //
    //            if isTappedA {
    //                btnA.setTitleColor(UIColor.black, for: .normal)
    //                btnB.setTitleColor(UIColor.lightGray, for: .normal)
    //            } else {
    //                btnA.setTitleColor(UIColor.lightGray, for: .normal)
    //                btnB.setTitleColor(UIColor.black, for: .normal)
    //            }
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("[\(#function)][\(#line)]")
        ///btnA
        //tag付け
        btnA.tag = 0
        //ボタンイベント
        btnA.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControlEvents.touchUpInside)
        // ラベルを設定
        btnA.setTitle("基本", for: UIControlState.normal)
        //文字色設定
        btnA.setTitleColor(UIColor.black, for: .normal)   //押下時にしたい時（本当に押した時だけ）は.nomalをhighlightedにする。
        // 背景色を変える
        btnA.backgroundColor = UIColor(red: 3, green: 0.7, blue: 0.6, alpha: 1)
        // 枠の太さを変える
        btnA.layer.borderWidth = 1.0
        // 枠の色を変える
        btnA.layer.borderColor = UIColor(red: 3, green: 0.6, blue: 0.5, alpha: 1).cgColor
        // 枠に丸みをつける
        btnA.layer.cornerRadius = 10
        
        ///設定時に必ずtranslatesAutoresizingMaskIntoConstraints（優先度をこちらにする）をfalseで書かないと出てこない
        btnA.translatesAutoresizingMaskIntoConstraints = false
        // viewに追加する
        self.view.addSubview(btnA)
        // 左端は、viewの左端の位置
        ///equalTo:に対象を書く leadingは左,trailingは右,topは上,bottomは下  必ずAncherをつける .isActive = trueを書かないと書いた制約が無視される
        btnA.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //縦方向の中心は、100ptと指定
        btnA.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        // 高さは30pt
        btnA.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        // 幅はviewの幅の半分
        btnA.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        
        ///btnB
        //tag付け
        btnB.tag = 1
        //ボタンイベント
        btnB.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControlEvents.touchUpInside)
        // ラベルを設定
        btnB.setTitle("損傷", for: UIControlState.normal)
        //文字色設定
        btnB.setTitleColor(UIColor.black, for: .normal)
        // 背景色を変える
        btnB.backgroundColor = UIColor(red: 3, green: 0.7, blue: 0.6, alpha: 1)
        // 枠の太さを変える
        btnB.layer.borderWidth = 1.0
        // 枠の色を変える
        btnB.layer.borderColor = UIColor(red: 3, green: 0.6, blue: 0.5, alpha: 1).cgColor
        // 枠に丸みをつける
        btnB.layer.cornerRadius = 10
        ///設定時に必ずtranslatesAutoresizingMaskIntoConstraints（優先度をこちらにする）をfalseで書かないと出てこない
        btnB.translatesAutoresizingMaskIntoConstraints = false
        // viewに追加する
        self.view.addSubview(btnB)
        // 左端は、viewの右端の位置
        ///equalTo:に対象を書く leadingは左,trailingは右,topは上,bottomは下  必ずAncherをつける .isActive = trueを書かないと書いた制約が無視される
        btnB.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //縦方向の中心は、100ptと指定
        btnB.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        // 高さは30pt
        btnB.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        // 幅はviewの幅の半分
        btnB.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        
        ///ボタン下View
        let bgColor = UIColor.red
        underView.backgroundColor = bgColor
        self.view.addSubview(underView)
        ///設定時に必ずtranslatesAutoresizingMaskIntoConstraints（優先度をこちらにする）をfalseで書かないと出てこない
        underView.translatesAutoresizingMaskIntoConstraints = false
        // 左端は、btnの左端の位置
        ///equalTo:に対象を書く leadingは左,tralingは右,topは上,bottomは下  必ずAncherをつける .isActive = trueを書かないと書いた制約が無視される
        underView.leadingAnchor.constraint(equalTo: btnA.leadingAnchor).isActive = true
        // 縦方向の中心は、btnの縦方向の中心と同じ
        underView.topAnchor.constraint(equalTo: btnA.bottomAnchor).isActive = true
        // 高さは5pt
        underView.heightAnchor.constraint(equalToConstant: 5.0).isActive = true
        // 幅はviewの幅の半分
        underView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("[\(#function)][\(#line)]")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("[\(#function)][\(#line)]")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  ボタンが押された時に呼ばれるメソッド
    ///withDurationが何秒でその処理をするか。　delayが何秒遅れでその処理を始めるか。　optionは色々できる（.autoreverseで戻ってきたり）。　animationsはクロージャで、その中でアニメーションしたいUIViewクラスのプロパティの値を変更している。　いらない時は　〜:[] と書く。
    @objc func buttonEvent(_ sender: UIButton) {
        print("[\(#function)][\(#line)]")
        
        if sender.tag == 0 { //Aが押された
            if !isTappedA {
                sender.isEnabled = false //ボタン連打時の誤作動を防ぐため押された瞬間ボタン無効化
                UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: {
                    self.underView.center.x -= self.view.frame.width * 0.5 //underVierをBからAへ動かす
                }) { (isFinishedAnimation) in
                    print("[\(#function)][\(#line)]")
                    self.isTappedA = true
                    sender.isEnabled = true //ボタン連打時の誤作動を防ぐため処理が終わったらボタン有効化
                }
            }
        } else { //Bが押された
            if isTappedA {
                sender.isEnabled = false //ボタン連打時の誤作動を防ぐため押された瞬間ボタン無効化
                UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: {
                    self.underView.center.x += self.view.frame.width * 0.5 //underVierをAからBへ動かす
                }) { (isFinishedAnimation) in
                    print("[\(#function)][\(#line)]")
                    self.isTappedA = false
                    sender.isEnabled = true //ボタン連打時の誤作動を防ぐため処理が終わったらボタン有効化
                }
            }
        }
        
        print("[\(#function)][\(#line)]")
        
        ///この２行と同じことをしている。 underViewが謎の挙動をするため、今回はコメント。
        //        let blackA = (sender.tag == 0 ? UIColor.black : UIColor.lightGray)
        //        btnA.setTitleColor(blackA, for: .normal)
        //        sender.setTitleColor((sender.tag == 0 ? UIColor.black : UIColor.lightGray), for: .normal)
        
        //        sender.setTitleColor((sender.tag == 1 ? UIColor.black : UIColor.lightGray), for: .normal)
        
        print("[\(#function)][\(#line)]")
        
        
        
        
        ///ログのこの書き方分かりやすい
        print("btnA.isSelected = \(btnA.isSelected)")
        print("btnB.isSelected = \(btnB.isSelected)")
    }
}




