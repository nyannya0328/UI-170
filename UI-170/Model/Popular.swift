//
//  Popular.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct Popular: Identifiable {
    var id = UUID().uuidString
    var title : String
    var description : String
    var image : String
    var price : String
    
    
    
}

var populars = [
    Popular(title: "Lets me get you some coffee?", description: "Star Bucks", image: "s1", price: "200"),
    
    Popular(title: "Can I get you some coffee?", description: "スターバックス", image: "s2", price: "500"),
]

