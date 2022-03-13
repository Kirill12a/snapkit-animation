//
//  ViewController.swift
//  snapKitAnimation
//
//  Created by Kirill Drozdov on 12.03.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  var isOn: Bool = false // Button Flag

  override func loadView() {
         self.view = SettingsView()
     }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .purple
  }
}

