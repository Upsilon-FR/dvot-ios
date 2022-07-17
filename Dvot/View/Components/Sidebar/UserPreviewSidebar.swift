//
//  UserPreviewSidebar.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI

struct UserPreviewSidebar: View {
    var body: some View {
        VStack {
            Text(ApiServices.USER!.lastName + " " + ApiServices.USER!.firstName)
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
            Text(ApiServices.USER!.mail)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            
        }
    }
}

struct UserPreviewSidebar_Previews: PreviewProvider {
    static var previews: some View {
        UserPreviewSidebar()
    }
}
