//
//  MainViewController.swift
//  Mobven
//
//  Created by macbookair on 28.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    // Private
    private var elementArray: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.elementArray.forEach{ weather in
            getWeather(cityName: weather.city.name, replace: true)
        }
    }
}

// MARK: UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.kCityTableViewCell, for: indexPath) as! CityTableViewCell
        
        if self.elementArray.count > indexPath.row {
            let content: Weather = self.elementArray[indexPath.row]
            cell.cityLabel.text = content.city.name
        }
        return cell
    }
}

// MARK: UITableViewDelegate
extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.elementArray.count > indexPath.row {
            let content: Weather = self.elementArray[indexPath.row]
            
            let storyboard = UIStoryboard(name: Storyboard.kMain, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: Controller.kPreviewTableViewController) as! PreviewTableViewController
            vc.contentWeather = content
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        showLoadingView()
        self.getWeather(cityName: searchBar.text!, replace: false)
    }
}

// MARK: Service
extension MainViewController {
    func getWeather(cityName: String, replace: Bool){
        ServiceManager().getWeatherForecast(cityName: cityName, success: {response in
            DispatchQueue.main.async {
                self.hiddenLoadingView()
                
                let result: Weather = (response as? Weather)!
                
                if replace{
                    if let i = self.elementArray.index(where: { $0.city.name == cityName }) {
                        self.elementArray[i] = result
                    }
                }else{
                    self.elementArray.insert(result, at: 0)
                }
                self.tableView.reloadData()
            }
        }, errorString: { error in
            DispatchQueue.main.async {
                self.hiddenLoadingView()
                //Not Found
                self.showAlertView("Hata", "Şehir bulunamadı. Lütfen tekrar deneyiniz.")
            }
        })
    }
}
