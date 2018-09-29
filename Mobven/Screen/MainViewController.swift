//
//  MainViewController.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit
import JGProgressHUD

class MainViewController: UITableViewController {

    var elementArray: [Weather] = []
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.elementArray.forEach{ weather in
            refreshWeather(cityName: weather.city.name, replace: true)
        }
    }
    
    func refreshWeather(cityName: String, replace: Bool){
        WebHelper().getWeatherForecast(cityName: cityName, success: {response in
            DispatchQueue.main.async {
                self.hud.dismiss(afterDelay: 0)
                let result: Weather = (response as? Weather)!
                if result.cod == "200"{
                    //Success
                    if replace{
                        if let i = self.elementArray.index(where: { $0.city.name == cityName }) {
                            self.elementArray[i] = result
                        }
                    }else{
                        self.elementArray.insert(result, at: 0)
                    }
                    self.tableView.reloadData()
                }else{
                    //Not Found
                    self.showAlertView()
                }
            }
        }, errorString: { error in
            DispatchQueue.main.async {
                self.hud.dismiss(afterDelay: 0)
                //Not Found
                self.showAlertView()
            }
        })
    }
}

//MARK: Table Delegate
extension MainViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content: Weather = self.elementArray[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PreviewTableViewController") as! PreviewTableViewController
        vc.contentWeather = content
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let content: Weather = self.elementArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityTableViewCell
        cell.cityLabel.text = content.city.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}

//MARK: Search Bar Delegate
extension MainViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        hud.show(in: self.view)
        self.refreshWeather(cityName: searchBar.text!, replace: false)
    }
    
    func showAlertView(){
        let alert = UIAlertController(title: "Hata", message: "Şehir bulunamadı. Lütfen tekrar deneyiniz.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
