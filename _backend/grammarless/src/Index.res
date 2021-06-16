switch ReactDOM.querySelector("#theapp") {
| Some(root) => ReactDOM.render(<App />, root)
| None => ()
}
