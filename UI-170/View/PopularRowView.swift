//
//  PopularRowView.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct PopularRowView: View {
    var item : Popular
    var body: some View {
        VStack(spacing:15){
            
            Image(systemName: "flame")
                .font(.footnote)
                .foregroundColor(.red)
                .padding(8)
                .background(Color.orange.opacity(0.1))
                .clipShape(Circle())
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(-10)
            
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3,height: 100)
                .padding(.top,6)
            
            Text(item.title)
                .fontWeight(.bold)
                .padding(.top,20)
            
            Text(item.description)
                .font(.footnote)
                .foregroundColor(.gray)
            
            
            (
            
                Text(item.price)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                +
                
                Text("  yen")
                    .font(.footnote)
                    .foregroundColor(.pink)
                
            
            
            )
            .padding(.bottom)
            .padding(.top,8)
            
            
        }
        .padding(.horizontal,30)
        .padding(.vertical,20)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
    }
}

struct PopularRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
