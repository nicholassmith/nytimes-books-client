import ballerina/io;
import ballerina/log;
import ballerinax/nytimes.books as books;

public function main() returns error? {

    books:ApiKeysConfig config = {
        apiKey: "<API_KEY>"
    };

    books:Client baseClient = check new books:Client(config);

    books:InlineResponse200 listsBestSellersHistoryJson = check baseClient->getListsFormat("json");
    if (listsBestSellersHistoryJson is books:InlineResponse200) {
        books:InlineResponse200Results[]? Results = listsBestSellersHistoryJson?.results;
        if !(Results is ()) {
            foreach var result in Results {
                log:printInfo(result.toString() + "\n");
            }
        }
    }

    io:println("Hello, World!");
}
