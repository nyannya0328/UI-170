//
//  CustomTabBar.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selected : String
    @Namespace var animation
    
    var body: some View {
        
        HStack(spacing:0){
            
            TabButton(image: "home", selected: $selected, animation: animation)
            
            TabButton(image: "bell", selected: $selected, animation: animation)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("search")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding(20)
                    .background(Color.pink)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
            })
            .offset(y: -15)
            
            TabButton(image: "heart", selected: $selected, animation: animation)
            
            TabButton(image: "cart", selected: $selected, animation: animation)
        }
      .padding(.top)
       
        .padding(.vertical,-10)
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        .background(Color.white)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct TabButton : View {
    
    var image : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View{
        
        
        Button(action: {
            
            withAnimation(.spring()){
                selected = image
                
            }
            
        }, label: {
            VStack(spacing:8){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(selected == image ? getColor(image: image) : Color.gray.opacity(0.3))
                
                
                if selected == image{
                    
                    Circle()
                        .fill(Color.pink)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                    
                }
            }
            .frame(maxWidth: .infinity)
                
        })
        
    }
    func getColor(image : String) -> Color{
        
        
        switch image {
        case "home": return Color.red
        case "heart" : return Color.green
        case "cart" : return Color.purple
        case "bell" : return Color.orange
        default : return Color.red
            
        }
    }
}
