#ifndef HTTP_CLIENT_HPP
#define HTTP_CLIENT_HPP

#include <curl/curl.h>
#include <string>

class HTTPClient {
public:
    HTTPClient();
    ~HTTPClient();

    std::string get(const std::string& url);

private:
    CURL* curl_;
    static size_t WriteCallback(void* content, size_t size, size_t nmemb, void* userdata);
};

#endif
