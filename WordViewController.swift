//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by 홍수만 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var wordFirstButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordTextField.text = getRandomWord()
        getRandomWord()
        
        wordFirstButton.isHidden = true
        
        wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        wordFirstButton.titleLabel?.textColor = .black
    }
    
    @discardableResult // 반환값을 꼭 사용하지 않아도 됨
    func getRandomWord() -> String {
        let random = ["고래밥", "칙촉", "카스타드", "메로나", "월드콘"]
        let result = random.randomElement()!
        
        print(result)
        
        return result
    }
    
    //버튼 클릭시 텍스트필드의 텍스트에 버튼 타이틀이 들어가는 기능
    //1.
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        print(sender.currentTitle)
        print(sender.titleLabel?.text)
        //2.
        wordTextField.text = sender.currentTitle
        //3.
        textFieldKeyboardTapped(wordTextField)
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        print("tapped")
        
//        if wordTextField.text == "별다줄" {
//            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다."
//        } else if wordTextField.text == "뉴진스" {
//            resultLabel.text = "뉴진스 뜻은 ..."
//        } else {
//            resultLabel.text = "찾는 결과가 없습니다."
//        }
        

        switch wordTextField.text?.uppercased() {
        case "별다줄":
            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다."
        case "뉴진스":
            resultLabel.text = "뉴진스 뜻은 새로운 청바지"
        case "JMT":
            resultLabel.text = "JMT 뜻은 존맛탱 (존X 맛있다)입니다"
        default:
            resultLabel.text = "찾는 결과가 없습니다."
        }
    }
    
    
}
