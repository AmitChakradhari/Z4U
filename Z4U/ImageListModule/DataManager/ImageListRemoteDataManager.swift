//
//  ImageListRemoteDataManager.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

class ImageListRemoteDataManager: ImageListRemoteDataManagerProtocol {
    var remoteDataHandler: ImageListResponseHandlerProtocol?
    
    func retrieveImageList(for text: String) {
        _ = RxAlamofire.request(ApiRouter.getImages(text))
            .responseData()
            .expectingObject(ofType: ImageList.self)
            .subscribe(onNext: { [weak self] result in
                switch result {
                case .success(let imageObject):
                    self?.remoteDataHandler?.onRetrievedImages(imageObject)
                case .failure(let error):
                    print(error, "error")
                }
        }, onError: {  error in
            print(error, "error")
        })
    }
}

enum ApiRouter: URLRequestConvertible {
    
    case getImages(String)
    
    var baseUrl: String {
        switch self {
        case .getImages:
            return "https://en.wikipedia.org"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImages:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getImages:
            return "/w/api.php"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getImages(let text):
            return [
                "action": "query",
                "prop":"pageimages",
                "format":"json",
                "piprop":"thumbnail",
                "pithumbsize":200,
                "pilimit":50,
                "generator":"prefixsearch",
                "gpssearch":text
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

extension Observable where Element == (HTTPURLResponse, Data){
    func expectingObject<T : Codable>(ofType type: T.Type) -> Observable< Result<T, Error>>{
        return self.map { (httpURLResponse, data) -> Result<T, Error> in
            if 200 ... 299 ~= httpURLResponse.statusCode {
                do {
                    let object = try JSONDecoder().decode(type, from: data)
                    return .success(object)
                } catch let error {
                    return .failure(error)
                }
            } else {
                return .failure("unexpected error" as! Error)
            }
        }
    }
}

