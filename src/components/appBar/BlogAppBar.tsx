import PageType from "../../enums/PageType";
import "./AppBar.css";
import DarkModeIcon from "@mui/icons-material/DarkMode";
import { AppBar, Typography, Box, Toolbar } from "@mui/material";

type AppBarProps = {
  onTapPage: (type: PageType) => void;
};

type AppBarItemProps = {
  name: string;
  pageType: PageType;
};

function BlogAppBar({ onTapPage: onTapItem }: AppBarProps) {
  function AppBarItem({ name, pageType }: AppBarItemProps) {
    return (
      <text
        onClick={(e) => {
          onTapItem(pageType);
        }}
        className="appBar-item"
      >
        {name}
      </text>
    );
  }
  return (
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="sticky">
        <Toolbar>
          <Typography variant="h6" color="inherit" component="div">
            dev-hann
          </Typography>
          <div style={{ flex: "1" }}></div>
          <AppBarItem name="About" pageType={PageType.about} />
          <AppBarItem name="Posts" pageType={PageType.post} />
          <AppBarItem name="Portfolios" pageType={PageType.portfolio} />
          <DarkModeIcon></DarkModeIcon>
        </Toolbar>
      </AppBar>
    </Box>
  );
}

export default BlogAppBar;
