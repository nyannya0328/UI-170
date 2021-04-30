//
//  FoodView.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct FoodView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var category : categorie = categories.first!
    
    @State var selected = "home"
   
    
    var body: some View {
        
        VStack(spacing:0) {
            
            TabView(selection:$selected){
                LandingScreen(category: $category)
                    .tag("home")
                
                CardView()
                    .tag("heart")
                
                CircleView()
                    .tag("bell")
                
                ShoeView()
                    .tag("cart")
            }
            
            CustomTabBar(selected: $selected)
            
          
        }
         .ignoresSafeArea()
        
       
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


