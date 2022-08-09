//
//  FinalView.swift
//  JustDo
//
//  Created by Michał Barnat on 08/08/2022.
//

import SwiftUI

struct FinalView: View {
    @StateObject var realmManager = RealmManager()
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Tasks :")
                    .font(.system(size: 40).bold())
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    content
                        .padding(.top, 10)
                }
                .padding(.horizontal)
                 
                
                BottomButtons()
                    .environmentObject(realmManager)
                
                
              
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.background)
    }
    
    var content: some View {
        ForEach(realmManager.tasks) { task in
            if !task.isInvalidated{
                TaskView(title: task.title, done: task.done)
                    .environmentObject(realmManager)
                    .onTapGesture {
                        realmManager.updateTasks(id: task.id, done: !task.done)
                    }
            }
            
            
        }
    }
    
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
