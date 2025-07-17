//
//  JsonParserTests.swift
//  FindUserTests
//
//  Created by Donovan Z. Jaimes on 17/07/25.
//

import XCTest
@testable import FindUser

final class JsonParserTests: XCTestCase {

    var jsonParser: JsonParserProtocol!

    override func setUp() {
        super.setUp()
        jsonParser = UtilsJson()
    }

    override func tearDown() {
        jsonParser = nil
        super.tearDown()
    }

    func testParseJsonValidFile() {
        // Asume que tienes un archivo "UsersInfo.json" en tu bundle de pruebas
        let model: UsersInformation? = jsonParser.parseJson(jsonName: "UsersInfo", model: UsersInformation.self)
        XCTAssertNotNil(model, "El modelo debería no ser nulo.")
        XCTAssertTrue(model?.count ?? 0 > 0, "Debería haber al menos un usuario.")
    }

    func testParseJsonInvalidFile() {
        let model: UsersInformation? = jsonParser.parseJson(jsonName: "InvalidFile", model: UsersInformation.self)
        XCTAssertNil(model, "El modelo debería ser nulo si el archivo no existe.")
    }
}

