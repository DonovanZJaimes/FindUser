//
//  UserSearchViewModelTests.swift
//  FindUserTests
//
//  Created by Donovan Z. Jaimes on 17/07/25.
//

import XCTest
@testable import FindUser

@MainActor
final class UserSearchViewModelTests: XCTestCase {
    
    var viewModel: UserSearchViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = UserSearchViewModel()
        let mockUsers: [UserInfo] = [
            UserInfo(name: "Juan Pérez", email: "juan@email.com", address: "Dirección 1", phone: "12345"),
            UserInfo(name: "Carlos López", email: "carlos@email.com", address: "Dirección 2", phone: "67890")
        ]
        
        viewModel.allUsers = mockUsers
        
        
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFilterUsersValidSearch() {
        // Create an expectation to wait for filterUsers to finish its execution
        let expectation = self.expectation(description: "Esperando que filterUsers termine")

        viewModel.userSearched = "Juan"

        viewModel.filterUsers()

        // We put a wait in the asynchronous block, we notify when the filter is finished.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }

        // We wait for the test to finish filterUsers execution.
        wait(for: [expectation], timeout: 2)

       
        XCTAssertNotNil(viewModel.usersInfo, "usersInfo no debería ser nil.")
        XCTAssertEqual(viewModel.usersInfo.count, 1, "Debería haber 1 usuario encontrado.")
        
       
        if let firstUser = viewModel.usersInfo.first {
            XCTAssertEqual(firstUser.name, "Juan Pérez", "El nombre del usuario debería ser 'Juan Pérez'.")
        } else {
            XCTFail("No se encontraron usuarios.")
        }
    }


    func testFilterUsersEmptySearch() {
        viewModel.userSearched = ""
        viewModel.filterUsers()
        
        XCTAssertEqual(viewModel.usersInfo.count, 0, "No debería haber usuarios cuando la búsqueda está vacía.")
    }

    func testFilterUsersNoResults() {
        viewModel.userSearched = "Ana"
        viewModel.filterUsers()
        
        XCTAssertEqual(viewModel.usersInfo.count, 0, "No deberían encontrarse usuarios si no hay coincidencias.")
    }
}

