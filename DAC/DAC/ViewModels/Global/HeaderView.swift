//
//  HeaderView.swift
//  DAC
//
//  Created by Jarret hoving on 23/05/2021.
//

import SwiftUI

struct HeaderView: View {
    var newsItem: News
    
    var body: some View {
        ZStack(){
            VStack(alignment: .leading){
                Spacer()
                Text(newsItem.title)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                Text(newsItem.date)
                    .foregroundColor(Color("SecondairyColor"))
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.size.width, height: 280, alignment: .leading)
        .shadow(color: .black, radius: 20, x: 0, y: 0)
        .background(Image(newsItem.image)
                        .resizable()
                        .scaledToFill())
        

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(newsItem: NewsFeed.shared.feed.first!)
    }
}
