import UIKit

class LoginViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    override func viewDidLoad() {
        emailField.delegate = self
        pwField.delegate = self
        emailField.textContentType = .emailAddress
    }
    // 배경 클릭시 키보드 내림  ==> view 에 터치가 들어오면 에디팅모드를 끝냄.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)  //firstresponder가 전부 사라짐
        }
    // 엔터를 입력하면 다음 텍스트필드 or 키보드 내리는 기능 구현
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // 두 텍스트 필드가 모두 입력이 되었다면 resignFirstResponder()
            if emailField.text != "", pwField.text != ""{
                self.checkAccount(self)
                return true
            } else if emailField.text != ""{
                pwField.becomeFirstResponder()
                return true
            }
            return false
        }

        
    @IBAction func checkAccount(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") else { return debugPrint("login error") }
        self.navigationController?.pushViewController(loginVC, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
