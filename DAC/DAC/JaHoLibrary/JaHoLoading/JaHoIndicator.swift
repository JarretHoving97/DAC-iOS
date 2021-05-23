//
//  JaHoIndicator.swift
//  DAC
//
//  Created by Jarret hoving on 23/05/2021.
//

import SwiftUI

struct JaHoIndicator: View {
    @State var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.80)
                .stroke(Color("ThirdColor"), lineWidth: 15)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
            
            Text("Laden..")
                .foregroundColor(Color("ThirdColor"))
                .onAppear() {
                    withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false)) {
                        isLoading.toggle()
                    }
                }
            
        }
    }
}

struct JaHoIndicator_Previews: PreviewProvider {
    static var previews: some View {
        JaHoIndicator()
    }
}
