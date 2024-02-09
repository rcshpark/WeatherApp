////
////  ViewController.swift
////  WeatherApp
////
////  Created by 박상훈 on 2023/11/09.
////
//import UIKit
//
//class WeatherViewController: UIViewController {
//    @IBOutlet weak var cityTextField: UITextField!
//    @IBAction func loadWeatherBtn(_ sender: Any) {
//        if let cityName = self.cityTextField.text {
//            self.getCurrentWeather(cityName: cityName)
//            self.view.endEditing(true)
//        }
//    }
//    @IBAction func ootdActionBtn(_ sender: UIButton) {
//    }
//    
//    @IBOutlet weak var showOOTDBtn: UIButton!
//    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var weatherLabel: UILabel!
//    @IBOutlet weak var temLabel: UILabel!
//    @IBOutlet weak var minLabel: UILabel!
//    @IBOutlet weak var maxLabel: UILabel!
//    
//    @IBOutlet weak var weatherStackView: UIStackView!
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationItem.hidesBackButton = true
//    }
//    func showErrorAlert(message: String){
//        let alert =  UIAlertController(title: "error", message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "confirm", style: .default, handler: nil))
//        self.present(alert,animated: true,completion: nil)
//    }
//    func configureView(weatherInformation: WeatherInformation){
//        self.cityLabel.text = weatherInformation.name
//        if let weather = weatherInformation.weather.first{
//            self.weatherLabel.text = weather.description
//        }
//        self.temLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))°C"
//        self.maxLabel.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))°C"
//        self.minLabel.text = "최저: \(Int(weatherInformation.temp.minTemp - 273.15))°C"
//    }
//    func getCurrentWeather(cityName: String){
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=1b0c39a6a1e60feafa1a3674910a65af") else { return }
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: url){ [weak self] data, response, error in
//            let successRange = (200..<300)
//            guard let data = data, error == nil else { return }
//            let decoder = JSONDecoder()
//            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
//                guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else{ return }
//                DispatchQueue.main.async {
//                    self?.weatherStackView.isHidden = false
//                    self?.configureView(weatherInformation: weatherInformation)
//                    self?.showOOTDBtn.layer.isHidden = false
//                }
//            } else {
//                guard let errorMessage =  try? decoder.decode(ErrorMessage.self, from: data) else { return }
//                DispatchQueue.main.async {
//                    self?.showErrorAlert(message: errorMessage.message)
//                }
//            }
//            
//        }.resume()
//    }
//}
//
