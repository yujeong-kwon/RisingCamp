//
//  ResponseRepository.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/22.
//

import Foundation
import Alamofire

class ResponseRequest{
    func getData(_ viewController: firstViewController){
        
        let url = "https://openapi.gg.go.kr/PlaceThatDoATasteyFoodSt?KEY=fa074a0da35a4364910b0403a2c8a064&Type=json&pIndex=1&pSize=100"
        let params: Parameters = ["KEY": "fa074a0da35a4364910b0403a2c8a064",
                                  "Type":"json","pIndex":1,"pSize":100]
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: Welcome.self){
            response in
            switch response.result{
            case .success(let response):
                viewController.didSuccess(response)
                print("-------성공")
            case .failure(let error):
                print(error)
                print("-------실패")
            }
        }
       
    }
}
