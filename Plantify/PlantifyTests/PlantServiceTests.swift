//
//  PlantServiceTests.swift
//  PlantifyTests
//
//  Created by Ahmednur Mahamud on 2024-03-13.
//
import XCTest
@testable import Plantify

class PlantServiceTests: XCTestCase {
    
    var plantService: PlantService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        plantService = PlantService()
    }
    
    override func tearDownWithError() throws {
        plantService = nil
        try super.tearDownWithError()
    }
    //a
    func testFetchPlants() {
        // Create an expectation to wait for async call
        let expectation = XCTestExpectation(description: "Fetch plants data")
        
        // Call the fetchPlants method
        Task {
            do {
                let plantResponse = try await plantService.fetchPlants()
                XCTAssertNotNil(plantResponse, "Plant response should not be nil")
                // Additional assertions if needed
                expectation.fulfill()
            } catch {
                XCTFail("Error occurred while fetching plants: \(error.localizedDescription)")
            }
        }
        // Wait for expectation
//        await self.fulfillment(of: [expectation], timeout: 200.0, enforceOrder: true)
    }

 
    func testFetchPlantsDescription_success() async {
      let expectation = self.expectation(description: "Waiting for network response")
      let service = PlantService() // Create instance of PlantService

      do {
        // Call fetchPlantsDescription and await the result
        let description = try await service.fetchPlantsDescription(for: 123)
        XCTAssertNotNil(description) // Assert description is not nil
        // Further assertions on the fetched description content
      } catch {
        XCTFail("Error fetching plant description: \(error)")
      }
      expectation.fulfill()
      await self.fulfillment(of: [expectation], timeout: 200.0, enforceOrder: true) // Increased timeout
    }
    
    
    func testFetchPlantsDescription_invalidURL() async throws {
      let expectation = self.expectation(description: "Waiting for error response")
      let service = PlantService()

      do {
        _ = try await service.fetchPlantsDescription(for: 9999)
        XCTFail("Expected an error for invalid plant ID")
      } catch let err as NSError {
            XCTAssertTrue(err.domain == "") // Assert error domain if needed
            XCTAssertEqual(err.code, 500) // Assert error code
      }

      expectation.fulfill()
      await self.fulfillment(of: [expectation], timeout: 200.0, enforceOrder: true)
    }

    func testFetchPlantsDescription_serverError() async throws {
      let expectation = self.expectation(description: "Waiting for server error response")
      let service = PlantService()

      do {
        _ = try await service.fetchPlantsDescription(for: 12345) // Assuming a non-existent plant ID
      } catch  let err as NSError {
          XCTAssertTrue(err.domain == "") // Assert error type
        XCTAssertEqual(err.code, 500) // Assert expected error code for server error
      }

      expectation.fulfill()
      await self.fulfillment(of: [expectation], timeout: 200.0, enforceOrder: true)
    }
    
}
 


