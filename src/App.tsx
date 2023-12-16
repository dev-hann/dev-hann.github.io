import "./App.css";
import AppBar from "./components/appBar/AppBar";
import PageType from "./enums/PageType";
import { useState } from "react";

function App() {
  const [page, updatePage] = useState<PageType>(PageType.about);

  function body() {
    switch (page) {
      case PageType.about:
        return <div>about!!</div>;

      case PageType.post:
        return <div>post</div>;

      case PageType.portfolio:
        return <div>portfolio</div>;
    }
  }

  return (
    <div className="App">
      <header className="App-header">
        <AppBar
          onTapPage={(page) => {
            updatePage(page);
          }}
        />
        {body()}
      </header>
    </div>
  );
}

export default App;
