//
//  NTAlertable.swift
//  NYTimes
//

import Foundation

protocol NTAlertable {
    var showSuccessAlert: ((_ title: String, _ message: String) -> Void)! { get set }
    var showFailureAlert: ((_ title: String, _ message: String) -> Void)! { get set }
}
