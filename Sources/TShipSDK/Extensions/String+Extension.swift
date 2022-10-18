//
//  String+Extension.swift
//  Yummie
//
//  Created by Mohammed Adetunji on 13/10/2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
