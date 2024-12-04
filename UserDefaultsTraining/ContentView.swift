//
//  ContentView.swift
//  UserDefaultsTraining
//
//  Created by Doğukan Akyüz on 2.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        Text("Appear Count: \(count)").font(.system(size: 50))
            .onAppear{
                let ud = UserDefaults.standard
                
                //Counter
                var c = ud.integer(forKey: "counter")
                c = c + 1
                
                ud.set(c, forKey: "counter")
                count = c
                
                //Save
                ud.set("John", forKey: "name")
                ud.set(23, forKey: "age")
                ud.set(1.78, forKey: "height")
                ud.set(true, forKey: "isMarried")
                
                let list = ["Apple", "Banana", "Orange"]
                ud.set(list, forKey: "fruits")
                
                let cities = ["06":"Ankara", "34":"Istanbul", "35":"İzmir"]
                ud.set(cities, forKey: "cities")
                
                //Delete
                //ud.removeObject(forKey: "name")
                
                //Read
                let name = ud.string(forKey: "name") ?? "No Name"
                let age = ud.integer(forKey: "age")
                let height = ud.double(forKey: "height")
                let isMarried = ud.bool(forKey: "isMarried")
                let fruitList = ud.array(forKey: "fruits") ?? [String]()
                let citiesList = ud.dictionary(forKey: "cities") ?? [String:String]()
                
                
                print("Name : \(name)")
                print("Age : \(age)")
                print("Height : \(height)")
                print("Is Married : \(isMarried)")
                print("Fruits : \(fruitList)")
                
                for a in fruitList {
                    print("Fruits :\(a)")
                }
                
                for(key,value) in citiesList {
                    print("City: \(key) -> \(value)")
                }
            }
    }
}

#Preview {
    ContentView()
}
