//
//  ListCellForExpensView.swift
//  MyFinance
//
//  Created by Антон Казеннов on 09.05.2023.
//

import SwiftUI

struct ListCellForExpensView: View {
    @State var item: Expens
    var body: some View {
        
       lazy var stringDate = {
            let date = item.time
            let formatter1 = DateFormatter()
           formatter1.dateStyle = .short
            return formatter1.string(from: date)
            
        }()
        HStack(alignment: .center, content: {
            Text(item.name)
            Spacer()
            Text(stringDate)
            Spacer()
            Text(String(item.count) + " P")
                .frame(width: 70)


        })
    }
}
