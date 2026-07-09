//
//  PinningValidator.swift
//  NetworkSecurity
//
//  Created by Rushi on 09/07/26.
//

import Foundation
import Security

protocol PinningValidator {

    func validate(serverTrust: SecTrust) -> Bool
}
