//
//  SlideTabButton.swift
//  UI-201
//
//  Created by にゃんにゃん丸 on 2021/05/22.
//

import SwiftUI

struct SlideTabButton: View {
    @Namespace var animation
    @Binding var selected : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.top,50)
            
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Lion King")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .opacity(0.5)
                    
                })
                
                
                VStack(alignment:.leading,spacing:0){
                    
                    
                    TabButton(image: "house.fill", title: "Home", selected: $selected, animation: animation)
                    
                    TabButton(image: "square.and.arrow.up.fill", title: "Download", selected: $selected, animation: animation)
                    
                    TabButton(image: "pencil", title: "Write", selected: $selected, animation: animation)
                    
                    TabButton(image: "paperplane", title: "Air", selected: $selected, animation: animation)
                    
                }
                .padding(.leading,-15)
                .padding(.top,50)
                
                
                Spacer(minLength: 30)
                
                
                VStack(spacing:10){
                    
                    
                    TabButton(image: "gear", title: "Settings", selected:.constant(""), animation: animation)
                    
                    
                     Text("Verison 1.2.3")
                        .font(.footnote)
                        .foregroundColor(.primary)
                        .opacity(0.5)
                }
                .padding(.leading,-15)
                .padding(.bottom,10)
                
                
                
            })
            
        
            
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
    }
}

struct SlideTabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton : View {
    var image : String
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View{
        
        Button(action: {
            
            withAnimation(.linear){
                
                selected = title
            }
            
        }, label: {
            HStack(spacing : 20){
                
                Image(systemName: image)
                    .font(.title)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.bold)
                
                
                
                
                
            }
            .foregroundColor(selected == title ? .primary : .white)
            .padding(.vertical,10)
            .padding(.horizontal,30)
            .frame(maxWidth: getRect().width - 180,alignment: .leading)
            .background(
            
            
                ZStack{
                    
                    
                    if selected  == title{
                        
                        Color.white.opacity(selected == title ? 1 : 0)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .clipShape(CustomShape(radi: 10, corner: [.topLeft,.bottomRight]))
                       
                        
                        
                        
                        
                    }
                    
                }
            
            )
            
        })
        
        
    }
}

struct CustomShape : Shape {
    var radi : CGFloat
    var corner : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}

