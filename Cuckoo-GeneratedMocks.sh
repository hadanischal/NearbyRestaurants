#!/bin/sh

# Define output file. Change "$PROJECT_DIR/Tests" to your test's root source folder, if it's not the default name.
PROJECT_DIR="."
PODS_ROOT="$PROJECT_DIR/Pods"
OUTPUT_FILE="$PROJECT_DIR/NearbyRestaurantsTests/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "$PROJECT_DIR" to your project's root source folder, if it's not the default name.
INPUT_DIR="$PROJECT_DIR/NearbyRestaurants"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
${PODS_ROOT}/Cuckoo/run generate --testable "NearbyRestaurants" \
--output "${OUTPUT_FILE}" \
"${INPUT_DIR}/NetworkLayer/Core/WebServiceProtocol.swift" \
"${INPUT_DIR}/NetworkLayer/Services/RestaurantNetworkHandler.swift" \
"${INPUT_DIR}/ViewModel/RestaurantList/RestaurantListRepository.swift" \
"${INPUT_DIR}/Utility/Connectivity.swift" \
"${INPUT_DIR}/Utility/LocationService/LocationServiceHandler.swift"


# ... and so forth
