//
//  ContentView.swift
//  SwiftUIGridsSearch
//
//  Created by Apple on 1/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [
                    //GridItem(.fixed(100)),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                    GridItem(.flexible(minimum: 100, maximum: 200))
                ], spacing:12, content:{
                    
                    ForEach(0..<20, id: \.self) { num in
//                        HStack {
//                            Spacer()
//                            Text("\(num)")
//                            Spacer()
//                        }
//                        .padding()
//                        .background(Color.red)
                        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Spacer()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .background(Color.blue)
                            
                            Text("App Title")
                                .font(.system(size: 10, weight: .semibold))
                            Text("Release Date")
                                .font(.system(size: 9, weight: .regular))
                            Text("Copyright")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.white)
                        })
                        .padding()
                        .background(Color.red)
                    }
                }).padding(.horizontal, 12)
            }.navigationTitle("Grid Search")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
