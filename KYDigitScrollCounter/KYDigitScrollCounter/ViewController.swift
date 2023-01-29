//
//  ViewController.swift
//  KYDigitScrollCounter
//
//  Created by Keyon on 2023/1/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(numberCounter)
        view.addSubview(button)
        
        numberCounter.center = view.center
        button.sizeToFit()
        button.center = CGPoint(x: view.center.x, y: view.center.y + 100)
    }
    
    var isDouble = false
    @objc func pressedNewNumber() {
        let newNumber = Double(arc4random() % 999999999) + (isDouble ? 0.99 : 0)
        isDouble.toggle()
        numberCounter.setValue("\(newNumber)")
    }
    
    private lazy var numberCounter: NumberScrollCounter = {
        let view = NumberScrollCounter(value: "1", scrollDuration: 0.33, prefix: "$", suffix: "", textColor: .blue, gradientColor: .clear, gradientStop: 0.2)
        view.frame = CGRect(origin: .zero, size: CGSize(width: 0, height: 40))
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("button", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(pressedNewNumber), for: .touchUpInside)
        return button
    }()

}

