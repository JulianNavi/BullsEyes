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
    
    var body: some View{
        VStack {
            //target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            // slider row
            
            HStack{
                Text("1")
                Slider(value: .constant(10))
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
                    return Alert(title: Text("Hello!"), message: Text("My first pop-up!"), dismissButton: .default(Text("Osom!")))
                }
            
            //main info
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Text("Score:")
                 Text("999999")
                 Text("Round:")
                 Text("999")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 736, height:414))
    }
}
