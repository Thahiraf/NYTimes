//
//  NTDashboardViewModel.swift
//  NYTimes


import Foundation

class NTDashboardViewModel: NTLoadingAnimatable, NTAlertable {
    
    var showLoading: (() -> Void)!
    var hideLoading: (() -> Void)!
    var showSuccessAlert: ((String, String) -> Void)!
    var showFailureAlert: ((String, String) -> Void)!
    
    var storiesFetched: ((_ storyResponse: NTTopStoriesResponse) -> Void)!
    var articleFetchedFetched: ((_ articleResponse: NTArticleResponse) -> Void)!
    
    func getStories() {
        self.showLoading()
        APIManager.shared.getTopStories { response in
            self.hideLoading()
            guard let responseObj = response else {
                self.showFailureAlert("API Error", "API Error")
                return
            }
            self.storiesFetched(responseObj)
        }
    }
    
    func getOrSearchArticles(_ searchText: String = "") {
        self.showLoading()
        APIManager.shared.getArticles(searchText) { (response) in
            self.hideLoading()
            guard let responseObj = response else {
                self.showFailureAlert("API Error", "API Error")
                return
            }
            self.articleFetchedFetched(responseObj)
        }
    }
}
