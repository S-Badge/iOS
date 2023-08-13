// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let kakaoAddressModel = try? JSONDecoder().decode(KakaoAddressModel.self, from: jsonData)

import Foundation

// MARK: - KakaoAddressModel
struct KakaoAddressModel: Codable {
    var meta: KAMeta?
    var documents: [KADocument]?
}

// MARK: - Document
struct KADocument: Codable {
    var roadAddress: RoadAddress?
    var address: Address?

    enum CodingKeys: String, CodingKey {
        case roadAddress = "road_address"
        case address
    }
}

// MARK: - Address
struct Address: Codable {
    var addressName, region1DepthName, region2DepthName, region3DepthName: String?
    var mountainYn, mainAddressNo, subAddressNo, zipCode: String?

    enum CodingKeys: String, CodingKey {
        case addressName = "address_name"
        case region1DepthName = "region_1depth_name"
        case region2DepthName = "region_2depth_name"
        case region3DepthName = "region_3depth_name"
        case mountainYn = "mountain_yn"
        case mainAddressNo = "main_address_no"
        case subAddressNo = "sub_address_no"
        case zipCode = "zip_code"
    }
}

// MARK: - RoadAddress
struct RoadAddress: Codable {
    var addressName, region1DepthName, region2DepthName, region3DepthName: String?
    var roadName, undergroundYn, mainBuildingNo, subBuildingNo: String?
    var buildingName, zoneNo: String?

    enum CodingKeys: String, CodingKey {
        case addressName = "address_name"
        case region1DepthName = "region_1depth_name"
        case region2DepthName = "region_2depth_name"
        case region3DepthName = "region_3depth_name"
        case roadName = "road_name"
        case undergroundYn = "underground_yn"
        case mainBuildingNo = "main_building_no"
        case subBuildingNo = "sub_building_no"
        case buildingName = "building_name"
        case zoneNo = "zone_no"
    }
}

// MARK: - Meta
struct KAMeta: Codable {
    var totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
    }
}
