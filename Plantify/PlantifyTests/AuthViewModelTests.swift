import XCTest
import FirebaseAuth
//import FirebaseFirestore
@testable import Plantify 


class AuthViewModelTests: XCTestCase {
    
    var viewModel: AuthViewModel?
    
    @MainActor
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = AuthViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }
    @MainActor
    func testSignIn() {
        let email = "test@example.com"
        let password = "password123"
        
        // Create an expectation
        let expectation = XCTestExpectation(description: "Sign-in expectation")
        
        // Perform the sign-in operation asynchronously
        
        Task {
            do {
                // Arrange & Act
                try await viewModel?.signIn(withEmail: email, password: password)
                
                // Assert
                XCTAssertNotNil(viewModel?.userSession, "User session should not be nil after sign-in")
                
                // Fulfill the expectation
                expectation.fulfill()
            } catch {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5) // Adjust timeut as needed
    }
    
    @MainActor
    func testCreateUser() {
        let email = "test@example.com"
        let password = "password123"
        let fullName = "Test User"
        
        // Create an expectation
        let expectation = XCTestExpectation(description: "Create user expectation")
        
        // Perform the create user operation asynchronously
        Task {
            do {
                // Arrange & Act
                try await viewModel?.createUser(withEmail: email, password: password, fullName: fullName)
                
                // Assert
                XCTAssertNotNil(viewModel?.userSession, "User session should not be nil after creating user")
                XCTAssertNotNil(viewModel?.currentUser, "Current user should not be nil after creating user")
                XCTAssertEqual(viewModel?.currentUser?.email, email, "User email should match the provided email")
                XCTAssertEqual(viewModel?.currentUser?.fullName, fullName, "User fullName should match the provided fullName")
                
                // Fulfill the expectation
                expectation.fulfill()
            } catch {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5) // Adjust the timeout as needed
    }
    
    //signOut method test
    @MainActor
    func testSignOut() {
        // Create an expectation
        let expectation = XCTestExpectation(description: "Sign out expectation")
        
        // Perform the sign-out operation asynchronously
        Task {
            // Assume user is already signed in
            viewModel?.userSession = Auth.auth().currentUser // Simulate a signed-in user
            
            // Act
            viewModel?.signOut()
            
            // Assert
            XCTAssertNil(viewModel?.userSession, "User session should be nil after sign-out")
            XCTAssertNil(viewModel?.currentUser, "Current user should be nil after sign-out")
            
            // Fulfill the expectation
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5) // Adjust the timeout as needed
    }
    
    //Testing fetchUser method
    @MainActor
    func testFetchUser() {
        // Create a mock user ID for testing purposes
        let mockUserID = viewModel?.currentUser?.id
        
        // Create an expectation
        let expectation = XCTestExpectation(description: "Fetch user expectation")
        
        // Perform the fetch user operation asynchronously
        Task {
            // Simulate that the user is already signed in
            viewModel?.userSession = Auth.auth().currentUser // Set user session with mock user ID
            
            // Act
            await viewModel?.fetchUser()
            
            // Assert
            
            XCTAssertEqual(viewModel?.currentUser?.id, mockUserID, "User ID should match the mock user ID")
            
            // Fulfill the expectation
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5) // Adjust the timeout as needed
    }
    
    //Ensuring AuthViewModel initializes properly and maintains the correct initial state
    @MainActor
    func testInitialization() {
        //
        var viewModel: AuthViewModel?
        
        // Act & Assert
        Task {
            do {
                //
                viewModel = try await AuthViewModel()
                
                // Assert
                XCTAssertNotNil(viewModel, "ViewModel should not be nil after initialization")
                XCTAssertNil(viewModel?.userSession, "User session should be nil after initialization")
                XCTAssertNil(viewModel?.currentUser, "Current user should be nil after initialization")
            } catch {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    // ensures signIn method correctly handles edge cases and provides appropriate error messages for invalid input.
    func testEdgeCases() {
        // Empty email and password
        Task {
            do {
                // Arrange & Act
                try await viewModel?.signIn(withEmail: "", password: "")
                XCTFail("Should throw an error for empty email and password")
            } catch {
                // Assert
                XCTAssertEqual(error.localizedDescription, "The email address is badly formatted.")
            }
        }
        
        // Very long email and password
        Task {
            do {
                // Arrange & Act
                try await viewModel?.signIn(withEmail: String(repeating: "a", count: 1000), password: String(repeating: "b", count: 1000))
                XCTFail("Should throw an error for very long email and password")
            } catch {
                // Assert
                XCTAssertEqual(error.localizedDescription, "The email address is badly formatted.")
            }
        }
        
        // Invalid characters in email and password
        Task {
            do {
                // Arrange & Act
                try await viewModel?.signIn(withEmail: "invalid email@example.com", password: "invalid$password")
                XCTFail("Should throw an error for invalid characters in email and password")
            } catch {
                // Assert
                XCTAssertEqual(error.localizedDescription, "The email address is badly formatted.")
            }
        }
    }
    
}

