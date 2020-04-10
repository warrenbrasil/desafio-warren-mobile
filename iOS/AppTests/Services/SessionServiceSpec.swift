//
//  SessionServiceSpec.swift
//  AppTests
//
//  Created by Alessandro Garcez on 10/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

@testable import Warren
import Quick
import Nimble

final class SessionServiceSpec: QuickSpec {
    
    override func spec() {
        
        describe("Session service spec") {
            
            var service: SessionService!
            var localService: SessionStoringMock!
            var remoteService: SessionRemoteServiceMock!
            
            context("When there is no stored session") {
                
                beforeEach {
                    localService = .init()
                    remoteService = .init()
                    service = .init(remoteService: remoteService, localStorageService: localService)
                }
                
                context("When the signing in succeeds") {
                    
                    var lastsuccededResult = false
                    
                    beforeEach {
                        lastsuccededResult = false
                        let session = Session(accessToken: "AB", refreshToken: "CD")
                        remoteService.mockedResult = .success(session)
                        
                        service.login(email: "alessandro.garcez@gmail.com",
                        password: "some pass",
                        completion: { lastsuccededResult = $0 })
                    }
                    
                    it("Should return true") {
                        expect(lastsuccededResult).toEventually(beTrue())
                    }
                    
                    it("Should store the session object properly") {
                        let sessionToMatch = Session(accessToken: "AB", refreshToken: "CD")
                        expect(localService.localSession).to(equal(sessionToMatch))
                    }
                }
                
                context("When the signing in fails") {
                    
                    var lastsuccededResult = true
                    
                    beforeEach {
                        lastsuccededResult = true
                        remoteService.mockedResult = .failure(AnyError())
                        
                        service.login(email: "alessandro.garcez@gmail.com",
                        password: "some pass",
                        completion: { lastsuccededResult = $0 })
                    }
                    
                    it("Should return false") {
                        expect(lastsuccededResult).toEventually(beFalse())
                    }
                }
            }
            
            context("When there is stored session") {
            
                beforeEach {
                    localService = .init()
                    remoteService = .init()
                    localService.localSession = .init(accessToken: "AT", refreshToken: "RT")
                    
                }
                
                context("When initializing the service") {
                    
                    beforeEach {
                        service = .init(remoteService: remoteService, localStorageService: localService)
                    }
                    
                    it("It should load the current stored session") {
                        let expected = Session(accessToken: "AT", refreshToken: "RT")
                        expect(service.session).to(equal(expected))
                    }
                    
                }
            }
        }
    }
}
