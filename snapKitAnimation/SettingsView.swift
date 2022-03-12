//
//  settingsView.swift
//  snapKitAnimation
//
//  Created by Kirill Drozdov on 12.03.2022.
//

import Foundation
import UIKit



class SettingsView: UIView {
  var isOn: Bool = false // Button Flag

  

  lazy var viewAnimated: UIView = {
    var animatedView = UIView()
    animatedView.backgroundColor = .red
    return animatedView
  }()

  lazy var buttonChange: UIButton = {
    var button = UIButton()
    button.backgroundColor = .purple
    button.setTitle("Нажми", for: .normal)
    button.addTarget(self, action: #selector(onButton), for: .touchUpInside)
    return button
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    constraintAnimatedView()
    constraintButton()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  func constraintAnimatedView(){
   self.addSubview(viewAnimated)
   viewAnimated.snp.makeConstraints({ make in
     make.center.equalToSuperview()
     make.width.height.equalTo(200)
   })
 }

  func constraintButton(){
   self.addSubview(buttonChange)
   buttonChange.snp.makeConstraints { make in
     make.top.equalTo(50)
     make.centerX.equalToSuperview()
   }
 }


  @objc func onButton()
  {

    if isOn == false { // если фолс
      self.isOn.toggle() // change true
      // reset constraint
      viewAnimated.snp.remakeConstraints({ (make) in
        make.bottom.equalToSuperview().offset(-10)
        make.centerX.equalToSuperview()
        make.width.equalTo(50)
        make.height.equalTo(50)
      })
      UIView.animate(withDuration: 1.0) { [self] in
        viewAnimated.backgroundColor = .systemGray
        self.layoutIfNeeded()
      }


    } else {

      self.isOn.toggle()
      viewAnimated.snp.remakeConstraints({ (make) in
        make.center.equalToSuperview()
        make.width.equalTo(200)
        make.height.equalTo(200)
      })

      UIView.animate(withDuration: 1.0) { [self] in
        viewAnimated.backgroundColor = .red
        self.layoutIfNeeded()
      }
    }
  }

}
