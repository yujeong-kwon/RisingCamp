//
//  ResponseRequest.swift
//  RC_week6
//
//  Created by 권유정 on 2022/10/23.
//

import Foundation
import Alamofire
import UIKit

class ResponseRequest{
    func getData(_ viewController: ViewController, keyword: String){
        let url = "https://openapi.naver.com/v1/search/movie.json?"
        let params: Parameters = ["query": keyword]
        AF.request(url, method: .get, parameters: params, headers: ["X-Naver-Client-Id" : "8vg0otcHurIRHV5CtPkx", "X-Naver-Client-Secret" : "ZpeFNlKxzy"]).responseDecodable(of: Welcome.self){
            response in
            switch response.result{
            case .success(let response):
                viewController.didSuccess(response)
                print("성공")
            case .failure(let error):
                print(error)
                print("실패")
            }
            
        }
    }
}
