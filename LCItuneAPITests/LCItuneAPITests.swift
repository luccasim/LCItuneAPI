//
//  LCItuneAPITests.swift
//  LCItuneAPITests
//
//  Created by owee on 06/10/2020.
//

import XCTest
@testable import LCItuneAPI

class LCItuneAPITests: XCTestCase {

    func testMovieTask() throws {
        
        let ws = LCItunesAPI(Session: .shared)
        let exp = expectation(description: "testMovieTask")
        
        ws.taskMovie(Term: "Avengers") { (res) in
            switch res {
            case .success(let rep): print(rep)
            case .failure(let err): XCTFail(err.localizedDescription)
            }
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 30) {error in}
    }
    
    func testMovieReponse() throws {
        
        let bundle = Bundle.init(identifier: "fr.devios.LCItuneAPI")
        let url = bundle?.url(forResource: "movie.json", withExtension: nil)!
        let data = try Data(contentsOf: url!)
        
        let reponse = try JSONDecoder().decode(LCItunesAPI.MovieReponse.self, from: data)
        
        reponse.results.forEach({res in
            print(res.previewURL)
        })
    }
}
