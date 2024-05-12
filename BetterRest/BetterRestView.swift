//
//  ContentView.swift
//  BetterRest
//
//  Created by Jon Spight on 4/14/24.
//
import CoreML
import SwiftUI

struct BetterRestView: View {
    @State private var viewModel  = BetterRestViewModel()
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                VStack{
                    Form {
                        WakeUpView(wakeup: $viewModel.wakeUp)
                        SleepAmountView(sleepAmount: $viewModel.SleepHours)
                        CoffeeIntakeView(coffeeAmount: $viewModel.coffeeAmount)
                    }
                    .scrollContentBackground(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                    .frame(maxHeight: 420 )
                    Spacer()
                    BedTimeView(idealSleep: $viewModel.idealSleep)
                    
                    Spacer()
                    Spacer()
                }
                .navigationTitle("Better Rest")
                
                .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                    Button("Ok"){viewModel.showingAlert.toggle()}
                } message: {
                    Text(viewModel.alertMessage)
                }
            }
            .onChange(of: viewModel.SleepHours, initial: true) { _, _ in
                viewModel.CalculateSleep()
            }
            .onChange(of: viewModel.coffeeAmount, initial: true) { _, _ in
                viewModel.CalculateSleep()
            }
        }
    }
}

#Preview {
    BetterRestView()
}



