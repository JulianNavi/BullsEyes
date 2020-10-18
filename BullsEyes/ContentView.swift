//
//  ContentView.swift
//  BullsEyes
//
//  Created by Dzulis on 2020-09-07.
//  Copyright © 2020 Dzulis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let slightlyDesaturatedBlue = Color(red: 120 / 255, green: 128 / 255, blue: 181 / 255)
    
    struct styleLabel: ViewModifier {
        func body(content: Content) -> some View{
            return content
            .foregroundColor(Color.white)
            .modifier(shadowStyle())
            .font(Font.custom("Euphemia UCAS", size: 18))
        }
        
    }
    
    struct valueLabel: ViewModifier {
        func body(content: Content) -> some View{
            return content
            .foregroundColor(Color.yellow)
            .modifier(shadowStyle())
            .font(Font.custom("Euphemia UCAS", size: 24))
        }
        
    }
  
    struct shadowStyle: ViewModifier {
              func body(content: Content) -> some View{
                  return content
                  .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
              
    }
    
    struct buttonLargeLabelStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Euphemia UCAS", size: 18))
        }
        
    }
    
    struct buttonSmallLabelStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Euphemia UCAS", size: 12))
        }
        
    }
    
    var body: some View{
        VStack {
            Spacer()
            
            //target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(styleLabel())
                Text("\(target)").modifier(valueLabel())
            }
            // slider row
            
            Spacer()
            HStack{
                Text("1").modifier(styleLabel())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(styleLabel())
            }
            //button row
            
                Button(action: {
                    print("Button clicked")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                    }.modifier(buttonLargeLabelStyle())
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    return Alert(title: Text(alertTitle()), message: Text(
                        "There slider's value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points in this round."), dismissButton: .default(Text("Osom!")) {
                            self.score = self.score + self.pointsForCurrentRound()
                            self.target = Int.random(in: 1...100)
                            self.round = self.round + 1
                        })
                    }.background(Image("Button")).modifier(shadowStyle())
            Spacer()
            
            //main info
            
            HStack{
                Button(action: {
                    self.startNewGame()
                }) {
                    HStack {
                    Image("StartOverIcon").accentColor(slightlyDesaturatedBlue)
                    Text("Start over").modifier(buttonSmallLabelStyle())
                    }
                }.background(Image("Button")).modifier(shadowStyle())
                
                Spacer()
                Text("Score:").modifier(styleLabel())
                Text("\(score)").modifier(valueLabel())
                Spacer()
                Text("Round:").modifier(styleLabel())
                Text("\(round)").modifier(valueLabel())
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    HStack {
                    Image("InfoIcon").accentColor(slightlyDesaturatedBlue)
                    Text("Info").modifier(buttonSmallLabelStyle())
                    }
                    
                }.background(Image("Button")).modifier(shadowStyle())
            }
            .padding(.bottom, 20)
        }
        .background(slightlyDesaturatedBlue)
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = amountOff()
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maxScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        
        if difference == 0 {
            title = "Perfect!!"
        } else if difference < 5 {
            title = "You almost got it!"
        } else if difference <= 10 {
            title = "Good job!"
        } else {
            title = "Try again :("
        }
        return title
    }
    
    func startNewGame(){
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 736, height:414))
    }
}
