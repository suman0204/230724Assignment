//
//  AssignNewlyCoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 홍수만 on 2023/07/21.
//

import UIKit

class AssignNewlyCoinedWordViewController: UIViewController {
    
    @IBOutlet var wordTextField: UITextField!
    
    @IBOutlet var mainImageVIew: UIImageView!
    
    @IBOutlet var wordButtonCollection: [UIButton]!
    
    @IBOutlet var wordMeaningLabel: UILabel!
    
    @IBOutlet var wordUpdateButton: UIButton!
    
    let newlyCoinedWords: [String : String] = ["별다줄": "별거 다 줄인다", "JMT": "존맛탱(존X 맛있다)", "스불재": "스스로 불러온 재앙", "억까": "억지로 까다", "억텐": "억지 텐션", "점메추": "점심메뉴 추천", "카공": "카페에서 공부"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextField()
        designImageView()
        designWordButton()
        designwordMeaningLabel()
        designSearchButton()
//        designUpdateButton()
        
        insertWordButton()
        

    }

    func designTextField() {
        wordTextField.layer.borderWidth = 2
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.layer.cornerRadius = 10
    }
    
    func designWordButton() {
        for button in wordButtonCollection {
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 10
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            button.tintColor = .gray
            
            
        }
    }
    
    func designImageView() {
        mainImageVIew.image = UIImage(named: "background")
        mainImageVIew.contentMode = .scaleAspectFill
    }
    
    func designwordMeaningLabel() {
        wordMeaningLabel.text = "신조어를 검색해보세요!"
        wordMeaningLabel.textAlignment = .center
        wordMeaningLabel.font = .boldSystemFont(ofSize: 20)
        
    }
    
//    func designUpdateButton() {
//        wordUpdateButton.setTitle("단어 바꾸기", for: .normal)
//        wordUpdateButton.layer.cornerRadius = 10
//        wordUpdateButton.layer.borderColor = UIColor.black.cgColor
//        wordUpdateButton.layer.borderWidth = 2
//        wordUpdateButton.backgroundColor = .black
//        wordUpdateButton.setTitleColor(.white, for: .normal)
//    }
    
    func insertWordButton() {
        for (index, word) in newlyCoinedWords.enumerated() {
            if index < wordButtonCollection.count {
                let button = wordButtonCollection[index]
                let wordTitle = word.0
                button.setTitle(wordTitle, for: .normal)

            }
        }

    }
    
    //코드 한 줄씩 뜯어보기...
    func designSearchButton() {
        // 검색 버튼을 추가할 버튼을 생성합니다.
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.addTarget(self, action: #selector(textFieldKeyboardExit), for: .touchUpInside)
        
        searchButton.tintColor = .black
        
        // 버튼의 크기를 설정합니다. (원하는 크기로 조정 가능)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)

        
        // 오른쪽에 버튼을 추가합니다.
        wordTextField.rightView = searchButton
        wordTextField.rightViewMode = .always
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "두 글자 이상 입력해주세요", message: "", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        wordMeaningLabel.text = newlyCoinedWords[wordTextField.text!.uppercased()]
    }
    
    @IBAction func textFieldKeyboardExit(_ sender: UITextField) {
        guard let wordTextFieldText = wordTextField.text  else {
            showAlert()
            
            return
        }
        
        if wordTextFieldText.count < 2 {
            showAlert()
        } else {
            if newlyCoinedWords.keys.contains(wordTextFieldText.uppercased()) {
                wordMeaningLabel.text = newlyCoinedWords[wordTextFieldText.uppercased()]
            } else {
                wordMeaningLabel.text = "해당 단어는 정보가 없습니다"
            }
        }
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
//    @IBAction func updateButtonTapped(_ sender: UIButton) {
//        switch sender.tag {
//        case 0:
//            if let setTitle = newlyCoinedWords["스불재"] {
//                wordButtonCollection[sender.tag].setTitle(setTitle, for: .normal)
//
//            }
//        case 1:
//            if let setTitle = newlyCoinedWords["별다줄"] {
//                wordButtonCollection[sender.tag].setTitle(setTitle, for: .normal)
//            }
//        case 2:
//            if let setTitle = newlyCoinedWords["억까"] {
//                wordButtonCollection[sender.tag].setTitle(setTitle, for: .normal)
//            }
//        case 3:
//            if let setTitle = newlyCoinedWords["카공"] {
//                wordButtonCollection[sender.tag].setTitle(setTitle, for: .normal)
//            }
//        default:
//            print("확인 요망")
//        }
//    }
    
}
