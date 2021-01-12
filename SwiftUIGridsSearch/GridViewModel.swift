//
//  GridViewModel.swift
//  SwiftUIGridsSearch
//
//  Created by Apple on 1/12/21.
//

import Foundation

struct RSS: Decodable {
    let feed: Feeding
}
struct Feeding: Decodable {
    let results: [Results]
}
struct Results: Decodable, Hashable {
    let copyright, name, artworkUrl100, releaseDate: String
}

class GridViewModel: ObservableObject {
    
    @Published var items = 0..<10
    
    //create empty array
    @Published var results = [Results]()

    
    init() {
//        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
////            send to state []
//            self.items = 0..<100
//        }
        
                    
       
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/kh/ios-apps/new-apps-we-love/all/100/explicit.json") else {return}
       
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            guard let data = data else { return } //optional data check
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data)
                print(rss)
                self.results = rss.feed.results
               
            }catch{
                print("Failed to decode: \(error)")
            }
        }.resume()
            
   
    }
}
