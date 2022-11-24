//
//  Movie.swift
//  RC_week6
//
//  Created by 권유정 on 2022/10/23.
//

import Foundation

class SettingMovie{
    static let shared = SettingMovie()
    var list: [Movie] = []
    private init(){
        
    }
    public func add(title: String, image: String, director: String, actor: String, userRating: String, star: Bool, link: String){
        self.list.append(Movie(title: title, image: image, director: director, actor: actor, userRating: userRating, star: star, link: link))
        self.list = list.sorted(by: {$0.userRating > $1.userRating})
        
        
    }
    
    public func update(newValue: Movie, index: Int){
        list[index].star = newValue.star
    }
    
    public func getBookmarkData(at: Int) -> Movie{
        let bookmarkList = list.filter{(element) -> Bool in
            return element.star == true
        }
        return bookmarkList[at]
    }
    
    public func reload(){
        self.list = []
    }
    public func read(at: Int) -> Movie{
        return list[at]
    }
    var count: Int {self.list.count}
}

struct Movie{
    let title, image, director, actor, userRating: String
    var star: Bool
    let link: String
}
