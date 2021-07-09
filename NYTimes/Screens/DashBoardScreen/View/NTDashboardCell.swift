//
//  NTDashboardCell.swift
//  NYTimes
//
//  Created by Tawakal Express on 08/07/2021.
//

import UIKit

class NTDashboardCell: UITableViewCell {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var storyDescLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(article: NTArticleDocs) {
        if let headLine = article.headLine {
            self.storyTitleLabel.text = headLine.main ?? ""
        }
        
        self.storyDescLabel.text  = article.abstract ?? ""
        if let multiMedias = article.multimedia, multiMedias.count > 0 {
            let filter = multiMedias.filter({ (multimedia) -> Bool in
                return multimedia.subType == "blog225"
            })
            if filter.count > 0 {
                let mutiMedia = filter[0]
                if let urlString = mutiMedia.url {
                    let baseURL = "https://www.nytimes.com/"
                    let url = URL(string: baseURL+urlString)
                    let processor = DownsamplingImageProcessor(size: storyImageView.bounds.size)
                                 |> RoundCornerImageProcessor(cornerRadius: 20)
                    storyImageView.kf.indicatorType = .activity
                    storyImageView.kf.setImage(
                        with: url,
                        placeholder: UIImage(named: "img_banner_placeholder"),
                        options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(1)),
                            .cacheOriginalImage
                        ])
                    {
                        result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                        }
                    }
                }
            }
            
        }
        
    }
}
