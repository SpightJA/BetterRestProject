//
//  SleepAmonutView.swift
//  BetterRest
//
//  Created by Jon Spight on 5/12/24.
//

import SwiftUI

struct SleepAmountView: View {
    @Binding var sleepAmount : Double
    var body: some View {
        Section("Daily amount of sleep"){
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12 ,step: 0.25)
                .padding()
            
                .overlay{
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.secondaryBlue)
                    
                }
        }
        .listRowBackground(Color.clear)
        
    }
}

#Preview {
    SleepAmountView(sleepAmount: .constant(3))
}
