//
//  CommonRouting.swift
//  NYTimes


import UIKit

class CommonRouting: NSObject {
    
    static func navigateToDashBoard() {
        let dashBoard = UIStoryboard().dashBoardVC()
        let window = (UIApplication.shared.delegate as! AppDelegate).window!
        let options = UIWindow.TransitionOptions()
        options.direction = .toRight
        window.set(rootViewController: dashBoard, options: options, nil)
    }
}
