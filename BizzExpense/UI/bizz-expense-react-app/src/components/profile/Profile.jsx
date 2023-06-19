import React, { useState, useEffect } from "react";
import { styled } from "@mui/material/styles";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Box from "@mui/material/Box";
import { useLocation, useParams } from "react-router-dom";
import Typography from "@mui/material/Typography";
import ImageList from "@mui/material/ImageList";
import ImageListItem from "@mui/material/ImageListItem";
import Carousel from "react-bootstrap/Carousel";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import { useNavigate } from "react-router-dom";
import TextField from "@mui/material/TextField";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#edede9",
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: "center",
  color: theme.palette.text.primary,
}));

export default function Profile() {
  const navigate = useNavigate();
  const appUser = JSON.parse(localStorage.getItem("app_user"));
  const [userData, setUserData] = useState({});
  const [userRoles, setUserRoles] = useState([]);
  const [userRoleString, setUserRoleString] = useState("");
  const [isEditMode, setIsEditMode] = useState(false);
  const [editUserData, setEditUserData] = useState({
    userId: appUser.user.userId,
    firstName: "",
    lastName: "",
    addressLine1: "",
    addressLine2: "",
    city: "",
    state: "",
    zip: "",
    emailId: "",
    managerId: userData.managerId,
    isManager: userData.isManager,
    createTS: userData.createTS,
    createdBy: userData.createdBy,
    // updateTS: null,
    updatedBy: appUser.user.userId,
  });

  useEffect(
    () => {
      const getUserData = async () => {
        const response = await fetch(
          `http://localhost:8088/api/Users/${appUser.user.userId}`
        );
        const apiResponse = await response.json();
        console.log("user data", apiResponse);
        setUserData(apiResponse);
      };
      getUserData();
    },
    [] // When this array is empty, you are observing initial component state
  );

  useEffect(
    () => {
      const getUserRoles = async () => {
        const response = await fetch(
          `http://localhost:8088/api/UserRoles/userRolesByUserId/${appUser.user.userId}`
        );
        const apiResponse = await response.json();
        console.log("user roles", apiResponse);
        setUserRoles(apiResponse);
      };
      getUserRoles();
    },
    [] // When this array is empty, you are observing initial component state
  );

  useEffect(
    () => {
      console.log("user data state", userData);
      const tempArr = [];
      userRoles.map((obj, i) => {
        tempArr.push(obj.roleDescription);
      });
      console.log("tempArr", tempArr);
      setUserRoleString([...new Set(tempArr)].join(", "));
      console.log([...new Set(tempArr)].join(", "));
    },
    [userRoles] // When this array is empty, you are observing initial component state
  );

  useEffect(() => {
    console.log("editUserData After Change", editUserData);
  }, [editUserData]);

  useEffect(() => {
    console.log("before user data retrieved", editUserData);
    setEditUserData({
      ...editUserData,
      firstName: userData.firstName,
      lastName: userData.lastName,
      addressLine1: userData.addressLine1,
      addressLine2: userData.addressLine2,
      city: userData.city,
      state: userData.state,
      zip: userData.zip,
      emailId: userData.emailId,
      userId: appUser.user.userId,
      updatedBy: appUser.user.userId,
      managerId: userData.managerId,
      isManager: userData.isManager,
      createTS: userData.createTS,
      createdBy: userData.createdBy,
    });
    console.log("afer user data retrieved", editUserData);
  }, [userData]);

  return (
    <Box sx={{ marginTop: "5%", minWidth: "100vw", minHeight: "100vh" }}>
      <Typography sx={{ textAlign: "center" }} variant="h3" gutterBottom>
        User Profile
      </Typography>
      <Box
        sx={{ marginTop: "5%", width: "50%", marginLeft: "25%" }}
        component="form"
        noValidate
        autoComplete="off"
      >
        <Grid
          container
          rowSpacing={2}
          columnSpacing={{ xs: 1, sm: 2, md: 3 }}
          sx={{ textAlign: "center" }}
        >
          <Grid item xs={12}>
            <TextField
              fullWidth
              id="standard-role"
              label="Role(s)"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={userRoleString ?? ""}
              // defaultValue={userRoleString}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-firstName"
              label="First Name"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.firstName}
              // defaultValue={
              //   isEditMode ? editUserData.firstName : userData.firstName
              // }
              onChange={(e) => {
                console.log("edit firstName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  firstName: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-lastName"
              label="Last Name"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.lastName}
              // defaultValue={userData.lastName}
              onChange={(e) => {
                console.log("edit lastName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  lastName: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-addressLine1"
              label="Address Line 1"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.addressLine1}
              // defaultValue={userData.addressLine1}
              onChange={(e) => {
                console.log("edit lastName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  addressLine1: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-addressLine2"
              label="Address Line 2"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.addressLine2}
              // defaultValue={userData.addressLine2}
              onChange={(e) => {
                console.log("edit lastName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  addressLine2: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-city"
              label="City"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.city}
              // defaultValue={userData.city}
              onChange={(e) => {
                console.log("edit lastName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  city: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-state"
              label="State"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.state}
              // defaultValue={userData.state}
              onChange={(e) => {
                console.log("edit lastName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  state: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-zip"
              label="Zip"
              variant="standard"
              InputProps={{
                readOnly: !isEditMode,
              }}
              sx={{
                "& .MuiInputBase-input": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },

                "& .MuiTextField-root": {
                  backgroundColor: isEditMode ? "#caf0f8" : "",
                },
              }}
              value={editUserData.zip}
              // defaultValue={userData.zip}
              onChange={(e) => {
                console.log("edit lastName before update", editUserData);
                setEditUserData({
                  ...editUserData,
                  zip: e.target.value,
                });
              }}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-email"
              label="Email"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={editUserData.emailId}
              // defaultValue={userData.emailId}
            />
          </Grid>
        </Grid>
        <Stack spacing={4} direction="row" sx={{ marginTop: "10%" }}>
          {!isEditMode && (
            <Button
              fullWidth
              sx={{
                backgroundColor: "#a8dadc",
                fontSize: "large",
                fontWeight: "bold",
                color: "#1f2421",
                borderRadius: "25px",
                "&:hover": {
                  background: "#a8dadc",
                },
              }}
              variant="contained"
              onClick={() => {
                console.log("profile edit clicked");
                setIsEditMode(true);
              }}
            >
              Edit
            </Button>
          )}
          {!isEditMode && (
            <Button
              fullWidth
              variant="outlined"
              sx={{
                backgroundColor: "#ef476f",
                fontSize: "large",
                fontWeight: "bold",
                color: "#ffffff",
                borderRadius: "25px",
                "&:hover": {
                  background: "#ef476f",
                },
              }}
              onClick={() => {
                console.log("profile delete clicked");
                window.alert("Are you sure you want to delete the account?");
                const deleteUserData = async () => {
                  const options = {
                    method: "DELETE",
                    headers: {
                      "Content-Type": "application/json",
                    },
                  };

                  const response = await fetch(
                    `http://localhost:8088/api/Users/${appUser.user.userId}`,
                    options
                  );

                  console.log("DELETE api response", response);
                  if (!response.ok) {
                    window.alert("Error deleting user");
                  } else {
                    window.alert("User deleted successfully");
                  }

                  const responseDataFromApi = await response.json();
                  console.log(responseDataFromApi);
                };

                deleteUserData();
                const options = {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  body: JSON.stringify(""),
                };
                return fetch(
                  `http://localhost:8088/api/Login/logout`,
                  options
                ).then((res) => {
                  console.log("logout", res);
                  if (res.ok) {
                    localStorage.clear();
                    navigate(`/`);
                  } else {
                    window.alert("error logging out");
                  }
                });
              }}
            >
              Delete
            </Button>
          )}
          {isEditMode && (
            <Button
              fullWidth
              sx={{
                backgroundColor: "#a8dadc",
                fontSize: "large",
                fontWeight: "bold",
                color: "#1f2421",
                borderRadius: "25px",
                "&:hover": {
                  background: "#a8dadc",
                },
              }}
              variant="contained"
              onClick={() => {
                console.log("save changes clicked");
                const updateUserData = async () => {
                  const options = {
                    method: "PUT",
                    headers: {
                      "Content-Type": "application/json",
                    },
                    body: JSON.stringify(editUserData),
                  };

                  const response = await fetch(
                    `http://localhost:8088/api/Users/${appUser.user.userId}`,
                    options
                  );

                  console.log("update api response", response);
                  if (!response.ok) {
                    window.alert("Error updating user info");
                  } else {
                    window.alert("User data updated successfully");
                  }

                  const responseDataFromApi = await response.json();
                  console.log(responseDataFromApi);
                  setUserData({ ...userData, ...responseDataFromApi });
                };

                updateUserData();
                setIsEditMode(false);
              }}
            >
              Save Changes
            </Button>
          )}
          {isEditMode && (
            <Button
              fullWidth
              sx={{
                backgroundColor: "#a8dadc",
                fontSize: "large",
                fontWeight: "bold",
                color: "#1f2421",
                borderRadius: "25px",
                "&:hover": {
                  background: "#a8dadc",
                },
              }}
              variant="contained"
              onClick={() => {
                console.log("profile edit cancelled");
                setIsEditMode(false);
              }}
            >
              Cancel
            </Button>
          )}
        </Stack>
      </Box>
    </Box>
  );
}
