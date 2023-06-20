//
//  GridView.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 20/06/23.
//

import SwiftUI

struct GridView: View {
    let data: [CircleItem] = [
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo"),
        CircleItem(title: "Test", image: "photo")
    ]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(data, id: \.self) { item in
                    VStack {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(item.title)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}


struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
