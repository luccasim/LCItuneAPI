#  LCItunesAPI

Connect to [itunes.apple.com/search](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/)

## Services

### Movie

``` swift

let ws = ItunesAPI(Session: .shared)
let exp = expectation(description: "testMovieTask")

ws.taskMovie(Term: "Avengers") { (res) in
    switch res {
    case .success(let rep): print(rep)
    case .failure(let err): XCTFail(err.localizedDescription)
    }
    exp.fulfill()
}

```
