#include "HTTP_Client.hpp"

HTTPClient::HTTPClient() {
    curl_ = curl_easy_init();
}

HTTPClient::~HTTPClient() {
    if (curl_) {
        curl_easy_cleanup(curl_);
    } 
}

std::string HTTPClient::get(const std::string& url) {
    std::string response;
    if (!curl_) {
        return response;
    }

    curl_easy_reset(curl_);
    curl_easy_setopt(curl_, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl_, CURLOPT_WRITEFUNCTION, &HTTPClient::WriteCallback);
    curl_easy_setopt(curl_, CURLOPT_WRITEDATA, &response);
    curl_easy_perform(curl_);
    return response;
}

size_t HTTPClient::WriteCallback(void* contents, size_t size, size_t nmemb, void* userdata) {
    std::string* response = static_cast<std::string*>(userdata);
    response->append(static_cast<char*>(contents), size*nmemb);
    return size*nmemb;
}