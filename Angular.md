- To send the cookies from angular to .net core every request (put it in the interceptor) must have

  ``` JS
  options.withCredentials = true;
  ```

-----------------------------------------------



In Angular when calling     

```javascript
.map(res => {
	return res.json();
})
```

the response returned from API endpoint must be an **object, a number or an array of numbers** that could be serialized into json so it can be deserialized in the Angular side using **res.json()**. 

If we are returning a string then we have to ready it in the following way 

```javascript
.map(res => {
    return (<any>res)._body;
})
```

The casting in the previous statement because typescript compiler will complain that the Response object does not have a property **_body**. 

-----------------------------------

