# Info

Docs:
- [bs-fetch](https://github.com/reasonml-community/bs-fetch)
- [promise in ReScript](https://rescript-lang.org/docs/manual/latest/promise)



# Install 

npm install 

# Run front-end

To serve http://localhost:3666

- `npm start`
- `npm run webpack`
- Start front-end on port :3666 = `npm run webpack:dev-server`

# Run back-end 

To serve http://localhost:3000/test.html 

- go to ./grammarless/_backend/grammarless
- Start back-end on port :3000 = `npm run webpack:dev-server-be`



# CORS


- Fetching with request + no init object 
  - Same as fetching with mode=CORS (see below)

- Fetching with request + mode=CORS: 
``` 
Access to fetch at 'http://localhost:3000/test.html' from origin 'http://localhost:3666' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
Test.bs.js:28 GET http://localhost:3000/test.html net::ERR_FAILED
Test.bs.js:36 Js.Promise.catch!
Test.bs.js:37 TypeError: Failed to fetch
```

- Fetching with mode=NoCORS:
  - Chrome shows the fetched file content in the DevTools, but an empty string is resolved in the promise.
  