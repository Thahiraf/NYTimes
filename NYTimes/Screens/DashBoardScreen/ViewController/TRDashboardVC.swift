//
//  NTDashboardVC.swift


import UIKit

class NTDashboardVC: UIViewController {
    
    @IBOutlet weak var dashBoardTableView: UITableView!
    
    let dashBoardViewModel: NTDashboardViewModel = NTDashboardViewModel()
    
    var storyArray: [NTTopStory] = []
    var articleArray: [NTArticleDocs] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeviewModel()
    }
    
    fileprivate func initializeviewModel() {
        self.dashBoardViewModel.showLoading = {
            DispatchQueue.main.async {
                self.startActivityIndicator()
            }
        }
        self.dashBoardViewModel.hideLoading = {
            DispatchQueue.main.async {
                self.stopActivityIndicator()
            }
        }
        self.dashBoardViewModel.showFailureAlert = {title, message in
            DispatchQueue.main.async {
                self.presentAlert(withTitle: title, message: message)
            }
        }
        self.dashBoardViewModel.storiesFetched = {stories in
            DispatchQueue.main.async {
                self.storyArray = stories.results ?? []
                self.dashBoardViewModel.getOrSearchArticles()
            }
        }
        self.dashBoardViewModel.articleFetchedFetched = {artcleResponse in
            DispatchQueue.main.async {
                self.articleArray = []
                if let response = artcleResponse.response, let articles = response.artcleDocs {
                    self.articleArray = articles
                }
                self.dashBoardTableView.reloadData()
            }
        }
        self.dashBoardViewModel.getStories()
    }
    
//    @IBAction func profileTapAction(_ sender: Any) {
//        self.tappedProfileButton()
//    }

}

extension NTDashboardVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NTDashboardSearchCell") as! NTDashboardCell
            cell.searchBar.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NTDashboardCell") as! NTDashboardCell
            let article = self.articleArray[indexPath.row - 1]
            cell.setData(article: article)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bannerView = NTBannerView()
        bannerView.storyArray = self.storyArray
        return bannerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 215.0
    }
}

extension NTDashboardVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchArticle(searchText)
    }
    
    fileprivate func searchArticle(_ searchText: String) {
        self.dashBoardViewModel.getOrSearchArticles(searchText)
    }
}
