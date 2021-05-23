//
//  NewsView.swift
//  DAC
//
//  Created by Jarret hoving on 23/05/2021.
//

import SwiftUI

struct NewsView: View {
    @State var isLoading: Bool = false
    var newsItems = NewsFeed.shared.feed
    
    var body: some View {
    ScrollView {
            VStack(){
                HeaderView(newsItem: NewsFeed.shared.feed.first!)
                ForEach(newsItems, id: \.id) { item in
                      NewsItemView(item: item)
                }
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
