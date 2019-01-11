//
//  ViewController.swift
//  novemberTwenty
//
//  Created by User13 on 2018/11/28.
//  Copyright © 2018 user13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 每一題的類別
    struct qua {
        var question:String
        var answer:String
        var choice:[String] = []
    }
    // 結果
    @IBOutlet weak var resultLabel: UILabel!
    // 選項
    @IBOutlet var answerButton: [UIButton]!
    // 題目
    @IBOutlet weak var questionLabel: UILabel!
    // 題號
    @IBOutlet weak var roundLabel: UILabel!
    // 圖片
    @IBOutlet weak var image: UIImageView!
    // 分數
    @IBOutlet weak var totalLabel: UILabel!
    // 時間
    @IBOutlet weak var timeLabel: UILabel!
    // 再來一次鈕
    @IBOutlet weak var againButton: UIButton!
    // 背景
    @IBOutlet weak var background: UIImageView!
    // 各題
    var mulitples = [
        qua(question: "請問，俗稱的「金身」、「無敵」是監管者的什麼輔助特質？", answer: "興奮", choice: [ "失常", "閃現", "傳送", "興奮" ]),
        qua(question: "請問，俗稱的「一刀斬」、「一刀倒」是監管者的什麼天賦？", answer: "挽留", choice: [ "挽留", "禁閉空間", "通緝", "張狂" ]),
        qua(question: "請問，俗稱的「歐洲斬」、「歐皇斬」是監管者的什麼天賦？", answer: "厄運震懾", choice: [ "憤怒", "狂暴", "恐慌", "厄運震懾" ]),
        qua(question: "請問，監管者約瑟夫在現實（非鏡像）且沒有任何技能的狀況下，砍求生者一次扣多少血量？", answer: "７５％", choice: [ "２５％", "５０％", "７５％", "１００％" ]),
        qua(question: "請問，監管者約瑟夫在鏡像中把求生者砍倒放上狂歡之椅，當鏡像結算後現實中的求生者會出現什麽現象？", answer: "直接倒地", choice: [ "直接倒地", "被綁在跟鏡像中對應的狂歡之椅上", "不扣血但五秒內不能使用交互動作", "會爆點給監管者知道" ]),
        qua(question: "請問，下列對於監管者宿傘之魂（黑白）的敘述何者正確？", answer: "小白攻擊範圍判定較長", choice: [ "小白攻擊範圍判定較長", "小黑出刀速度較慢", "小白可搖鈴", "小黑可攝魂" ]),
        qua(question: "請問，下列哪一監管者可以隱身及打出霧刃？", answer: "傑克", choice: [ "廠長", "鹿頭", "黃衣之主", "傑克" ]),
        qua(question: "請問，下列對於監管者的敘述何者正確？", answer: "廠長可以丟出娃娃並與其交換位子", choice: [ "建築師不需要能量就可以無限造牆，求生者造牆才需消耗能量", "廠長可以丟出娃娃並與其交換位子", "宿傘之魂的諸行無常只要在地圖範圍內都可以無限距離傳送", "蜘蛛使用繭刑時不消耗蛛絲" ]),
        qua(question: "請問，下列何者監管者有效攻擊判定範圍最短（刀最短）？", answer: "紅蝶", choice: [ "小丑", "蜘蛛", "紅蝶", "黃衣之主" ]),
        qua(question: "請問，道具「玫瑰手杖」是哪一監管者轉專屬配戴，可以將綁氣球的動作改為公主抱？", answer: "傑克", choice: [ "蜘蛛", "鹿頭", "傑克", "小丑" ]),
        qua(question: "請問，在監管者使用「聆聽」技能時，下列何種動作不會被發現？", answer: "走路", choice: [ "走路", "破譯機器", "使用針筒自療", "使用遊記繪本縮小躲起來" ]),
        qua(question: "請問，在「聯合狩獵」模式中哪一道具求生者不能購買？", answer: "助燃劑", choice: [ "加速劑", "幸運劑", "寧神劑", "助燃劑" ]),
        qua(question: "請問，下列哪一求生者可以使用橄欖球將監管者撞暈？", answer: "前鋒", choice: [ "傭兵", "前鋒", "空軍", "幸運兒" ]),
        qua(question: "請問，下列何種道具可以在箱子中找到？", answer: "信號槍", choice: [ "門之鑰", "盲杖", "信號槍", "役鳥" ]),
        qua(question: "請問，在沒有任何道具技能的輔助下求生者的哪一個動作會比監管者快速", answer: "跑步", choice: [ "從高處落地的僵直時間", "翻窗", "比監管者更貼著場地模型邊緣走", "跑步" ]),
        qua(question: "請問，俗稱的「大心臟」是求生者的何種技能？", answer: "回光返照", choice: [ "回光返照", "旁觀者", "破窗理論", "化險為夷" ]),
        qua(question: "請問，下列哪一動作求生者與監管者都可以做？", answer: "翻窗", choice: [ "破譯", "翻板", "翻窗", "走地窖" ]),
        qua(question: "請問，在一般匹配模式中，遊戲內求生者剩下幾人時地窖會開啟（非刷新）？", answer: "１", choice: [ "１", "２", "３", "４" ]),
        qua(question: "請問，下列何者求生者天賦可以突破自癒上限，並一場只限用一次？", answer: "絕處逢生", choice: [ "囚徒困境", "不屈不撓", "絕處逢生", "求生意志" ]),
        qua(question: "請問，哪一求生者可以治療２５％的血量？", answer: "醫生", choice: [ "祭司", "先知", "調香師", "醫生" ])
    ]
    var choices:[String] = [] // 目前的題目選項陣列
    var totalScore:Int = 0 // 分數
    var mul:qua? // 目前的題目物件
    var test:[Int] = [] // 題庫的出題順序
    var count = 0 // 算目前第幾題
    var counter = 120 // 計時器，一開始3分鐘
    var timer = Timer() // 計時器
    let roundString = [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" ] // 題號以中文表示
    var historyScore:[Int] = [ 0, 0, 0, 0 ]
    var historyTime = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
        test = num.shuffled()
        timeLabel.text = "2:00"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        changeQuestion()
        image.isHidden = true
        resultLabel.isHidden = true
        timeLabel.isHidden = false
        background.image = UIImage(named: "背景")
    }
    
    // 當按下答案即執行
    @IBAction func choiceButton(_ sender: UIButton) {
        // 代表所選button是array的第幾個成員
        let number = answerButton.firstIndex(of: sender)
        if ( answerButton[number!].currentTitle == mul!.answer ) {
            totalScore += 10
            totalLabel.text = String(totalScore)
            
            image.image = UIImage(named: "小園丁")
            image.isHidden = false
        }
        else {
            
            image.image = UIImage(named: "小傑克")
            image.isHidden = false
        }
        count += 1
        if ( count < 10 ) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                //self.displayAnswer()
                self.changeQuestion()
            }
        }
        else {
            finalScore()
        }
    }
    
    // 重新計算與遊戲
    @IBAction func playButoon(_ sender: Any) {
        let num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
        test = num.shuffled()
        count = 0
        totalScore = 0
        totalLabel.text = String(totalScore)
        counter = 120
        timeLabel.text = "2:00"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        for i in 0...3 {
            answerButton[i].isEnabled = true
        }
        againButton.setTitle("Again", for: .normal)
        changeQuestion()
        timeLabel.isHidden = false
        background.image = UIImage(named: "背景")
        resultLabel.isHidden = true
    }
    
    // 更新題目
    func changeQuestion() {
        mul = mulitples[test[count]]
        roundLabel.text = "第" + roundString[count] + "題"
        questionLabel.text = mul!.question
        choices = mul!.choice.shuffled()
        answerButton[0].setTitle(choices[0], for: .normal)
        answerButton[1].setTitle(choices[1], for: .normal)
        answerButton[2].setTitle(choices[2], for: .normal)
        answerButton[3].setTitle(choices[3], for: .normal)
        
    }
    
    // 最後結算
    func finalScore () {
        timer.invalidate()
        for i in 0...3 {
            answerButton[i].isEnabled = false
        }
        againButton.setTitle("Again", for: .normal)
        historyDisplay()
        
        if totalScore >= 60
        {
            resultLabel.text = "逃出莊園"
            background.image = UIImage(named: "逃出")
        }
        else
        {
            resultLabel.text = "逃出失敗"
            background.image = UIImage(named: "留下")
        }
        
        resultLabel.isHidden = false
        timeLabel.isHidden = true
        
    }
    
    // 每一秒處理計時器
    @objc func timerRun () {
        counter -= 1
        let countSec:Int = counter % 60
        let countMin:Int = counter / 60
        timeLabel.text = String(countMin) + ":" + String( format: "%02d", countSec )
        if ( counter > 0 ) {
        }
        else {
            finalScore()
        }
    }
    
    // 在結算時顯示歷史紀錄
    func historyDisplay () {
        if ( historyTime < 4 ) {
            historyScore[historyTime] = totalScore
        }
        else {
            historyScore[0] = historyScore[1]
            historyScore[1] = historyScore[2]
            historyScore[2] = historyScore[3]
            historyScore[3] = totalScore
        }
        roundLabel.text = "共玩" + String(historyTime + 1) + "次"
        if ( historyTime > 3 ) {
            questionLabel.text = "歷史紀錄：倒數四次"
            for i in 0...3 {
                answerButton[i].setTitle(String(historyScore[3 - i]), for: .normal)
            }
        }
        else {
            questionLabel.text = "歷史紀錄"
            for i in 0...3 {
                if ( (historyTime - i + 1) > 0 ) {
                    answerButton[i].setTitle(String(historyScore[historyTime - i]), for: .normal)
                }
                else {
                    answerButton[i].setTitle("", for: .normal)
                }
            }
        }
        historyTime += 1
        image.isHidden = true
    }
    
}

