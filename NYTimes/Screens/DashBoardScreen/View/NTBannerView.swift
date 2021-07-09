//
//  NTBannerView.swift
//  NYTimes
//
//  Created by Tawakal Express on 08/07/2021.
//

import UIKit

class NTBannerView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "NTStoryCell")
            self.pagerView.automaticSlidingInterval = 4
        }
    }
    
    var storyArray: [NTTopStory] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NTBannerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}

extension NTBannerView: FSPagerViewDataSource, FSPagerViewDelegate {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.storyArray.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let story = storyArray[index]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "NTStoryCell", at: index)
        
        if let imageview = cell.imageView {
            imageview.contentMode = .scaleAspectFill
            imageview.clipsToBounds = true
            self.setImage(imageview, topStory: story)
        }
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldSelectItemAt index: Int) -> Bool {
        return false
    }
    
    fileprivate func setImage(_ imageView: UIImageView, topStory: NTTopStory) {
        if let multiMedias = topStory.multiMedias, multiMedias.count > 0 {
            let mutiMedia = multiMedias[0]
            if let urlString = mutiMedia.url {
                let url = URL(string: urlString)
                let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
                             |> RoundCornerImageProcessor(cornerRadius: 20)
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage(
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
