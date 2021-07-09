//
//  APIManager.swift
//  NYTimes


import Foundation

class APIManager: NSObject {
    
    static let shared: APIManager = APIManager()
    
    func getTopStories(_ completion: @escaping (NTTopStoriesResponse?) -> Void) {
        if let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=O0FOsCkvdHUnadaVDnwYP2uZVN3pgBEG") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data, let responseString = String(data: safeData, encoding: .utf8) {
                        guard let storyResponse: NTTopStoriesResponse = Mapper<NTTopStoriesResponse>().map(JSONString: responseString) else {
                            completion(nil)
                            return
                        }
                        completion(storyResponse)
                    } else {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    
    func getArticles(_ searchText: String = "", completion: @escaping (NTArticleResponse?) -> Void) {
        let urlString = searchText == "" ? "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=O0FOsCkvdHUnadaVDnwYP2uZVN3pgBEG" : "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(searchText)&api-key=O0FOsCkvdHUnadaVDnwYP2uZVN3pgBEG"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data, let responseString = String(data: safeData, encoding: .utf8) {
                        guard let articleResponse: NTArticleResponse = Mapper<NTArticleResponse>().map(JSONString: responseString) else {
                            completion(nil)
                            return
                        }
                        completion(articleResponse)
                    } else {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
}
