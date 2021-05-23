//
//  NewsItemView.swift
//  DAC
//
//  Created by Jarret hoving on 23/05/2021.
//

import SwiftUI

struct NewsItemView: View {
    var item: News
    
    var body: some View {
        ZStack(){
            
            VStack(alignment: .leading) {
                Spacer()
                Text(item.title)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text(item.date)
                    .foregroundColor(Color("SecondairyColor"))
            }
            .padding()
        }
    

        .frame(width: UIScreen.main.bounds.size.width - 20, height: 160, alignment: .leading)
        
        .background(
            Image(item.image)
                .resizable()
                .scaledToFill()
        )
        .border(Color("ThemeColor"), width: 4)
        .shadow(color: .black, radius: 20, x: 0, y: 0)
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        .padding(.top, 10)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(item: NewsFeed.shared.feed.first!)
    }
}
