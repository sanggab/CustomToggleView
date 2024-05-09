import XCTest
@testable import CustomToggleView

final class CustomToggleViewTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        let viewModel: CustomToggleViewModel = .init()
        
        var model = viewModel(\.model)
        
        XCTAssertNotNil(model)
        
        model.spacing = 5
        
        XCTAssertTrue(model.spacing == 5)
        
        XCTAssertNotEqual(model, viewModel(\.model), "model은 struct State에 있기 때문에 값 타입이여서 원본에 영향 X")
    }
}
