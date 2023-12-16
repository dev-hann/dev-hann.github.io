import PageType from "../../enums/PageType";
import "./AppBar.css";
import DarkModeIcon from "@mui/icons-material/DarkMode";

type AppBarProps = {
  onTapPage: (type: PageType) => void;
};

type AppBarItemProps = {
  name: string;
  pageType: PageType;
};

function AppBar({ onTapPage: onTapItem }: AppBarProps) {
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
    <div className="appBar">
      <div>dev-hann</div>
      <div style={{ flex: "1" }}></div>
      <AppBarItem name="About" pageType={PageType.about} />
      <AppBarItem name="Posts" pageType={PageType.post} />
      <AppBarItem name="Portfolios" pageType={PageType.portfolio} />
      <DarkModeIcon></DarkModeIcon>
    </div>
  );
}

export default AppBar;
