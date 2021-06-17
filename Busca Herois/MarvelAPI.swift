//
//  MarvelAPI.swift
//  Busca Herois
//
//  Created by Bruno Ornelas on 17/06/21.
//

import Foundation
import SwiftHash
import Alamofire


class MarvelAPI {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters"
    static private let privateKey = "cb5fe30f437d2a0d62b018cc2bf5c42c71ceb5e1"
    static private let publicKey = "70e9ff8414e1c1285ea10893b8cb07fd"
    static private let limit = 50
    
    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping () -> Void) {
        let offset = page * limit
        let startWith: String
        if let name = name, !name.isEmpty {
            startWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startWith = ""
        }
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startWith + getCredentials()
        print(url)
        
        AF.request(url).responseJSON { (response) in
            guard let data = response.data, let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data), marvelInfo.code == 200 else {
                
                return
            }
           onComplete(marvelInfo)
        }
    }
    
    private class func getCredentials() -> String {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash\(hash)"
        
    }
    
}






