//
//  BaminUIViewController.swift
//  NewlyCoinedWord
//
//  Created by 홍수만 on 2023/07/23.
//

import UIKit

class BaminUIViewController: UIViewController {

    @IBOutlet var imageCollection: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for imageView in imageCollection {
            imageView.backgroundColor = .black
        }
        
        print("1234")
    }
    



}
