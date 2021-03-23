

import Foundation

struct WeathersApi: Decodable {
    let daily: [DEW]
    
}

struct DEW: Decodable {
    let dew_point: Double?
    
}



