//
//  LoginScreen.swift
//  WeatherApp
//
//  Created by 박상훈 on 2023/11/20.
//

import UIKit

class LoginViewController : UIViewController {
    @IBAction func checkAccount(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") else { return debugPrint("login error") }
        self.navigationController?.pushViewController(loginVC, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
