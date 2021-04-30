//
//  Card.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct Card: Identifiable {
    
    var id = UUID().uuidString
    var cardHolder : String
    var cardNumber : String
    var cardImage : String
    var cardValidty : String
    
}

var cards = [
Card(cardHolder: "にゃん", cardNumber: "1234 5678 9101", cardImage: "p1", cardValidty: "23-03-28"),
    Card(cardHolder: "🐨", cardNumber: "5678 5678 9101", cardImage: "p3", cardValidty: "23-6-28"),
    Card(cardHolder: "Girl", cardNumber: "8965 5678 9101", cardImage: "p4", cardValidty: "23-5-28")
]


