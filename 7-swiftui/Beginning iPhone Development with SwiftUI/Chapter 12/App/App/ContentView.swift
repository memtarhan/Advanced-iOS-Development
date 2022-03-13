//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 13/03/2022.
//

import SwiftUI

// MARK: - Displaying an Alert/Action Sheet

/*
 An Alert/Action Sheet appears over an app’s user interface and can be customized by changing the following properties:
 Title – Text that appears at the top of the Alert/Action Sheet, often in bold and a large font size

 Message – Text that appears underneath the title in a smaller font size

 One or more Buttons – A Button that can dismiss the Alert/Action Sheet

 */
struct ContentView: View {
    @State var showAlert = false
    @State var showActionSheet = false

    var body: some View {
        VStack(spacing: 64) {
            Button("Show Alert") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning!"), message: Text("Zombies on the loose"), dismissButton: .default(Text("OK")))
            }

            Button("Show Action Sheet") {
                showActionSheet.toggle()
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Warning!"), message: Text("Zombies on the loose"), buttons: [.default(Text("OK")), .cancel(Text("Cancel"))])
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}