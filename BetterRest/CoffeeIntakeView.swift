//
//  CoffeeIntakeView.swift
//  BetterRest
//
//  Created by Jon Spight on 5/12/24.
//

import SwiftUI

struct CoffeeIntakeView: View {
    @Binding var coffeeAmount : Int
    var body: some View {
        Section("Daily Coffee intake"){
            Picker("^[\(coffeeAmount)](inflect : true) cup", selection: $coffeeAmount) {
                ForEach(1..<21) {
                    Text("\($0)")
                }
                
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.secondaryBlue)
            }
        }
    }
}

#Preview {
    CoffeeIntakeView(coffeeAmount: .constant(2))
}
