

import SwiftUI

struct SidebarView: View {
    let sideBarMenu:[SidebarModel] = [
        SidebarModel(title: "Главное окно", icon: "house"),
        SidebarModel(title: "Департаменты", icon: "square.split.2x2.fill"),
        SidebarModel(title: "Избранное", icon: "heart"),
        SidebarModel(title: "Вопросы", icon: "questionmark.bubble"),
        SidebarModel(title: "Ветви", icon: "square.split.2x2.fill"),
        SidebarModel(title: "Настройки", icon: "gearshape"),
        
    ]
    @State private var isSideBarOpened:Bool = false
    @State var isAnimation:Bool = true
    
    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .leading,spacing: 20){
                HStack(spacing: 20){
                    Circle()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color.white)
                        .overlay {
                            ZStack{
                                Circle()
                                    .frame(width: 35,height: 35)
                                    .foregroundColor(Color(hex: "#D0D0D0"))
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    
                    VStack(alignment: .leading,spacing: 8){
                        Text("Информация не доступна")
                            .font(.montserratRegular(size:14))
                        Text("Информация не доступна")
                            .font(.montserratRegular(size:12))
                            .foregroundColor(.gray)
                    }
                    
                }
//              VStack(alignment: .leading,spacing: 20){
//                    ForEach(sideBarMenu, id: \.self){ item in
//                        HStack{
//                            Image(uiImage:item.icon)
//                            Text(item.title)
//
//                        }
//                    }
//                }
                ForEach(sideBarMenu,id: \.self){ item in
                    Button {
                    } label: {
                        HStack{
                            ZStack{
                                Image(systemName: "\(item.icon)")
                                    .foregroundColor(.gray)
                            }
                            Text(item.title)
                                .bold()
                                .font(.montserratRegular(size:16))
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            Spacer()
                        }.padding(.leading,5)
                    }
                }
                Spacer()
            }.padding(EdgeInsets(top: 60, leading: 10, bottom: 0, trailing: 0))
        }
    }
    
    
    struct SidebarView_Previews: PreviewProvider {
        static var previews: some View {
            SidebarView()
        }
    }
}
