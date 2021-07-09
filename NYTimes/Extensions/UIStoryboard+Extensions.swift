//
//  UIStoryboard+Extensions.swift
//  NYTimes


import UIKit

extension UIStoryboard {
    
    private static let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
    
    func loginVC() -> NTLoginVC {
        return UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "NTLoginVC") as! NTLoginVC
    }
    
    func dashBoardVC() -> NTDashboardVC {
        return UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "NTDashboardVC") as! NTDashboardVC
    }
}
