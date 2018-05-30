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

### Using  

* `URL`  
* `URLRequest`  
* `URLSession`  
* `URLSession.datatask(with : URLRequest)` which take `URLRequest` and `CompletionHandler` as input  

Building your HTTP request step by step really make one know what he is  doing.  

### Note

* `content of` is not suggested. It is breif but may have you do not know what you are doing. Using `URLSession.datatask` will make GET and POST more similar.    
* `URLSession.datatask(with : URL)`. Use the functions such as `URLSession.datatask(with : URLRequest)` and you will know your datatask better. I start with `URLSession.datatask(with : URL)`  as a GET function and found out I have no idea how to write a POST. `URLSession.datatask(with : URLRequest)`will be enought for both `GET` and `POST`  
* These code not implement the one with `completionHandler`. Use `completionHandler`


## GET code (HTML)

Please note this is for GET HTML and convert to `String`. For those use GET to json you could still use the most of request.

{{< highlight swift >}}
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

//Share the session between others
let session = URLSession.shared

//Task start
let task = session.dataTask(with: get_request) { (data, response, error) in
    //Error Handling
    guard error == nil else {
        print("error calling GET URLSession datatask")
        print(error!.localizedDescription)
        return
    }
    guard let _ = response else {
        return
    }

    //Get HTML and transfer to String in order to compare and parse
    guard let data_string : String = String(data: data!, encoding: .utf8) else {
        print("Converting Data GET from request to string error")
        return
    }
    print(data_string)
    //Parse your data here
}
task.resume();
}
{{< /highlight >}}

## GET code (JSON)

If you expect to get a `JSON` from the URL, than you could try this. In this example code the URL will return 
`{status = 1}` if success.

{{< highlight swift >}}
@IBAction func button2_onclick(_ sender: Any) {

//Set GET url string
let get_url_string: String = "your_url_here"

//Set Get url
guard let get_url = URL(string: get_url_string) else {
    print("Error: cannot create login URL")
    return
}

//Set Request and Method
var get_request = URLRequest(url: get_url)
get_request.httpMethod = "GET"

//Share the session between others
let session = URLSession.shared

//Task start
let task = session.dataTask(with: get_request) { (data, response, error) in
    //Error handling
    guard error == nil else {
        print("error calling GET URLSession datatask")
        print(error!.localizedDescription)
        return
    }
    guard let _ = response else {
        return
    }
    guard let responseData = data else {
                print("Error: did not receive data")
                return
    }
    
    //JSON parsing
    do {
        guard let data_json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject? , let status_code =  data_json["status"] as? NSInteger else {
            print("Error: Recieved JSON error")
            return
        }
        
        if status_code == -2 {
            print("Error: Please try again after 15 min")
            return
        } else if status_code == 0 {
            print("Error: Missing key and value")
            return
        } else if status_code == 1 {
            print("Success")
        } else {
            print("Unexpected Error")
            return
        }
    }
    catch{
        print(error.localizedDescription)
        return
    }
}
task.resume();
}
{{< /highlight >}}



## POST code

This is a `application/x-www-form-urlencoded` version. 

{{< highlight swift >}}
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

//Share the session between others
let session = URLSession.shared

//Task start
let task = session.dataTask(with: post_request) {
    (data, response, error) in

    //Error handling
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
{{< /highlight >}}