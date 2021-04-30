//
//  CircleView.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/29.
//

import SwiftUI

var gra = LinearGradient(gradient: .init(colors: [.red,.orange,.blue]), startPoint: .top, endPoint: .bottom)

struct CircleView: View {
    @State var startAnimation = false
    
    @State var finishAnimaiton = false
    
    @State var pulse1 = false
    @State var pulse2 = false
    
    
    @State var foundPeople : [People] = []
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .semibold))
                      
                    
                    
                    Text(finishAnimaiton ? "\(peoples.count)People Nearby" : "Near By Search")
                        .font(.title2)
                        .fontWeight(.bold)
                })
                
                
                Spacer()
                
                
                Button(action: VerifyAndAddPeople, label: {
                    if finishAnimaiton{
                        
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 22, weight: .bold))
                    
                        
                    }
                    
                    else{
                        
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                    
                    }
                })
                .animation(.none)
                
                
            }
            .padding()
            .padding(.top,getSafeArea().top)
            .foregroundColor(.black)
            .background(Color.white)
            
            
            ZStack{
                Circle()
                    
                    .stroke(Color.green,lineWidth: 5)
                    .frame(width: 130, height: 130)
                    .scaleEffect(pulse1 ? 3.3 : 0)
                    .opacity(pulse1 ? 0 : 1)
                
                Circle()
                    
                    .stroke(gra,lineWidth: 5)
                    .frame(width: 130, height: 130)
                    .scaleEffect(pulse2 ? 3.3 : 0)
                    .opacity(pulse2 ? 0 : 1)
            
                
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 130, height: 130)
                    .shadow(color: .green.opacity(0.3), radius: 5, x: 5, y: 5)
                
                    
                
              
                    
                    
                    Circle()
                        .stroke(Color.black,lineWidth:1.4)
                       
                        .frame(width:finishAnimaiton ? 70 : 30, height:finishAnimaiton ? 70 : 30)
                        .overlay(
                        Image(systemName: "checkmark")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .opacity(finishAnimaiton ? 1 : 0)
                            
                        
                        
                        )
                
                ZStack{
                    
                    
                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color.blue,lineWidth: 1.4)
                    
                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color.blue,lineWidth: 1.4)
                        .rotationEffect(.init(degrees: -180))
                        
                }
                .frame(width: 70, height: 70)
                .rotationEffect(.init(degrees: startAnimation ? 360 : 0))
                
                ForEach(foundPeople){people in
                    
                    Image(people.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(5)
                        .background(Color.white.clipShape(Circle()))
                        .offset(people.offset)
                    
                    
                }
                
                
            }
            .frame(maxHeight: .infinity)
            
            
            if finishAnimaiton{
                
                VStack(spacing:10){
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 50, height: 4)
                        .padding(.vertical,10)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        
                        HStack(spacing:15) {
                            ForEach(peoples){people in
                                
                                
                               
                                
                                VStack(alignment: .center, spacing: 15, content: {
                                    Image(people.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    
                                    Text(people.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Coose!")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .padding(.vertical,10)
                                            .padding(.horizontal,40)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                            
                                    })
                                    
                                    
                                })
                                .padding(.horizontal)
                                
                            }
                        }
                        .padding()
                        .padding(.bottom,getSafeArea().bottom)
                        
                    })
                    
                    
                }
                .background(Color.white)
                .cornerRadius(25)
                .transition(.move(edge: .bottom))
            }
            
            
            
            
            
            
        }
        .ignoresSafeArea()
        .background(Color.black.opacity(0.03).ignoresSafeArea())
        .onAppear(perform: {
            animationViewCircle()
        })
        
    }
    
    
    func VerifyAndAddPeople(){
        
        if foundPeople.count < 5{
            
            
            withAnimation{
                
                var people = peoples[foundPeople.count]
                people.offset = firstFiveOffset[foundPeople.count]
                foundPeople.append(people)
                
                
            }
            
        }
        
        else{
            
            withAnimation(Animation.linear){
                
                finishAnimaiton.toggle()
                
                startAnimation = false
                pulse1 = false
                pulse2 = false
                
                
                
                
            }
            
            
            if !finishAnimaiton{
                
                withAnimation{
                    
                    foundPeople.removeAll()
                    animationViewCircle()
                    
                }
                
            }
            
        }
        
        
        
        
        
        
    }
    
    func animationViewCircle(){
        
        
        withAnimation(Animation.linear(duration: 1.7).repeatForever(autoreverses: false)){
            
            startAnimation.toggle()
            
            
        }
        
        withAnimation(Animation.linear(duration: 1.7).repeatForever(autoreverses: false).delay(-0.1)){
            
            pulse1.toggle()
            
            
        }
        
        
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                
                withAnimation(Animation.linear(duration: 1.7).repeatForever(autoreverses: false).delay(-0.1)){
                
                
                
                
                
                pulse2.toggle()
                
                
            }
            
        }
        
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}

struct People : Identifiable {
    var id = UUID().uuidString
    var image : String
    var name : String
    var offset : CGSize = CGSize(width: 0, height: 0)
}

var peoples = [
People(image: "p1", name: "きんぐまる"),
    People(image: "p2", name: "コアラ丸"),
    People(image: "p3", name: "チーこ"),
    People(image: "p4", name: "らいまる"),
    People(image: "p5", name: "こあら"),
]

var firstFiveOffset: [CGSize] = [

CGSize(width: 100, height: 100),
    CGSize(width: -100, height: -100),
    
    CGSize(width: -50, height: 130),
    CGSize(width: 130, height: -50),
    CGSize(width: 100, height: -50),
    ]
