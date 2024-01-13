import "./App.css";
import BlogAppBar from "./components/appBar/BlogAppBar";
import PageType from "./enums/PageType";
import { useState } from "react";
import PostPage from "./pages/PostPage";
import { AppBar, Typography } from "@mui/material";

function App() {
  const [page, updatePage] = useState<PageType>(PageType.about);

  function body() {
    switch (page) {
      case PageType.about:
        return <div>about!!</div>;

      case PageType.post:
        return <PostPage></PostPage>;

      case PageType.portfolio:
        return <div>portfolio</div>;
    }
  }

  return (
    <div className="App">
      <BlogAppBar
        onTapPage={(page) => {
          updatePage(page);
        }}
      />
      <body style={{ overflowY: "auto", flex: "1" }}>{body()}</body>
    </div>
  );
}

export default App;
