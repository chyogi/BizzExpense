import { ManagerNav } from "./ManagerNav";
import { EmployeeNav } from "./EmployeeNav";

export const NavBar = () => {
  const appUser = localStorage.getItem("app_user");
  const appUserObject = JSON.parse(appUser);

  if (appUserObject.user.isManager) {
    return <ManagerNav />;
  } else {
    return <EmployeeNav />;
  }
};
