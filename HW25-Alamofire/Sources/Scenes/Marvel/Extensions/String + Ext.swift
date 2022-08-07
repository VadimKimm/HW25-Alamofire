//
//  String + Ext.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 07.08.2022.
//

import Foundation
import CryptoKit

extension String {
    public func getMdFive() -> String  {
        return Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}

