//
//  ViewController.swift
//  snapKitAnimation
//
//  Created by Kirill Drozdov on 12.03.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  var animatedView: UIView? // Animated View
  var button: UIButton? // Button
  var isOn: Bool = false // Button Flag

  override func viewDidLoad() {
    super.viewDidLoad()

    animatedView = UIView()
    animatedView?.backgroundColor = UIColor.red
    self.view.addSubview(animatedView!)
    animatedView?.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.width.equalTo(200)
      make.height.equalTo(200)
    }

    button = UIButton()
    button?.backgroundColor = UIColor.blue
    button?.setTitle("button", for: .normal)
    button?.addTarget(self, action: #selector(onButton), for: .touchUpInside)
    self.view.addSubview(button!)
    button?.snp.makeConstraints({ (make) in
      make.top.equalTo(50)
      make.centerX.equalToSuperview()
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @objc func onButton() {

    if isOn == false { // если фолс
      self.isOn.toggle() // change true
      // reset constraint
      animatedView?.snp.remakeConstraints({ (make) in
        make.bottom.equalToSuperview().offset(-10)
        make.centerX.equalToSuperview()
        make.width.equalTo(50)
        make.height.equalTo(50)
      })
      createAnimation()


    } else {

      self.isOn.toggle()
      animatedView?.snp.remakeConstraints({ (make) in
        make.center.equalToSuperview()
        make.width.equalTo(200)
        make.height.equalTo(200)
      })

      createAnimation()
    }

    // что бы не писать много раз
    func createAnimation(){
      UIView.animate(withDuration: 1.0) {
        self.view.layoutIfNeeded()
      }
    }
  }


}

