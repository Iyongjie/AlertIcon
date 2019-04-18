//
//  ViewController.swift
//  AlertIcon
//
//  Created by 李永杰 on 2019/4/18.
//  Copyright © 2019 iyongjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func alterCat(_ sender: UIButton) {
        alterAppIcon("cat")
    }
    @IBAction func alterPanda(_ sender: UIButton) {
        alterAppIcon("panda")
    }
    
    func alterAppIcon(_ iconName: String) {
        if #available(iOS 10.3, *) {
            UIApplication.shared.setAlternateIconName(iconName) { (error) in
                if error != nil {
                    self.alertMessage(message: error!.localizedDescription)
                } else {
                    self.alertMessage(message: "更换icon成功")
                }
            }
        }else {
            self.alertMessage(message: "系统版本低于10.3，不能换icon")
        }
    }
    
    func alertMessage(message: String) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

