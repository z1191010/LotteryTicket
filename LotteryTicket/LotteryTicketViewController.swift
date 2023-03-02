//
//  LotteryTicketViewController.swift
//  LotteryTicketTests
//
//  Created by Kai on 2023/3/1.
//

import UIKit

class LotteryTicketViewController: UIViewController {
    
    var nums = [Int]()
    
    @IBOutlet var ballImageViews: [UIImageView]!
    
    @IBOutlet weak var specialBallImageView: UIImageView!
    
    @IBOutlet weak var specialNumberLabel: UILabel!
    
    @IBOutlet var numberLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //隱藏圖片
        for i in ballImageViews.indices {
            ballImageViews[i].isHidden = true
        }
        specialBallImageView.isHidden = true
        
        // Do any addtional setup after loading the view.
    }
    
    @IBAction func starRandomButton(_ sender: Any) {
        //顯示圖片
        for i in ballImageViews.indices {
            ballImageViews[i].isHidden = false
        }
        specialBallImageView.isHidden = false
        //第二區號碼1到8間隨機亂數
        specialNumberLabel.text = String(Int.random(in: 1...8))
       
        //第一區號碼1到38間不重複隨機取六組
        if nums.isEmpty == true { //透過 isEmpty 判斷 arrary 是否為空
            while nums.count < 6 {
                let randomNum = Int.random(in: 1...38)
                if !nums.contains(randomNum) {
                    nums.insert(randomNum, at: 0)
                }
            }
        } else if nums.isEmpty == false {
            nums.removeAll() //因已達六組 while 循環停止，所以須將 arrary 所有資料移除後才可重新抓取六組新號碼
            while nums.count < 6 {
                let randomNum = Int.random(in: 1...38)
                if !nums.contains(randomNum) {
                    nums.insert(randomNum, at: 0)
                }
                print(nums)
            }
        }
        //第一區號碼顯示數字
        for i in numberLabels.indices {
            numberLabels[i].text = String(nums[i])
        }
    }
}
