//
//  ViewController.swift
//  snapKitAnimation
//
//  Created by Kirill Drozdov on 12.03.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

//  var viewAnimated: UIView? // Animated View
  var isOn: Bool = false // Button Flag

//  lazy var viewAnimated: UIView = {
//    var animatedView = UIView()
//    animatedView.backgroundColor = .red
//    return animatedView
//  }()
//
//  lazy var buttonChange: UIButton = {
//    var button = UIButton()
//    button.backgroundColor = .purple
//    button.setTitle("Нажми", for: .normal)
//    button.addTarget(self, action: #selector(onButton), for: .touchUpInside)
//    return button
//  }()


  override func loadView() {
         self.view = SettingsView()
     }

  override func viewDidLoad() {
    super.viewDidLoad()



  }

//  private func constraintAnimatedView(){
//    view.addSubview(viewAnimated)
//    viewAnimated.snp.makeConstraints({ make in
//      make.center.equalToSuperview()
//      make.width.height.equalTo(200)
//    })
//  }
//
//  private func constraintButton(){
//    view.addSubview(buttonChange)
//    buttonChange.snp.makeConstraints { make in
//      make.top.equalTo(50)
//      make.centerX.equalToSuperview()
//    }
//  }

  
}

