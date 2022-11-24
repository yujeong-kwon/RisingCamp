//
//  Cart.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import Foundation
import UIKit

class CartMenu{
    static let shared = CartMenu()
    private var cartList: [Cart] = []
    private init(){
        [
        
            //Cart(name: "메뉴1", sum: "aaa", amount: 1)
           
        ].forEach{setting in self.cartList.append(setting)
        }
    }
    public func add(name: String, sum: String, img: UIImage){
        self.cartList.append(Cart(name: name, sum: sum, amount: 1, img: img))
        //self.settingList.append(Setting(name: "추가된 데이터"))
    }

    public func read(at: Int) -> Cart{
        return cartList[at]
    }

    public func update(at: Int, newValue: Cart){
        cartList[at] = newValue
    }

    public func delete(at: Int){
        cartList.remove(at: at)
    }

    var count: Int { self.cartList.count }
}

struct Cart{
    let name: String
    let sum: String
    let amount: Int
    let img: UIImage
    
}
