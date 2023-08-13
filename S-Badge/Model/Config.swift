//
//  Config.swift
//  S-Badge
//
//  Created by ram on 2023/08/14.
//

import Foundation
func makeStringKoreanEncoded(_ string: String) -> String {
    return string.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? string
}
