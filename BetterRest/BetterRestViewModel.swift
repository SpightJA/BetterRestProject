//
//  BetterRestViewModel.swift
//  BetterRest
//
//  Created by Jon Spight on 4/25/24.
//


import SwiftUI
import CoreML


@Observable
class BetterRestViewModel {
    var wakeUp = defaultWakeupTime
    var coffeeAmount = 1
    var SleepHours = 8.0
    var alertTitle = ""
    var alertMessage = ""
    var showingAlert = false
    var idealSleep = ""
    static var defaultWakeupTime : Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    func CalculateSleep(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            //  you can dive deepr here
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 //converted to seconds
            let minute = (components.minute ?? 0) * 60 //converted to seconds
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: Double(SleepHours), coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            idealSleep = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }catch {
            showingAlert.toggle()
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
    }
}
