//
//  ViewController.swift
//  WeatherApp
//
//  Created by 박상훈 on 2023/11/09.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func loadWeatherBtn(_ sender: Any) {
        if let cityName = self.cityTextField.text {
            
        }
    }
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

