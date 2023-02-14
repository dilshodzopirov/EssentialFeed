//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by dilshodzopirov on 13/02/23.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let (client, _) = makeSUT()

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url")
        
        let (client, sut) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    func test_load_requestsTwiceDataFromURL() {
        let url = URL(string: "https://a-given-url")
        
        let (client, sut) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    // Mark: - Helpers
    
    private func makeSUT(url: URL? = URL(string: "https://a-url.com")) -> (HTTPClientSpy, RemoteFeedLoader) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (client, sut)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        var requestedURLs: [URL?] = []
        
        func get(from url: URL?) {
            requestedURL = url
            requestedURLs.append(url)
        }
    }
}
