//
//  CardView.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

struct CardView: View {
    @Environment(\.colorScheme) var scheme
    @State var startAnimation = false
    @State var cardRotation = false
    @State var selectedCard : Card = Card(cardHolder: "", cardNumber: "", cardImage: "", cardValidty: "")
    
    @Namespace var animation
    
    @State var cardAnimation = false
    var body: some View {
        ScrollView{
            
            VStack{
                
                HStack{
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Image("p5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    
                    
                }
                
                
                ZStack{
                    
                    
                    ForEach(cards.indices.reversed(),id:\.self){index in
                        
                        
                        subCardView(card: cards[index])
                            .scaleEffect(selectedCard.id == cards[index].id ? 1 : index == 0 ? 1 : 0.9)
                            
                            .rotationEffect(.init(degrees:startAnimation ? 0 : index == 1 ? -15 : (index == 2 ? 15 : 0)))
                            
                            .onTapGesture {
                                AnimationView(card: cards[index])
                            }
                            
                            
                        
                            .offset(y:selectedCard.id == cards[index].id && startAnimation ? 0 : index == 1 ? 60 :(index == 2 ? -60 : 0))
                            
                            .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                        
                            .rotationEffect(.init(degrees: cardRotation ? -90 : 0))
                        
                            .zIndex(selectedCard.id == cards[index].id ? 1000 : 0)
                        
                            .opacity(startAnimation ? selectedCard.id == cards[index].id ? 1 : 0 : 1)
                        
                    }
                }
                .scaleEffect(0.8)
               .rotationEffect(.init(degrees: 90))
                .frame(height: getRect().width - 30)
                .padding(.top,20)
               
                
                VStack(alignment: .leading, spacing: 15, content: {
                    Text("Total Amount")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    
                    Text("155,155,155")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
            }
            .padding()
            
    
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.03).ignoresSafeArea())
        .blur(radius: cardAnimation ? 100 : 0)
        .overlay(
            ZStack(alignment: .topTrailing, content: {
                if cardAnimation{
                    
                    Button(action: {
                        
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)){
                            
                            
                            startAnimation = false
                            selectedCard = Card(cardHolder: "", cardNumber: "", cardImage: "", cardValidty: "")
                            cardAnimation = false
                            cardRotation = false
                            
                            
                        }
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(scheme == .dark ? .black : .white)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    .padding()
                    
                    subCardView(card: selectedCard)
                        .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    
                }
                
                
            })
        
        )
        
    }
    
    func AnimationView(card : Card){
        selectedCard = card
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.6)){
            
            
            startAnimation = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            
            cardRotation = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            
            withAnimation(.spring()){
                
                
                cardAnimation = true
            }
            
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct subCardView : View {
    var card : Card
    var body: some View{
        
        Image(card.cardImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .overlay(
            
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    
                    Spacer()
                    
                    Text(card.cardNumber)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .offset(x: -15)
                    
                    Spacer()
                    
                    HStack{
                        
                        
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text("Card Holder")
                                .fontWeight(.bold)
                            
                            Text(card.cardHolder)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                        })
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text("Card Vaild")
                                .fontWeight(.bold)
                            
                            Text(card.cardValidty)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                        })
                        
                    }
                    .foregroundColor(.white)
                    
                    
                })
                .padding()
            
            )
        
        
    }
}
