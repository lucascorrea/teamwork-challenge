//
//  Global.swift
//  Teamwork
//
//  Created by Lucas Correa on 14/09/2017.
//  Copyright © 2017 SiriusCode. All rights reserved.
//

import Foundation

class Global {
    internal static var dateFormatter: DateFormatter = DateFormatter()
    internal static var authenticate: String = "Basic eWF0QHRyaXBsZXNwaW4uY29tOnlhdHlhdHlhdDI3"
}

func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
