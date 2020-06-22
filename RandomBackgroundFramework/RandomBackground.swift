//
//  RandomBackground.swift
//  BackgroundTest
//
//  Created by jaeseob Hwang on 2020/06/22.
//  Copyright © 2020 jaeseob Hwang. All rights reserved.
//

import UIKit

public class RandomBackground {
    private static var timer: Timer?
    public static var isFire: Bool {
        get {
            var result: Bool?
            
            if (timer == nil) {
                result = false
            } else {
                result = true
            }

            return result!
        }
    }
    
    private static func generateRandomColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
            
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            
        return randomColor
    }
    
    public static func change(_ view: UIView) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {_ in
            DispatchQueue.main.async {
                view.backgroundColor = generateRandomColor()
            }
        })
        timer?.fire()
    }
    
    public static func stop() {
        timer?.invalidate()
        timer = nil
    }
}
