//
//  TempView.swift
//  S-Badge
//
//  Created by ram on 2023/08/14.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        VStack{
            SettingsView()
            PushTestView()
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
