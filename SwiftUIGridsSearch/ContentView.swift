//
//  ContentView.swift
//  SwiftUIGridsSearch
//
//  Created by Apple on 1/2/21.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var vm = GridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [
                    //GridItem(.fixed(100)),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), alignment: .top)
                ], spacing:12, content: {
                    //vm.items //static data
                    ForEach(vm.results, id: \.self) { resp in
//                        HStack {
//                            Spacer()
//                            Text("\(num)")
//                            Spacer()
//                        }
//                        .padding()
//                        .background(Color.red)
                        VStack(alignment: .leading) {
                            Spacer()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .background(Color.blue)
                            
                            Text(resp.name)
                                .font(.system(size: 10, weight: .semibold))
                            Text(resp.releaseDate)
                                .font(.system(size: 9, weight: .regular))
                            Text(resp.copyright)
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        //.background(Color.red)
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
