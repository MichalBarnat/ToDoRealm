//
//  TaskView.swift
//  JustDo
//
//  Created by Michał Barnat on 08/08/2022.
//

import SwiftUI

struct TaskView: View {
    var title: String
    var done: Bool
    var body: some View {
        HStack(spacing: 20) {
            Text(title)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            Image(systemName: done ? "face.dashed.fill" : "circle.dashed")
                .font(.system(size: 30))
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(done ? Colors.done : Colors.background)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 1)
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(title: "Trening", done: true)
    }
}
