//
//  NTLoadinAnimatable.swift
//  NYTimes
//

import Foundation

protocol NTLoadingAnimatable {
    var showLoading: (() -> Void)! { get set }
    var hideLoading: (() -> Void)! { get set }
}
