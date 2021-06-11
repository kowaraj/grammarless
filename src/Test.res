
@react.component
let make = () => {

    let (text, setText) = React.useState(_ => "")    
// Docs:
// https://github.com/reasonml-community/bs-fetch
// https://rescript-lang.org/docs/manual/latest/promise

    let f = () => {

            // Fetch.fetch("http://localhost:3666/test.html")
            Fetch.fetch("https://www.google.com/")
            |> Js.Promise.then_(Fetch.Response.text)
            |> Js.Promise.then_(text => 
                {
                    Js.log(text) 
                    setText(_ => text) 
                    |> Js.Promise.resolve            
                })
            |> Js.Promise.resolve
    }

    Js.log(f())

    <div> 
        <p> {ReasonReact.string("Fetched content:")} </p>
        <p> {ReasonReact.string(text)} </p> 
        </div>

  
}
