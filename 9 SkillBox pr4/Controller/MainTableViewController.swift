//
//  MainTableViewController.swift
//  9 SkillBox pr4
//
//  Created by Kirill Drozdov on 24.03.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainTableViewController: UITableViewController {
    
    var dayWeather = ["ВС","ПН","ВТ","СР","ЧТ","ПТ","СП","ВС"]
    var weatherDEW = [DEW]()

    override func viewDidLoad() {
        super.viewDidLoad()
updateTAbleViewData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherDEW.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.description_weather.text = String(weatherDEW[indexPath.row].dew_point!) +  " " + "градусов"
        cell.day_weather.text = dayWeather[indexPath.row]
        return cell
        
    }
    
    func updateTAbleViewData(){
        AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=55.75&lon=37.61&exclude=minutely,hourly,alerts,current&appid=a7fdf67dfd9f1e905eb6ef1ab0899c46")
            .validate()
            .responseDecodable(of: WeathersApi.self) { (response) in
                guard let weth = response.value else { print("что-то не так")
                    return}
                self.weatherDEW = weth.daily
                self.tableView.reloadData()
                print("скачано успешно")
            }
    }
    
}
