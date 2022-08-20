//
//  RoundButton.swift
//  Calculator
//
//  Created by 김진혁 on 2022/08/19.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false{
        didSet{
            if isRound{
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
