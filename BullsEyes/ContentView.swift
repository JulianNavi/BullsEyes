//
//  ContentView.swift
//  BullsEyes
//
//  Created by Dzulis on 2020-09-07.
//  Copyright © 2020 Dzulis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View{
        VStack {
            Spacer()
            
            //target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            // slider row
            
            Spacer()
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            //button row
            
                Button(action: {
                    print("Button clicked")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                        .fontWeight(.bold)
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    var roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello!"), message: Text("There slider's value is \(roundedValue)"), dismissButton: .default(Text("Osom!")))
                }
            Spacer()
            
            //main info
            
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 736, height:414))
    }
}
