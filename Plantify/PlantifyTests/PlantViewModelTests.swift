//
//  PlantViewModelTests.swift
//  PlantifyTests
//
//  Created by Ahmednur Mahamud on 2024-03-13.
//


import XCTest
import Combine
@testable import Plantify
import SwiftData

class PlantViewModelTests: XCTestCase {
    
    private var viewModel: PlantViewModel!
    private var mockModelContext: ModelContext!
    private var mockService: PlantService!
    private var mockObservable: CurrentValueSubject<[PlantData], Never>!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        viewModel = PlantViewModel(modelContext: mockModelContext)
        mockObservable = CurrentValueSubject<[PlantData], Never>([])
        cancellables = Set<AnyCancellable>()
    }
    
    
    func testToggleFavourite() {
        
        let plantId = 1
        var expectedFavouritePlants: [FavouritePlant] {
            get { viewModel.favouritePlants }
            set { viewModel.favouritePlants = newValue }
        }
        
      
        viewModel.toggleFavourite(for: plantId)
        
  
        XCTAssertTrue(expectedFavouritePlants.contains(where: { $0.id == plantId }))
    }

    
    func testIsFavourite() {
        // Given
        let plantId = 1
        let favouritePlant = FavouritePlant(id: plantId)
        var expectedFavouritePlants: [FavouritePlant] {
            get { viewModel.favouritePlants }
            set { viewModel.favouritePlants = newValue }
        }
        expectedFavouritePlants = [favouritePlant]
        
        
        let isFavourite = viewModel.isFavourite(plantId)
        
        
        XCTAssertTrue(isFavourite)
    }
    
    func testFetchFromPersistence() {
        
        let plantId = 1
        let favouritePlant = FavouritePlant(id: plantId)
        
      
        viewModel.fetchFromPersistence()
        
        // Then
        XCTAssertEqual(viewModel.favouritePlants, [favouritePlant])
    }
    
    func testAddToCart() {
        
        let plantId = 1
        let cartItem = CartItem(quantity: 1, id: plantId)
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        
        
        viewModel.addToCart(for: plantId)
        
        // Then
        XCTAssertTrue(expectedPlantsInCart.contains(cartItem))
    }
    
    func testClearCart() {
        
        let plantId = 1
        let cartItem = CartItem(quantity: 1, id: plantId)
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        expectedPlantsInCart = [cartItem]
        
        
        viewModel.clearCart()
        
       
        XCTAssertTrue(expectedPlantsInCart.isEmpty)
    }
    
    func testRemoveFromCart() {
       
        let plantId = 1
        let cartItem = CartItem(quantity: 1, id: plantId)
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        expectedPlantsInCart = [cartItem]
        
        // When
        viewModel.removeFromCart(for: plantId)
        
        // Then
        XCTAssertFalse(expectedPlantsInCart.contains(cartItem))
    }
    
    func testIncreaseQuantity() {
        // Given
        let plantId = 1
        let cartItem = CartItem(quantity: 1, id: plantId)
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        expectedPlantsInCart = [cartItem]
        
        // When
        viewModel.increaseQuantity(for: plantId)
        
        // Then
        XCTAssertEqual(expectedPlantsInCart.first?.quantity, 2)
    }
    
    func testDecreaseQuantity() {
        // Given
        let plantId = 1
        let cartItem = CartItem(quantity: 2, id: plantId)
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        expectedPlantsInCart = [cartItem]
        
        // When
        viewModel.decreaseQuantity(for: plantId)
        
        // Then
        XCTAssertEqual(expectedPlantsInCart.first?.quantity, 1)
        
        // When
        viewModel.decreaseQuantity(for: plantId)
        
        // Then
        XCTAssertTrue(expectedPlantsInCart.isEmpty)
    }
    
    func testGetQuantity() {
        // Given
        let plantId = 1
        let cartItem = CartItem(quantity: 2, id: plantId)
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        expectedPlantsInCart = [cartItem]
        
        // When
        let quantity = viewModel.getQuantity(for: plantId)
        
        // Then
        XCTAssertEqual(quantity, 2)
    }
    
    func testTotalQuantity() {
        // Given
        let cartItems = [CartItem(quantity: 1, id: 1), CartItem(quantity: 2, id: 2)]
        var expectedPlantsInCart: [CartItem] {
            get { viewModel.plantsInCart }
            set { viewModel.plantsInCart = newValue }
        }
        expectedPlantsInCart = cartItems
        
        // When
        let totalQuantity = viewModel.totalQuantity()
        
        // Then
        XCTAssertEqual(totalQuantity, 3)
    }
    
}




    



