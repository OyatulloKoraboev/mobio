//
//  SettingsView.swift
//  mobio
//
//  Created by Zekhniddin Jumaev on 19/06/23.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
}

struct SettingsView: View {

    @State var items: [Item] = [
        Item(name: "Узбекский язык", iconName: "globe"),
        Item(name: "Дневной статус", iconName: "bolt.circle.fill"),
        Item(name: "История расходов", iconName: "bolt.circle.fill"),
        Item(name: "О приложении", iconName: "info.circle.fill"),
        Item(name: "Условия публичной оферты", iconName: "info.circle.fill"),
        Item(name: "О нас", iconName: "info"),
        Item(name: "Поделитесь приложением", iconName: "square.and.arrow.up.circle.fill"),
    ]

    @State private var isToggled = false

    var body: some View {

        ScrollView {

            // MARK: - Header View
            VStack {
                
                ZStack {
                    Circle()
                        .frame(width: 120)
                        .foregroundColor(Color.pink)
                    Circle()
                        .frame(width: 117)
                        .foregroundColor(Color.white)
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 110))
                        .foregroundColor(Color.gray.opacity(0.6))

                }
                
                Text("Информация недоступна")
                    .font(.title2)
                    .bold()

                Text("Информация недоступна")
                    .font(.title3)
                    .foregroundColor(Color.primary)
            }
            .padding(.top, 30)

            // MARK: - Body View
            VStack {
                ForEach(items) { item in
                    if item.name == "Дневной статус" {
                        HStack {
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(10)
                                        .foregroundColor(Color(red: 239 / 255, green: 199 / 255, blue: 210 / 255))
                                    Image(systemName: item.iconName)
                                        .foregroundColor(Color.red)
                                }
                                Text(item.name)
                            }
                            Spacer()

                            Toggle("", isOn: $isToggled)
                        }
                        .padding()
                        .foregroundColor(Color.black)
                    } else {
                        Button {
                            print("Items = 0")
                        } label: {
                            HStack {
                                HStack {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(10)
                                            .foregroundColor(Color(red: 239 / 255, green: 199 / 255, blue: 210 / 255))
                                        Image(systemName: item.iconName)
                                            .foregroundColor(Color.red)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                    Text(item.name)
                                }
                                Spacer()

                                Image("Arrow")
                            }
                            .padding()
                            .foregroundColor(Color.black)
                        }
                    }

                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.red.opacity(0.25), radius: 5, x: 0, y: 2)
        .padding(20)

        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
