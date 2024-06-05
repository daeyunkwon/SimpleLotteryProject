//
//  Lotto.swift
//  SimpleLotteryProject
//
//  Created by 권대윤 on 6/5/24.
//

import UIKit

struct Lotto: Decodable {
    let returnValue: String
    let date: String?
    let drwtNo1: Int?
    let drwtNo2: Int?
    let drwtNo3: Int?
    let drwtNo4: Int?
    let drwtNo5: Int?
    let drwtNo6: Int?
    let bnusNo: Int?
    
    enum CodingKeys: String, CodingKey {
        case returnValue
        case date = "drwNoDate"
        case drwtNo1
        case drwtNo2
        case drwtNo3
        case drwtNo4
        case drwtNo5
        case drwtNo6
        case bnusNo
    }
}
