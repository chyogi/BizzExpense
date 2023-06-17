import { ManagerView } from "./ManagerView";
import { EmployeeView } from "./EmployeeView";

export const ApplicationViews = () => {
  const appUser = localStorage.getItem("app_user");
  const appUserObject = JSON.parse(appUser);

  if (appUserObject.user.isManager) {
    return <ManagerView />;
  } else {
    return <EmployeeView />;
  }
};
