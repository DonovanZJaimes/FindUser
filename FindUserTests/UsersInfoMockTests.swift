//
//  UsersInfoMockTests.swift
//  FindUserTests
//
//  Created by Donovan Z. Jaimes on 17/07/25.
//

import XCTest
@testable import FindUser

final class UsersInfoMockTests: XCTestCase {
    
    var usersInfoMock: UsersInfoMock!
    var jsonParser: JsonParserProtocol!

    override func setUp() {
        super.setUp()
        jsonParser = UtilsJson()
        usersInfoMock = UsersInfoMock(jsonParser: jsonParser)
    }

    override func tearDown() {
        usersInfoMock = nil
        jsonParser = nil
        super.tearDown()
    }

    func testGetUsersValidResponse() async {
        do {
            let users = try await usersInfoMock.getUsers()
            XCTAssertTrue(users.count > 0, "Deberían existir usuarios en la respuesta.")
        } catch {
            XCTFail("La carga de usuarios falló: \(error)")
        }
    }

}

