//
//  ShoeView.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/30.
//

import SwiftUI

struct ShoeView: View {
    @StateObject var model = ShoeViewModel()
    
    @Namespace var animation
    var body: some View {
        ZStack(alignment:.bottom){
            
            VStack{
                
                
                HStack{
                    
                    
                    Button(action: {}) {
                        Image(systemName: "rectangle.3.offgrid")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "bag.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.purple)
                            .clipShape(Circle())
                            .overlay(
                            
                                Text("\(model.cartitems)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.orange)
                                    .clipShape(Circle())
                                    .offset(x: 15, y: -10)
                                    .opacity(model.cartitems != 0 ? 1 : 0)
                            
                            )
                            
                        
                    }
                    
                    
                }
                
                .overlay(
                Text("NIKE")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    
                
                )
                .padding()
                .padding(.top,getSafeArea().top)
                
                
                ScrollView{
                    
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Air MAX")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("NIKE")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                        
                        
                        Text("Price")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        Text("270.000")
                            .font(.title)
                            .fontWeight(.light)
                            
                            .foregroundColor(.purple)
                            .kerning(10)
                        
                        
                        
                    })
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.accentColor.opacity(0.3))
                    
                    .overlay(
                    
                    Capsule()
                        .fill(Color.primary)
                        .frame(width: 4, height: 45)
                        .padding(.top,25)
                        
                        
                        ,alignment: .topLeading
                    
                    )
                    .cornerRadius(20)
                    
                    .padding()
                    
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            
                            model.showCart.toggle()
                        }
                    }
                    
                    
                }
                
                
            }
            .blur(radius: model.showCart ? 100 : 0)
            
            AddtoCart(animation: animation)
                .environmentObject(model)
                .offset(y: model.showCart ? model.startAnimation ? 500 : 0 : 500)
            
            if model.startAnimation{
                
                VStack{
                    
                    Spacer()
                    
                    ZStack{
                        
                        Color.red
                            .frame(width: model.shoeAnimation ? 100 : getRect().width * 1.2, height:  model.shoeAnimation ? 100 : getRect().width * 1.2)
                            .clipShape(Circle())
                            .opacity(model.shoeAnimation ? 1 : 0)
                        
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "SHOE", in: animation)
                            .frame(width: 80, height: 80)
                    }
                    .offset(y:model.saveCart ? 70 : -120)
                    .scaleEffect(model.saveCart ? 0.6 : 1)
                    .onAppear(perform: {
                        
                        model.performAnimation()
                        
                    })
                    
                    if !model.saveCart{
                        
                        Spacer()
                    }
                    
                    Image(systemName: "bag\(model.addItemtoCart ? ".fill" :"" )")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(model.addItemtoCart ?  Color.pink : Color.orange)
                        .clipShape(Circle())
                        .offset(y: model.showBag ? -50 : 300)
                        
                    
                }
                .frame(width: getRect().width)
             .offset(y: model.endAnimation ? 500 : 0)
                
                
                
            }
                
            
            
        }
        
        .ignoresSafeArea(.all,edges: .bottom)
        .background(Color.primary.opacity(0.03).ignoresSafeArea())
        .onChange(of: model.endAnimation, perform: { value in
            if model.endAnimation{
                
                model.resetAll()
                
            }
        })
    }
}

struct ShoeView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeView()
    }
}

struct AddtoCart : View {
    
    @EnvironmentObject var moldel : ShoeViewModel
    
    var animation : Namespace.ID
    
    

    var body: some View{
        
        
        VStack{
            
            HStack(spacing:15){
                
                
                if !moldel.startAnimation{
                
                Image("shoe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: "SHOE", in: animation)
                    
                }
                
                VStack(alignment: .trailing, spacing: 15, content: {
                    Text("Air Max")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text("270.000円")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                })
                
                
            }
            .padding()
            Divider()
                
            
            Text("SelectSize")
            
                .font(.callout)
                .foregroundColor(.green)
                .padding(.vertical)
            
            
            let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 4)
            
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 15, content: {
                
                
                ForEach(sizes,id:\.self){size in
                    
                    Button(action: {
                        
                        
                        moldel.selectedSize = size
                    }, label: {
                        Text(size)
                            .fontWeight(.semibold)
                            .foregroundColor(moldel.selectedSize == size ? .white : .black)
                            .kerning(1.3)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(moldel.selectedSize == size ? Color.orange :Color.purple.opacity(0.3))
                            .cornerRadius(20)
                    })
                    
                    
                }
               
            })
            .padding(.top)
            
            Button(action: {
                
                withAnimation(.easeInOut(duration: 0.7)){
                    
                    
                    moldel.startAnimation.toggle()
                }
                
            }, label: {
                Text("ADD TO CART")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(moldel.selectedSize == "" ? .white : .black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(20)
            })
            .disabled(moldel.selectedSize == "")
            .opacity(moldel.selectedSize == "" ? 0.8 : 1)
            .padding(.top)
            
            
            
        }
        .padding()
        .background(Color.white.clipShape(CustomCorner(corner: [.topLeft,.topRight], radi: 30)))
    }
}
let sizes = ["23","26","28","29","30"]


struct CustomCorner : Shape {
    var corner : UIRectCorner
    var radi : CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}
