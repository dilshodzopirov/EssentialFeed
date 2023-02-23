//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Dilshod Zopirov on 2/23/23.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
