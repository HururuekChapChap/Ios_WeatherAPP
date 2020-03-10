//
//  ViewController.swift
//  WeatherApp
//
//  Created by yoon tae soo on 2020/03/08.
//  Copyright © 2020 yoon tae soo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var ListTableView: UITableView!
    
    var FutureList = [FutureTempModel]()
    var location:CLLocationManager!
    var latitude = ""
    var longitude = ""
    
    let key = "l7xx69afd351d6674dc6af848a9b3ddc0001"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getLocation()
        getFutureinfo()
        getCurrentInfo()
        self.ListTableView.delegate = self
        self.ListTableView.dataSource = self
    }


}

extension ViewController{
    //위도와 경도를 latitude 변수와 longitude 변수에 저장해준다.
    func getLocation(){
        location = CLLocationManager()
        location.delegate = self
        //위치추적 권한 요청
        location.requestWhenInUseAuthorization()
        //배터리에 맞는 최적의 정확도
        location.desiredAccuracy = kCLLocationAccuracyBest
        //위치 업데이트
        location.startUpdatingLocation()
        //현재 위치를 변수에 저장해준다.
        if let coor = location.location?.coordinate{
            latitude = String(coor.latitude)
            longitude = String(coor.longitude)
            
            print(latitude)
            print(longitude)
            
            
        }
        
    }
}

extension ViewController {
    
    func getCurrentInfo(){
        
        //SK open api로 부터 키 값과 위도 경도 값을 입력해주고
        let url = URL(string: "https://apis.openapi.sk.com/weather/current/hourly?appKey=\(key)&version=2&lat=\(latitude)&lon=\(longitude)")!
        //json 방식으로 받아준다.
       let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let JsonData = data{
                
                do{
                    //형태가 맞는지 확인을 해주고
                    guard let temp_json = try JSONSerialization.jsonObject(with: JsonData, options: []) as? Dictionary<String,Any> else{
                        return
                    }
                    
                    let WeatherList : Dictionary<String,Any> = temp_json["weather"] as! Dictionary<String,Any>
                    let ArrayList : Array<Any> = WeatherList["hourly"] as! Array<Any>
                    //배열형태로 받아주면 그 배열 형태의 위치에서 Dictionary 형태로 확인 시키고 temp Dictionary에 넣어준다.
                    let temp : Dictionary<String,Any> = ArrayList[0] as! Dictionary<String,Any>
                     //그리고 편하게 Dictionary 형태로 가져온다.
                    var sky = temp["sky"] as! Dictionary<String,String>
                    let temperature = temp["temperature"] as! Dictionary<String,String>
                    let grid = temp["grid"] as! Dictionary<String,String>
                    
                    print(grid["county"]!)
                    print(grid["village"]!)
                    
                    if(sky["code"]! == "SKY_O06"){
                        sky["code"] = "SKY_O08"
                    }
                    else if(sky["code"]! == "SKY_O07"){
                        sky["code"] = "SKY_O03"
                    }
                    else if(sky["code"]! == "SKY_O10"){
                        sky["code"] = "SKY_O08"
                    }
                    else if(sky["code"]! == "SKY_O12" || sky["code"]! == "SKY_O13"){
                        sky["code"] = "SKY_O11"
                    }
                    
                    print(sky["code"]!)
                    
                    CurrentTempModel.shared.TemperString = temperature["tc"]!
                    CurrentTempModel.shared.ImageString = sky["code"]
                    CurrentTempModel.shared.staticString = sky["name"]!
                    CurrentTempModel.shared.minmaxString = "최고 \(temperature["tmax"]!) 최저 \(temperature["tmin"]!)"
                    
                    //화면에 뿌려준다. 화면에서 보여지는 것은 single thread이기 때문에
                    //DispatchQueue를 통해서 보여준다.
                    DispatchQueue.main.async {
                        self.LocationLabel.text = grid["county"]!
                        self.ListTableView.reloadData()
                    }
                }
                catch{}
                
            }
        }
        
