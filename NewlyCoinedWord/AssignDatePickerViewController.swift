//
//  AssignDatePickerViewController.swift
//  NewlyCoinedWord
//
//  Created by 홍수만 on 2023/07/20.
//

import UIKit

class AssignDatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var dateImageCollection: [UIImageView]!
    
    @IBOutlet var imageViewContainerCollection: [UIView]!
    
    @IBOutlet var dateInfoLabel: [UILabel]!
    @IBOutlet var resultDateLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designDateImage()
        designDateInfoLabel()
        designResultDateLabel()
    }
    
    func designDateImage() {
        let imageNameArr = ["cake", "churros", "doughnut", "icecream"]
        
        for index in 0...3 {
            //UIView
            imageViewContainerCollection[index].layer.cornerRadius = 20
            imageViewContainerCollection[index].layer.shadowColor = UIColor.black.cgColor
            imageViewContainerCollection[index].layer.shadowOffset = CGSize(width: 5, height: 5)//.zero == CGSize(width: 0, height: 0) // 빛이 비치는 방향
            imageViewContainerCollection[index].layer.shadowRadius = 20 // 그림자 퍼짐 정도
            imageViewContainerCollection[index].layer.shadowOpacity = 0.7 // 불투명도
            
            //UIimageView
            dateImageCollection[index].image = UIImage(named: imageNameArr[index])
            dateImageCollection[index].contentMode = .scaleToFill
            dateImageCollection[index].backgroundColor = .black
            dateImageCollection[index].layer.cornerRadius = 20
            dateImageCollection[index].clipsToBounds = true
            
        }
    }
    
    func designDateInfoLabel() {
        for index in 0...3 {
            dateInfoLabel[index].text = "D + \( (index+1)*100 )"
            dateInfoLabel[index].textColor = .white
            dateInfoLabel[index].textAlignment = .center
        }
    }
    
    func designResultDateLabel() {
        for index in 0...3 {
            resultDateLabel[index].text = "날짜를 선택하세요"
            resultDateLabel[index].textColor = .white
            resultDateLabel[index].textAlignment = .center
        }
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy년 MM월 dd일"
        
        for i in 0...3 {
            let result = Calendar.current.date(byAdding: .day, value: (i+1) * 100, to: sender.date)
            resultDateLabel[i].text = dateFormat.string(from: result!)
        }
        
        
    }
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

}
