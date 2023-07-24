//
//  LEDBoardViewController.swift
//  NewlyCoinedWord
//
//  Created by 홍수만 on 2023/07/24.
//

import UIKit

class LEDBoardViewController: UIViewController {

    @IBOutlet var textFiledBackgroundView: UIView!
    @IBOutlet var textFieldStackView: UIStackView!
    
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet var showUserInputLabel: UILabel!
    
    @IBOutlet var toggleTextField: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        designTextField()
        designLabel()
        designSwitchButton()
        
    }
    
    @IBAction func inputButton(_ sender: UIButton) {
        showUserInputLabel.text = inputTextField.text
    }
    
    @IBAction func textFieldDidEndonExit(_ sender: UITextField) {
        view.endEditing(true)
        showUserInputLabel.text = inputTextField.text
        inputTextField.text = ""
    }
   
    @IBAction func changeTextColorButton(_ sender: UIButton) {
        let colorSet: [UIColor] = [.red, .blue, .green, .yellow, .brown, .cyan, .magenta, .orange, .purple]
        
        let randomColor = colorSet.randomElement()
        
        buttonCollection[1].setTitleColor(randomColor, for: .normal)
        showUserInputLabel.textColor = randomColor
        toggleTextField.onTintColor = randomColor
    }
    
    @IBAction func toggleSwitchTapped(_ sender: UISwitch) {
        textFiledBackgroundView.isHidden.toggle()
        
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    func designTextField() {
        textFiledBackgroundView.backgroundColor = .white
        textFiledBackgroundView.layer.cornerRadius = 10
        inputTextField.layer.borderColor = UIColor.white.cgColor
        inputTextField.layer.borderWidth = 2

        for button in buttonCollection {
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 10
            button.backgroundColor = .white
            
            switch button.tag {
            case 0:
                button.setTitle("보내기", for: .normal)
                button.setTitleColor(.black, for: .normal)
            case 1:
                button.setTitle("Aa", for: .normal)
                button.setTitleColor(.red, for: .normal)

            default:
                print("No Buttons")
            }
        }
    }
    
    func designLabel() {
        showUserInputLabel.textColor = .red
        showUserInputLabel.textAlignment = .center
        showUserInputLabel.font = .boldSystemFont(ofSize: 100)
        showUserInputLabel.text = "내용을 입력해보세요!"
        // 글자 수에 맞춰 text size 조절
        showUserInputLabel.adjustsFontSizeToFitWidth = true
    }
    
    func designSwitchButton() {
        toggleTextField.onTintColor = .red
    }
}
