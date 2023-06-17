import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Typography from "@mui/material/Typography";
import Box from "@mui/material/Box";
import InputLabel from "@mui/material/InputLabel";
import FormControl from "@mui/material/FormControl";
import MenuItem from "@mui/material/MenuItem";
import Select from "@mui/material/Select";
import "./Register.css";

export const Register = () => {
  const [emailId, setEmailId] = useState("");
  const [password, setPassword] = useState("");
  const [firebaseId, setFirebaseId] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [addressLine1, setAddressLine1] = useState("");
  const [addressLine2, setAddressLine2] = useState("");
  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [zip, setZip] = useState("");
  // const [managerId, setManagerId] = useState(34);
  const [isManager, setIsManager] = useState(false);
  const [managerEmailId, setManagerEmailId] = useState("");
  const [roleId, setRoleId] = useState(1);
  const [rolesList, setRolesList] = useState([]);
  const [roleName, setRoleName] = useState("");

  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault();
    const logInRequest = {
      emailId: emailId,
      password: password,
      firebaseId: firebaseId,
    };
    console.log("login req", logInRequest);

    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(logInRequest),
    };

    return fetch(`http://localhost:8088/api/Login`, options)
      .then((res) => {
        console.log("res", res);
        if (res.ok) {
          return res.json();
        } else {
          window.alert("User not found");
        }
      })
      .then((userInfo) => {
        console.log("userInfo", userInfo);
        if (userInfo != null) {
          localStorage.setItem("app_user", JSON.stringify(userInfo));
          navigate("/home");
        }
      });
  };

  const guestUserClickHandler = () => {
    localStorage.setItem(
      "app_user",
      JSON.stringify({
        isManager: false,
      })
    );
  };

  useEffect(() => {
    const getRolesList = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/UserRoles/AllRoleTypes`,
        options
      );

      console.log("GET all roles api response", response);
      if (!response.ok) {
        window.alert("Error getting roles");
      } else {
        const responseDataFromApi = await response.json();
        console.log("all roles api response", responseDataFromApi);
        setRolesList(responseDataFromApi);
      }
    };
    getRolesList();
  }, []);

  return (
    <Box sx={{ height: "100vh", width: "100vw" }}>
      <main className="container--login">
        <h1 className="app--header">
          {" "}
          <img
            className="app--logo--title"
            src="images/bizz-expense-logo.png"
            alt="company logo"
          ></img>
        </h1>
        <section className="form--login">
          <form onSubmit={handleLogin}>
            <h4>Please Register</h4>
            <div className="form--item">
              <TextField
                type="email"
                required
                id="standard-required-email"
                variant="standard"
                label="Email"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setEmailId(evt.target.value)}
                value={emailId}
                sx={{ width: "45%", height: "auto", marginRight: "5%" }}
              />

              <TextField
                type="password"
                required
                id="standard-required-password"
                variant="standard"
                label="Password"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setPassword(evt.target.value)}
                value={password}
                sx={{ width: "45%", height: "auto" }}
              />
            </div>

            <div className="form--item">
              <TextField
                type="text"
                required
                id="standard-required-firstName"
                variant="standard"
                label="First Name"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setFirstName(evt.target.value)}
                value={firstName}
                sx={{ width: "45%", height: "auto", marginRight: "5%" }}
              />
              <TextField
                type="text"
                required
                id="standard-required-lastName"
                variant="standard"
                label="Last Name"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setLastName(evt.target.value)}
                value={lastName}
                sx={{ width: "45%", height: "auto" }}
              />
            </div>

            <div className="form--item">
              <TextField
                type="text"
                required
                id="standard-required-addressLine1"
                variant="standard"
                label="Address Line 1"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setAddressLine1(evt.target.value)}
                value={addressLine1}
                sx={{ width: "45%", height: "auto", marginRight: "5%" }}
              />
              <TextField
                type="text"
                required
                id="standard-required-addressLine2"
                variant="standard"
                label="Address Line 2"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setAddressLine2(evt.target.value)}
                value={addressLine2}
                sx={{ width: "45%", height: "auto" }}
              />
            </div>

            <div className="form--item">
              <TextField
                type="text"
                required
                id="standard-required-city"
                variant="standard"
                label="City"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setCity(evt.target.value)}
                value={city}
                sx={{ width: "45%", height: "auto", marginRight: "5%" }}
              />
              <TextField
                type="text"
                required
                id="standard-required-state"
                variant="standard"
                label="State"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setState(evt.target.value)}
                value={state}
                sx={{ width: "45%", height: "auto" }}
              />
            </div>

            <div className="form--item">
              <TextField
                type="text"
                required
                id="standard-required-zip"
                variant="standard"
                label="Zip"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setZip(evt.target.value)}
                value={zip}
                sx={{ width: "45%", height: "auto", marginRight: "5%" }}
              />
            </div>

            <div className="form--item">
              <TextField
                type="text"
                required
                id="standard-required-managerEmailId"
                variant="standard"
                label="Manager Email Id"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setManagerEmailId(evt.target.value)}
                value={managerEmailId}
                sx={{ width: "45%", height: "auto", marginRight: "5%" }}
              />
              {/* <TextField
                type="text"
                required
                id="standard-required-roleId"
                variant="standard"
                label="Role"
                InputLabelProps={{
                  style: { color: "#000000" },
                }}
                className="form-control"
                onChange={(evt) => setRoleId(evt.target.value)}
                value={roleId}
                sx={{ width: "45%", height: "auto" }}
              /> */}
              <FormControl
                required
                fullWidth
                sx={{ width: "45%", height: "auto" }}
              >
                <InputLabel
                  // variant="standard"
                  sx={
                    {
                      // width: "45%",
                      // height: "auto",
                      // backgroundColor: "#fff",
                      // color: "#fff",
                      // marginTop: "2rem",
                      // marginBottom: "2rem",
                      // padding: "0",
                    }
                  }
                  id="role-label"
                >
                  Select a Role
                </InputLabel>
                <Select
                  // variant="standard"
                  labelId="role"
                  id="role"
                  value={roleName}
                  label="Role"
                  onChange={(e) => {
                    const roleSelected = e.target.value;
                    console.log(roleSelected);
                    setRoleName(roleSelected);
                    console.log(
                      rolesList.find((x) => x.roleDescription === roleSelected)
                        .roleRefId
                    );
                    setRoleId(
                      rolesList.find((x) => x.roleDescription === roleSelected)
                        .roleRefId
                    );
                    roleSelected === "Team Manager"
                      ? setIsManager(true)
                      : setIsManager(false);
                  }}
                  sx={{
                    // width: "45%",
                    // height: "auto",
                    backgroundColor: "#fff",
                    // marginTop: "2rem",
                    // marginBottom: "2rem",
                    // padding: "0",
                  }}
                >
                  {rolesList.map((x) => {
                    return (
                      <MenuItem key={x.roleRefId} value={x.roleDescription}>
                        {x.roleDescription}
                      </MenuItem>
                    );
                  })}
                </Select>
              </FormControl>
            </div>

            <div className="form--item">
              <Button
                sx={{
                  backgroundColor: "#a8dadc",
                  width: "30%",
                  fontSize: "large",
                  fontWeight: "bold",
                  color: "#1f2421",
                  marginRight: "5%",
                  "&:hover": {
                    background: "#a8dadc",
                  },
                }}
                variant="contained"
                onClick={() => {
                  console.log("register clicked");

                  const checkManagerEmailApiCall = async () => {
                    const options = {
                      method: "POST",
                      headers: {
                        "Content-Type": "application/json",
                      },
                      body: JSON.stringify({
                        emailId: managerEmailId,
                        password: "",
                        firebaseId: "",
                      }),
                    };

                    const response = await fetch(
                      `http://localhost:8088/api/Login`,
                      options
                    );

                    console.log(
                      "POST check manager email id api response",
                      response
                    );
                    if (!response.ok) {
                      window.alert("Error verifying manager");
                    } else {
                      const responseDataFromApi = await response.json();
                      console.log(
                        "check manager email id api response",
                        responseDataFromApi
                      );
                      registerApiCall(responseDataFromApi.user.userId);
                    }
                  };

                  const registerApiCall = async (managerId) => {
                    const options = {
                      method: "POST",
                      headers: {
                        "Content-Type": "application/json",
                      },
                      body: JSON.stringify({
                        userId: 0,
                        firstName: firstName,
                        lastName: lastName,
                        addressLine1: addressLine1,
                        addressLine2: addressLine2,
                        city: city,
                        state: state,
                        zip: zip,
                        emailId: emailId,
                        managerId: managerId,
                        isManager: isManager,
                      }),
                    };

                    const response = await fetch(
                      `http://localhost:8088/api/Users/`,
                      options
                    );

                    console.log("POST register user api response", response);
                    if (!response.ok) {
                      window.alert("Error registering user");
                    } else {
                      const responseDataFromApi = await response.json();
                      console.log(
                        "register user api response",
                        responseDataFromApi
                      );
                      userLoginRegisterApiCall(responseDataFromApi.userId);
                      userRoleRegisterApiCall(responseDataFromApi.userId);
                    }
                  };

                  const userLoginRegisterApiCall = async (userId) => {
                    const options = {
                      method: "POST",
                      headers: {
                        "Content-Type": "application/json",
                      },
                      body: JSON.stringify({
                        userId: userId,
                        logInId: 0,
                        firebaseId: "",
                      }),
                    };

                    const response = await fetch(
                      `http://localhost:8088/api/Login/Register`,
                      options
                    );

                    console.log("POST user login api response", response);
                    if (!response.ok) {
                      window.alert("Error registering user login");
                    } else {
                      const responseDataFromApi = await response.json();
                      console.log(
                        "user login api response",
                        responseDataFromApi
                      );
                    }
                  };

                  const userRoleRegisterApiCall = async (userId) => {
                    const options = {
                      method: "POST",
                      headers: {
                        "Content-Type": "application/json",
                      },
                      body: JSON.stringify({
                        userRoleId: 0,
                        userId: userId,
                        roleId: roleId,
                      }),
                    };

                    const response = await fetch(
                      `http://localhost:8088/api/UserRoles`,
                      options
                    );

                    console.log("POST user role api response", response);
                    if (!response.ok) {
                      window.alert("Error adding user role");
                    } else {
                      const responseDataFromApi = await response.json();
                      console.log(
                        'user role api response"',
                        responseDataFromApi
                      );
                    }
                  };

                  checkManagerEmailApiCall();
                  window.alert("Registered Successfully, Please login.");
                  navigate(`/`);
                }}
              >
                Register
              </Button>
              <Button
                sx={{
                  backgroundColor: "#a8dadc",
                  width: "30%",
                  fontSize: "large",
                  fontWeight: "bold",
                  color: "#1f2421",
                  "&:hover": {
                    background: "#a8dadc",
                  },
                }}
                variant="contained"
                onClick={() => navigate(`/`)}
              >
                Cancel
              </Button>
            </div>
          </form>
        </section>
      </main>
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
  );
};
