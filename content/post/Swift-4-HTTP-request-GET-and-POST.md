---
title: "Swift 4 HTTP Request GET and POST"
date: 2018-05-24T20:35:56+08:00
draft: false
categories: [Networking]
tags: [Networking, Swift, RESTAPI]
slug: Swift-4-HTTP-Request-GET-and-POST
gitment: true
---

## Some Summury

Using the portfolio  

* `URL`  
* `URLRequest`  
* `URLSession`  
* `URLSession.datatask(URLSessionDataTask)` which take `URLRequest` and `CompletionHandler` as input  

Building your HTTP request step by step really make one know what he is  doing.  

Also DO NOT USE (before you are ready)

* `content of` while using GET. Using datatask will make GET and POST more similar.    
* `URLSession.datatask(URLSessionDataTask)` which take `URL` only as input. Should build your session step by step.


## GET code

Please note this is for GET HTML and convert to string. For those GET a json you could still use the most of request.

```
@IBAction func button2_onclick(_ sender: Any) {

//Set GET url string
let get_url_string: String = "https://www.google.com"

//Set Get url
guard let get_url = URL(string: get_url_string) else {
    print("Error: cannot create login URL")
    return
}

//Set Request and Method
var get_request = URLRequest(url: get_url)
get_request.httpMethod = "GET"

//Set your session to main thread
let session = URLSession.shared

//Task start
let task = session.dataTask(with: get_request) { (data, response, error) in
    guard error == nil else {
        print("error calling GET URLSession datatask")
        print(error!.localizedDescription)
        return
    }
    
    guard let _ = response else {
        return
    }
    
    guard let data_string : String = String(data: data!, encoding: .utf8) else {
        print("Converting Data GET from request to string error")
        return
    }
    print(data_string)
    //Parse your data here
}
task.resume();
}
```

## POST code

This is a `application/x-www-form-urlencoded` version. 

```
@IBAction func button2_onclick(_ sender: Any) {

//Set POST url string
let post_url_string: String = "https://your_post_url"

//Set POST url
guard let post_url = URL(string : post_url_string) else {
    print("Error: cannot post URL")
    return
}

//Set POST Request
var post_request = URLRequest(url: post_url)
post_request.httpMethod = "POST"
post_request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
post_request.httpBody =("action=check&usermac="+String(my_mac_address)+"&userip="+String(my_ip_address)+"&utype=fb").data(using: .utf8)

//Set your session to main thread
let session = URLSession.shared

//Task start
let task = session.dataTask(with: post_request) {
    (data, response, error) in
    guard error == nil else {
        print("error calling POST to this url")
        print(error!)
        return
    }
    guard let responseData = data else {
        print("Error: did not receive data")
        return
    }
    //Parse the result here
}
task.resume()
}
```