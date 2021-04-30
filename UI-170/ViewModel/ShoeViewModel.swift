//
//  ShoeViewModel.swift
//  UI-170
//
//  Created by にゃんにゃん丸 on 2021/04/30.
//

import SwiftUI

class ShoeViewModel: ObservableObject {
    @Published var showCart = false
    
    @Published var selectedSize = ""
    
    @Published var startAnimation = false
    
    @Published var shoeAnimation = false
    
    @Published var showBag = false
    
    
    @Published var saveCart = false
    @Published var addItemtoCart = false
    @Published var endAnimation = false
    
    
    @Published var cartitems = 0
    
    func resetAll(){
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[self] in
            
            
            withAnimation{
                
                showCart.toggle()
            }
            
            startAnimation = false
            endAnimation = false
            shoeAnimation = false
            selectedSize = ""
            showBag = false
            saveCart = false
            addItemtoCart = false
            showCart = false
            
            cartitems += 1
            
        }
    
    
    }
    
    
    func performAnimation(){
        
        withAnimation(.easeOut(duration: 0.8)){
            
            shoeAnimation.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[self] in
            
            withAnimation(.easeInOut){
                
                showBag.toggle()
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {[self] in
            
            withAnimation(.easeInOut){
                
                saveCart.toggle()
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {[self] in
            
            withAnimation(.easeInOut){
                
                addItemtoCart.toggle()
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {[self] in
            
            withAnimation(.easeInOut){
                
                endAnimation.toggle()
            }
            
        }
        
        
    }
}

