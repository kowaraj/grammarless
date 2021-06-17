
@react.component
let make = () => {

    let (text_x, setTextX) = React.useState(_ => "")

    let f_no_cors = url => {
            Fetch.fetch(url)
            |> Js.Promise.then_(Fetch.Response.text)
            |> Js.Promise.then_(text => 
                {
                    Js.log(url)
                    Js.log(text) 
                    setTextX(_ => text) 
                    |> Js.Promise.resolve            
                })
            |> Js.Promise.resolve
            |> ignore
    }
    let f1 = _e => f_no_cors("http://localhost:3000/test.html")

    let fetch_url = (url, mode) => {
            Fetch.fetchWithInit(
                url, 

                Fetch.RequestInit.make(
                    ~mode=mode,
                    ()
                    )
                )
            |> Js.Promise.then_(Fetch.Response.text)
            |> Js.Promise.then_(text => 
                {
                    Js.log(url)
                    Js.log(text) 
                    setTextX(_ => text) 
                    |> Js.Promise.resolve            
                })
            |> Js.Promise.catch( err => 
                {
                    Js.log("Js.Promise.catch!")
                    Js.log(err)                    
                    |> Js.Promise.resolve
                })
            |> ignore
    }

    let f2 = _e => fetch_url("http://localhost:3000/test.html", Fetch.CORS)
    let f_nocors = _e => fetch_url("https://cern.ch", Fetch.NoCORS)
    // let f_cors = _e => fetch_url("https://cern.ch", Fetch.CORS)
    let f_cors = _e => fetch_url("https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css", Fetch.CORS)


    <div> 
        <p onClick=f1> {ReasonReact.string("Fetched content:")} </p>
        <p onClick=f_nocors> {ReasonReact.string("Fetched content with init = NoCORS:")} </p>
        <p onClick=f_cors> {ReasonReact.string("Fetched content with init = CORS:")} </p>

        <p> {ReasonReact.string(text_x)} </p> 

        </div>

  
}
