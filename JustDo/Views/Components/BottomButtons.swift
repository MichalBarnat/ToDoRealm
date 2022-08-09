//
//  BottomButtons.swift
//  JustDo
//
//  Created by Michał Barnat on 08/08/2022.
//

import SwiftUI

struct BottomButtons: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var showAdd = false
    @State private var newItemTitle = ""
    var body: some View {
        HStack {
            Button {
                realmManager.deleteAllDone()
            } label: {
                Text("Delete all done")
                    .font(.system(size: 25)).bold()
                    .foregroundColor(.red)
            }

                
                
            Spacer()
            AddButton()
                .onTapGesture {
                    showAdd.toggle()
                }
                .alert("Add new item", isPresented: $showAdd) {
                    TextField("new item", text: $newItemTitle)
                    Button("Add", role: .cancel) {
                        if newItemTitle != "" {
                            realmManager.addTask(title: newItemTitle)
                            newItemTitle = ""
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct BottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtons()
            .environmentObject(RealmManager())
    }
}
