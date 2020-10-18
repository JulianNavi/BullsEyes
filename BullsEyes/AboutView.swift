//
//  AboutView.swift
//  BullsEyes
//
//  Created by Dzulis on 2020-10-18.
//  Copyright © 2020 Dzulis. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let veryPaleOrange = Color(red: 255 / 255, green: 214 / 255, blue: 195 / 255)
    let slightlyDesaturatedBlue = Color(red: 120 / 255, green: 128 / 255, blue: 181 / 255)
    //255, 214, 195
    
    struct headerLabel: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .modifier(textColor())
                .font(Font.custom("Euphemia UCAS", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct paragraphLabel: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .modifier(textColor())
                .font(Font.custom("Euphemia UCAS", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    struct textColor: ViewModifier{
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
        }
    }
    
    var body: some View {
            VStack {
                Text("🤘 Bullseyes 🎯").modifier(headerLabel())
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.").modifier(paragraphLabel())
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.").modifier(paragraphLabel())
                Text("Fun with Bulleyes! 👁").modifier(paragraphLabel())
            }
            .navigationBarTitle("About BullsEyes")
            .background(veryPaleOrange)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 736, height: 414))
    }
}
