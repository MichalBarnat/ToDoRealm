//
//  AddButton.swift
//  JustDo
//
//  Created by Michał Barnat on 08/08/2022.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Colors.background)
                .frame(height: 50)
                .shadow(radius: 4)
                .overlay(
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                    )
        }
        .frame(width: 50)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
