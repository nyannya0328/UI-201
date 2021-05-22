//
//  MainView.swift
//  UI-201
//
//  Created by にゃんにゃん丸 on 2021/05/22.
//

import SwiftUI
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct MainView: View {
    
    @State var selected = "Home"
    @State var show = false
    var body: some View {
        ZStack{
            
            Color.blue
                .ignoresSafeArea()
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                SlideTabButton(selected: $selected)
            })
            
            ZStack{
                
                Color.white.opacity(0.7)
                    .cornerRadius(show ? 15 : 0)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y: 5)
                    .offset(x: show ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.red.opacity(0.7)
                    .cornerRadius(show ? 15 : 0)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y: 5)
                    .offset(x: show ? -50 : 0)
                    .padding(.vertical,60)
                
                Color.purple.opacity(0.7)
                    .cornerRadius(show ? 15 : 0)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y: 5)
                    .offset(x: show ? -75 : 0)
                    .padding(.vertical,90)
                
                
                Color.orange.opacity(0.7)
                    .cornerRadius(show ? 15 : 0)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y: 5)
                    .offset(x: show ? -100 : 0)
                    .padding(.vertical,120)
                
                Home(selected: $selected)
                    .cornerRadius(show ? 15 : 0)
                    
            }
            .scaleEffect(show ? 0.86 : 1)
            .offset(x: show ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
            
                Button(action: {
                    
                    withAnimation{
                        
                        show.toggle()
                    }
                    
                }, label: {
                    VStack(spacing:5){
                        
                        Capsule()
                            .fill(show ? Color.white : Color.primary)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.init(degrees: show ? -50 : 0))
                            .offset(x: show ? 2 : 0, y: show ? 9 : 0)
                        
                        
                        VStack(spacing:5){
                            
                            Capsule()
                                .fill(show ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                            
                            Capsule()
                                .fill(show ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                                .offset(y: show ? -8 : 0)
                            
                            
                        }
                        .rotationEffect(.init(degrees: show ? 50 : 0))
                    }
                    .padding()
                    
                })
                ,alignment: .topLeading
            
            )
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

