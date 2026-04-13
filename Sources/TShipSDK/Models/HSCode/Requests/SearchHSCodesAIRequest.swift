//
//  SearchHSCodesAIRequest.swift
//
//

public class SearchHSCodesAIRequest: Encodable {

    public let description: String

    public init(description: String) {
        self.description = description
    }

}
