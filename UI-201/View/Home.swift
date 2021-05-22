//
//  Home.swift
//  UI-201
//
//  Created by にゃんにゃん丸 on 2021/05/22.
//

import SwiftUI

struct Home: View {
    @Binding var selected :String
    init(selected : Binding<String>) {
        self._selected = selected
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$selected){
            
            Color.green
                .ignoresSafeArea()
                .tag("Home")
            
            Color.red
                .ignoresSafeArea()
                .tag("Download")
            
            Color.purple
                .ignoresSafeArea()
                .tag("Write")
            
            Color.orange
                .ignoresSafeArea()
                .tag("Air")
            
            
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
