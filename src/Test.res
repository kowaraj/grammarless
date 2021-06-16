
@react.component
let make = () => {

    let (text_x, setTextX) = React.useState(_ => "")    
    let (text_cors, setTextCors) = React.useState(_ => "")    

    let f = (_e) => {
            Fetch.fetch("http://localhost:3000/test.html")
            |> Js.Promise.then_(Fetch.Response.text)
            |> Js.Promise.then_(text => 
                {
                    Js.log(text) 
                    setTextX(_ => text) 
                    |> Js.Promise.resolve            
                })
            |> Js.Promise.resolve
            |> ignore
    }

    let f_cors = (_e) => {
            Fetch.fetchWithInit(
                "http://localhost:3000/test.html", 

                Fetch.RequestInit.make(
                    ~mode=Fetch.CORS,
                    ()
                    )
                )
            |> Js.Promise.then_(Fetch.Response.text)
            |> Js.Promise.then_(text => 
                {
                    Js.log(text) 
                    setTextCors(_ => text) 
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


    <div> 
        <p onClick=f> {ReasonReact.string("Fetched content:")} </p>
        <p> {ReasonReact.string(text_x)} </p> 
        <p onClick=f_cors> {ReasonReact.string("Fetched content with cors (no-cors):")} </p>
        <p> {ReasonReact.string(text_cors)} </p> 
        </div>

  
}
