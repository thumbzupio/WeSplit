//
//  ContentView.swift
//  WeSplit
//
//  Created by Ingrid van den Berg on 19/06/2020.
//  Copyright © 2020 thumbzupio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var bill = ""
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        //calculate total perperson here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(bill) ?? 0
        
        let tipAmount = orderAmount / 100 * tipSelection
        let totalOrder = orderAmount + tipAmount
        let totalPerPerson = totalOrder / peopleCount
        return totalPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Bill Amount", text: $bill)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("% \(self.tipPercentages[$0])")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Your part of the bill is:")) {
                    Text("£\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
