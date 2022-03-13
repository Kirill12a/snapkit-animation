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

  
  lazy var nameLabel: UILabel = {
    var label = UILabel()
    label.text = "Say Hello"
    label.numberOfLines = 0
    label.backgroundColor = .yellow
    return label
  }()


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
    constarintLabel()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  func constarintLabel(){
    self.addSubview(nameLabel)
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(buttonChange.snp_bottomMargin).offset(50)
      make.centerX.equalToSuperview()
    }
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
      /// ------------
      nameLabel.snp.remakeConstraints { make in
        make.width.height.equalTo(70)
        make.centerX.bottom.equalToSuperview().inset(5)
      }
      /// -------------
      viewAnimated.snp.remakeConstraints({ (make) in
        make.bottom.equalToSuperview().inset(10)
        make.centerX.equalToSuperview()
        make.width.equalTo(50)
        make.height.equalTo(50)
      })
      UIView.animate(withDuration: 1.0) { [self] in
        viewAnimated.backgroundColor = .systemGray
        viewAnimated.layer.cornerRadius = 20
        self.layoutIfNeeded()
      }

      //--------------
    } else {
      //--------------

      self.isOn.toggle()

      /// ------------
      nameLabel.snp.remakeConstraints { make in
        make.top.equalTo(buttonChange.snp_bottomMargin).offset(50)
        make.centerX.equalToSuperview()
      }

      /// ------------
      viewAnimated.snp.remakeConstraints({ (make) in
        make.center.equalToSuperview()
        make.width.equalTo(200)
        make.height.equalTo(200)
      })

      UIView.animate(withDuration: 1.0) { [self] in
        viewAnimated.backgroundColor = .red
        viewAnimated.layer.cornerRadius = 0
        self.layoutIfNeeded()
      }
    }
  }

}
