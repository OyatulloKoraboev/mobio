//
//  CircleGridView.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 20/06/23.
//

import SwiftUI

struct CircleGridView: View {
    
    let data:[GridProduct] = [
        GridProduct(title: "Тайтл", image: "photo"),
        GridProduct(title: "Аксессуры", image: "photo"),
        GridProduct(title: "Портативные", image: "photo"),
        GridProduct(title: "Точки Доступа", image: "photo"),
        GridProduct(title: "Сетевое Оборудования", image: "photo"),
        GridProduct(title: "Точки Доступа", image: "photo"),
        GridProduct(title: "Портативные", image: "photo"),
        GridProduct(title: "Сетевое ОборудованияТайтл", image: "photo"),
    ]
    
    var body: some View {
        VStack{
            HStack{
                Text("Департаменты")
                    .bold()
                Spacer()
                Button(action: {
                    print("Увидить все  >")
                }, label: {
                    Text("Увидить все  >")
                        .foregroundColor(.pink)
                        .font(.callout)
                })
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 10){
                    Spacer()
                    ForEach(data, id: \.self){ item in
                        VStack{
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(item.title)
                            
                                .font(.montserratRegular(size:12))
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .frame(width: 60)
                            
                        }
                    }
                }
            }
            
        }
    }
}

struct CircleGridView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGridView()
    }
}
