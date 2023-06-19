import { Outlet, Route, Routes } from "react-router-dom";
import Typography from "@mui/material/Typography";
import Box from "@mui/material/Box";
import Profile from "../profile/Profile";
import { EmployeeHome } from "../home/EmployeeHome";
import ExpensesContainer from "../expenses/ExpensesContainer";

export const EmployeeView = () => {
  return (
    <Routes>
      <Route
        path="/"
        element={
          <Box>
            <Outlet />
            <Box
              sx={{
                // marginTop: "10vh",
                height: "10vh",
                backgroundColor: "#0d0a0b",
                color: "#ffffff",
              }}
            >
              <Typography
                variant="caption"
                gutterBottom
                sx={{
                  textAlign: "center",
                  marginLeft: "40%",
                  marginTop: "50%",
                }}
              >
                © 2023 BizzExpense. All Rights Reserved.
              </Typography>
            </Box>
          </Box>
        }
      >
        <Route path="home" element={<EmployeeHome />} />
        <Route path="reports" element={<ExpensesContainer />} />
        <Route path="profile" element={<Profile />} />
        {/* <Route path="floor-plans" element={<FloorPlansList />} />
        <Route path="about-us" element={<AboutUs />} />
        <Route path="profile" element={<Profile />} />
        <Route path="custom-floor-plans" element={<CustomFloorPlansList />} />
        <Route
          path="custom-floor-plans/add"
          element={<CustomFloorPlanForm />}
        />
        <Route
          path="custom-floor-plans/edit"
          element={<EditCustomFloorPlan />}
        />
        <Route path="floor-plans/:floorPlanId" element={<FloorPlanDetails />} /> */}
      </Route>
    </Routes>
  );
};
