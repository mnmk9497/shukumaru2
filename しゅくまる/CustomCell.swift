//
//  CustomCell.swift
//  しゅくまる
//
//  Created by miyu.s on 2017/11/09.
//  Copyright © 2017年 miyu.s. All rights reserved.
//

import UIKit


class CustomCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tapBtn: ButtomCustom!
    @IBOutlet weak var hanamaruView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(icon: String, title: String, tapBtnStates: Int, hanamaruStates: Int) {
        
        iconView.image = UIImage(named: icon)
        
        titleLabel.text = String(describing: title)
        
        if(tapBtnStates == 0) {
            tapBtn.setTitle("これから!", for: .normal)
            tapBtn.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            tapBtn.backgroundColor = UIColor(red: 48/255, green: 148/255, blue: 137/255, alpha: 1.0)
        }else if(tapBtnStates == 1) {
            tapBtn.setTitle("おわった!", for: .normal)
            tapBtn.setTitleColor(UIColor(red: 48/255, green: 148/255, blue: 137/255, alpha: 1.0), for: .normal)
            tapBtn.backgroundColor = UIColor.clear
        }
        
        //Tag番号4でUIImageViewインスタンスの生成
        if hanamaruStates == 0 {
            hanamaruView.image = UIImage(named: "はなまるoff")
        }else if hanamaruStates == 1 {
            hanamaruView.image = UIImage(named: "はなまる")
        }
    } 

}
