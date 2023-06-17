import React, { useState } from "react";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Typography from "@mui/material/Typography";
import Box from "@mui/material/Box";
import "./Login.css";

export const Login = () => {
  const [emailId, setEmailId] = useState("");
  const [password, setPassword] = useState("");
  const [firebaseId, setFirebaseId] = useState("");
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
            <h4>Please sign in</h4>
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
                sx={{ width: "50vw", height: "auto" }}
              />
            </div>
            <div className="form--item">
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
                sx={{ width: "50vw", height: "auto" }}
              />
            </div>

            <div className="form--item">
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
                type="submit"
                variant="contained"
              >
                Sign in
              </Button>
            </div>
          </form>

          <section>
            <Link className="link--register" to="/register">
              Create an account
            </Link>
          </section>

          {/* <section>
          <Link
            className="link--guest--user"
            to="/"
            onClick={guestUserClickHandler}
          >
            Continue Without Loging In
          </Link>
        </section> */}
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
