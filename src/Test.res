
@react.component
let make = () => {


    let f = () => {

            Fetch.fetch("http://localhost:3666/test.html")
            |> Js.Promise.then_(Fetch.Response.text)
            |> Js.Promise.then_(text => Js.log(text) |> Js.Promise.resolve)
            |> Js.Promise.resolve
    }

    Js.log(f())

    <div> {ReasonReact.string("Hello World from Test")} </div>

  
}
