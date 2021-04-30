//
//  LandingScreen.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct LandingScreen: View {
    @Binding var category : categorie
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "circle.grid.3x3.fill")
                        .font(.title2)
                        .padding(10)
                        .background(Color.pink.opacity(0.5))
                        .cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .background(Color.primary.opacity(0.3))
                        .cornerRadius(8)
                        
                })
                
                
                
                
                
            }
            .overlay(
                
                HStack{
                    
                    Image("placeholder")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.pink)
                    
                    Text("Carlifornia US")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                }
            
            
            )
            .padding()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(alignment:.leading){
                    
                    
                    HStack(spacing:20){
                        
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            (
                            
                            Text("Firstes in Delivery")
                                
                                +
                                
                                Text("Food")
                                .foregroundColor(.red)
                            
                            )
                            .font(.title)
                            .fontWeight(.bold)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Order Now")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Color.pink)
                                    .clipShape(Capsule())
                            })
                            
                            
                          
                            
                        })
                        Spacer()
                        
                        
                        Image("delivery-man")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width / 3)
                        
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.5))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing:15){
                            
                            
                            ForEach(categories){catego in
                                
                                HStack(spacing:10){
                                    
                                    Image(catego.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .padding(5)
                                        .background(category.id == catego.id ? Color.white : Color.gray)
                                    
                                    Text(catego.name)
                                        .fontWeight(.bold)
                                        .foregroundColor(category.id == catego.id ? Color.white : Color.black)
                                    
                                }
                                .padding(.vertical,12)
                                .padding(.horizontal)
                                .background(category.id == catego.id ? Color.pink : Color.gray.opacity(0.3))
                                .clipShape(Capsule())
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        
                                        
                                        category = catego
                                    }
                                }
                                
                                
                            }
                        }
                        .padding(.horizontal)
                    })
                    
                    HStack{
                        
                        Text("Popular Now")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack(spacing:5){
                                
                                
                                Text("View All")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.pink)
                                    
                                
                                Image(systemName: "chevron.right")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.vertical,4)
                                    .padding(.horizontal)
                                    .background(Color.pink)
                                    .cornerRadius(5)
                                    
                            }
                        })
                    }
                    .padding()
                    .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing:20){
                            
                            ForEach(populars){item in
                                
                                PopularRowView(item: item)
                                
                                
                                
                                
                                
                            }
                            
                            
                        }
                        .padding()
                        
                    })
                    
                    
                    
                    
                }
                .padding(.vertical,10)
                
                
            })
        }
        .background(Color.black.opacity(0.03).ignoresSafeArea())
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
