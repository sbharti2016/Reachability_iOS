//
//  NetworkMonitor.swift
//  Reachability
//
//  Created by Sanjeev Bharti on 10/28/23.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    // Monitor provides network status update
    private var monitor = NWPathMonitor()
    
    // Queue on which to deliver path events
    private var queue = DispatchQueue(label: "Network Monitor")
    
    // Publish the network changes
    @Published var isNotConnected: Bool = false
    
    init() {
        
        // pathUpdateHandler: A handler that receives network path updates.
        monitor.pathUpdateHandler = { path in
            
            // Monitor runs on a background thread so we need to publish on the main thread
            DispatchQueue.main.async {
                print(path.status == .satisfied ? "Connected" : "Not Connected")
                self.isNotConnected = path.status == .satisfied ? false : true
            }
        }
        
        // Starts monitoring path changes, and sets a queue on which to deliver path events.
        monitor.start(queue: queue)
    }
}
