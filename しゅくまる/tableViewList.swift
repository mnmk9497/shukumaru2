//
//  FirstViewController.swift
//  しゅくまる
//
//  Created by miyu.s on 2017/09/02.
//  Copyright © 2017年 miyu.s. All rights reserved.
//

import UIKit
import  SkyWay

class tableViewList: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var imgArray = Array<String>()
    var label2Array = Array<String>()
    var buttonArray = Array<Int>()
    var img2Array = Array<Int>()
    
    @IBOutlet weak var shukudaisuu2: UILabel!
    
    @IBOutlet weak var shukudaisuu: UILabel!
    
    @IBOutlet weak var finish: UILabel!
    
    @IBOutlet weak var finish2: UILabel!
    
    @IBOutlet weak var todayLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgArray = [String](repeating: "", count: label2Array.count)

        
        for n in 0..<label2Array.count {
            
            switch label2Array[n]{
                
            case "かんじドリル":
                imgArray[n] = "かんじドリルai"
                break
            case "けいさんドリル":
                imgArray[n] = "けいさんドリルai"
                break
            case "さくぶん":
                imgArray[n] = "さくぶんai"
                break
            case "おんどく":
                imgArray[n] = "おんどくai"
                break
            case "こくご":
                imgArray[n] = "こくごai"
                break
            case "さんすう":
                imgArray[n] = "さんすうai"
                break
            case "しゃかい":
                imgArray[n] = "しゃかいai"
                break
            case "りか":
                imgArray[n] = "りかai"
                break
            case "がいこくご":
            imgArray[n] = "そのたai"
                break
            default:
                break
            }
        }
        
        buttonArray = [Int](repeating: 0, count: label2Array.count)
        img2Array = [Int](repeating: 0, count: label2Array.count)
        
        var shukudaiCount:Int = 0//宿題数を計算する値
        var finishCount:Int = 0 //終わった数を計算する値
        
        shukudaiCount = label2Array.count
        
        for num in 0 ..< label2Array.count {
            finishCount += buttonArray[num]
        }
        shukudaisuu.text = String(shukudaiCount)
        shukudaisuu2.text = String(shukudaiCount)
        
        finish.text = String(finishCount)
        
        let selectDate = Date()
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy" + "年" + "MM" + "月" + "d" + "日"
        let TodayDate = formatter.string(from: selectDate as Date)
        todayLabel.text = TodayDate
        
        tableView.dataSource = self    //追加
        tableView.delegate = self // 追加
    }
    
    
    //TableViewセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label2Array.count
    }
    
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //tableCellのIDでUITableViewCellのインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.setCell(icon: imgArray[indexPath.row], title: label2Array[indexPath.row], tapBtnStates: buttonArray[indexPath.row], hanamaruStates: img2Array[indexPath.row])
        
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
        
    }
    //画面を自動回転させない
    override var shouldAutorotate: Bool {
        get {
            return false
        }
    }
    
    //画面の向きを指定
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
        return .landscape
        }
    }
    
    

}
