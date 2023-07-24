//
//  DatePickerViewController.swift
//  NewlyCoinedWord
//
//  Created by 홍수만 on 2023/07/20.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var date100Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        designDatePicker()
        testViewProperty()
        datePickerValueChanged(datePicker)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        
        let result = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        print(result)
        
        //DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM월 dd일, yyyy년"
        let value = dateFormat.string(from: result!)
        print(value)
        
        date100Label.text = value
        
        //+100일 뒤
        
    }
    
    func testViewProperty() {
        background100ImageView.backgroundColor = .black
        background100ImageView.layer.cornerRadius = 20
        
        //그림자 그리기
        background100ImageView.layer.shadowColor = UIColor.black.cgColor
        background100ImageView.layer.shadowOffset = CGSize(width: 10, height: 10)//.zero == CGSize(width: 0, height: 0) // 빛이 비치는 방향
        background100ImageView.layer.shadowRadius = 10 // 그림자 퍼짐 정도
        background100ImageView.layer.shadowOpacity = 0.5 // 불투명도
        background100ImageView.clipsToBounds = false // true로 하면 그림자 사라지
        
        date100Label.backgroundColor = .red
        date100Label.layer.cornerRadius = 20
    }
    
    func designDatePicker() {
        
        datePicker.tintColor = .systemBrown
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
}
