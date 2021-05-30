Js.log("Hello, World!")

// src/Test.res
@react.component
let make = () => {
  <div> {ReasonReact.string("Hello World")} </div>
}