        task.resume()
        
    }
    
    func getFutureinfo(){
        
        let url = URL(string: "https://apis.openapi.sk.com/weather/summary?appKey=\(key)&version=2&lat=\(latitude)&lon=\(longitude)")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let JsonData = data{
                do{
                    
                    guard let temp_json = try JSONSerialization.jsonObject(with: JsonData, options: []) as? Dictionary<String,Any> else{
                        return
                    }
                    
                    let weatherDic = temp_json["weather"] as! Dictionary<String,Any>
                    let summary = weatherDic["summary"] as! Array<Any>
                    let List = summary[0] as! Dictionary<String,Any>
                    
                    let tomorrow = List["tomorrow"] as! Dictionary<String,Any>
                    let tomo_temperature = tomorrow["temperature"] as! Dictionary<String,String>
                    let tomo_sky = tomorrow["sky"] as! Dictionary<String,String>
                    //내일 자료와 모래 자료를 배열 형태로 넣어준다.
                    self.FutureList.append(FutureTempModel(Date: "내일",MinString:tomo_temperature["tmin"]!,ImageString: tomo_sky["code"]!, MaxString:tomo_temperature["tmax"]!, StaticString: tomo_sky["name"]!))
                    
                    let dayAfterTomorrow = List["dayAfterTomorrow"] as! Dictionary<String,Any>
                    let dayAfter_temperature = dayAfterTomorrow["temperature"] as! Dictionary<String,String>
                    let dayAfter_sky = dayAfterTomorrow["sky"] as! Dictionary<String,String>
                    
                    self.FutureList.append(FutureTempModel(Date: "모래",MinString:dayAfter_temperature["tmin"]!,ImageString: dayAfter_sky["code"]!, MaxString:dayAfter_temperature["tmax"]!, StaticString: dayAfter_sky["name"]!))
                    
                }
                catch{}
            }
            
        }
        
        task.resume()
    }
    
}

extension ViewController : UITableViewDataSource{
    
    //테이블 뷰에 두개의 섹션을 반환한다.
    //첫번째 섹션에는 현재의 날씨를 보여주고
    //두번째는 예보의 목록을 보여주도록 한다.
    func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
    //각 섹션마다 반환하는 row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        switch section {
            //첫번째 섹션에서는 빈공간과 현재 날씨만 보여주면 되니 두개만 반환한다
        case 0:
            return 2
            
            //두번째 섹션에서는 미래의 예보를 보여줘야하니 배열을 반환해줘야한다.
        case 1:
            return FutureList.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //첫번째 섹션에서는 maincell을 리턴해줘야한다. 굉장히 놀라왔던 것은 각 셀 마다 indextPath의 길이를 반환해준다는 것이다. 여기에서는 두개
        if(indexPath.section == 0){
            
            //빈공간의 Cell
            if(indexPath.row == 0){
            
            let cell = ListTableView.dequeueReusableCell(withIdentifier: "BlankCell", for: indexPath)
            
            
            return cell
            }
            //메인 정보가 담긴 Cell
            else if(indexPath.row == 1){
                
                let cell = ListTableView.dequeueReusableCell(withIdentifier: "MainCellCtrollerTableViewCell", for: indexPath) as! MainCellCtrollerTableViewCell
                
                cell.TemperatualLabel.text = CurrentTempModel.shared.TemperString
                cell.staticLabel.text = CurrentTempModel.shared.staticString
                cell.minmaxLabel.text = CurrentTempModel.shared.minmaxString
                if let  ImageString =  CurrentTempModel.shared.ImageString{
                    cell.WeatherImageView.image = UIImage(named: ImageString)
                }
                return cell
                
            }
        }
        //section이 0이 아닐 경우에는 indextPath가 FutureList.count 만큼
        
        let cell = ListTableView.dequeueReusableCell(withIdentifier: "SubCellController", for: indexPath) as! SubCellController
        
        cell.DateLabel.text = FutureList[indexPath.row].Date
        cell.MinLabel.text = "최저 \(FutureList[indexPath.row].MinString!)"
        cell.statusLabel.text = FutureList[indexPath.row].StaticString
        cell.temperator.text = FutureList[indexPath.row].MaxString
        cell.WeatherImageView.image = UIImage(named: FutureList[indexPath.row].ImageString!)
        
        return cell
    }
    
    
    
    
}

