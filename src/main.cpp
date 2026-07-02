#include <iostream>
#include <string>
#include "HTTP_Client.hpp"

int main() {
    curl_global_init(CURL_GLOBAL_DEFAULT);

    HTTPClient client;
    std::string url = "https://example.com";
    std::string response = client.get(url);

    std::cout << "Requesting: " << url << std::endl;
    std::cout << "Response preview: " << response.substr(0, 120) << std::endl;

    curl_global_cleanup();
    return 0;
}