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
import InputLabel from "@mui/material/InputLabel";
import FormControl from "@mui/material/FormControl";
import MenuItem from "@mui/material/MenuItem";
import Select from "@mui/material/Select";
import InputAdornment from "@mui/material/InputAdornment";
import Input from "@mui/material/Input";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#edede9",
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: "center",
  color: theme.palette.text.primary,
}));

export default function EditExpense(props) {
  const navigate = useNavigate();
  const appUser = JSON.parse(localStorage.getItem("app_user"));
  const [expenseTypesList, setExpenseTypesList] = useState([]);
  const [expenseTypeName, setExpenseTypeName] = useState(
    props.expenseDetail.expenseType
  );
  const [expenseSubTypesList, setExpenseSubTypesList] = useState([]);
  const [expenseSubTypeName, setExpenseSubTypeName] = useState(
    props.expenseDetail.expenseSubType
  );
  const [expenseTypeId, setExpenseTypeId] = useState(
    props.expenseDetail.expenseTypeId
  );
  const [expenseSubTypeId, setExpenseSubTypeId] = useState(
    props.expenseDetail.expenseSubTypeId
  );
  const [expenseAmount, setExpenseAmount] = useState(
    props.expenseDetail.expenseAmount
  );
  const [comments, setComments] = useState(props.expenseDetail.comments);
  const [managerObject, setManagerObject] = useState({});

  useEffect(() => {
    const getExpenseTypesList = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/Expenses/AllExpenseTypes`,
        options
      );

      console.log("GET all expense types api response", response);
      if (!response.ok) {
        window.alert("Error expense types");
      } else {
        const responseDataFromApi = await response.json();
        console.log("all expense types api response", responseDataFromApi);
        setExpenseTypesList(responseDataFromApi);
      }
    };
    getExpenseTypesList();
  }, []);

  useEffect(() => {
    const getExpenseSubTypesList = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/Expenses/AllExpenseSubTypes`,
        options
      );

      console.log("GET all expense sub types api response", response);
      if (!response.ok) {
        window.alert("Error expense sub types");
      } else {
        const responseDataFromApi = await response.json();
        console.log("all expense sub types api response", responseDataFromApi);
        setExpenseSubTypesList(responseDataFromApi);
      }
    };
    getExpenseSubTypesList();
  }, []);

  useEffect(() => {
    const getManagerObject = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/Users/${appUser.user.managerId}`,
        options
      );

      console.log("GET manager object api response", response);
      if (!response.ok) {
        window.alert("Error getting manager object");
      } else {
        const responseDataFromApi = await response.json();
        console.log("manager object api response", responseDataFromApi);
        setManagerObject(responseDataFromApi);
      }
    };
    getManagerObject();
  }, []);

  return (
    <Box>
      <Typography sx={{ textAlign: "center" }} variant="h3" gutterBottom>
        Edit Expense Report
      </Typography>
      <Box component="form" noValidate autoComplete="off">
        <Grid
          container
          rowSpacing={2}
          columnSpacing={{ xs: 1, sm: 2, md: 3 }}
          sx={{ textAlign: "center" }}
        >
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-managerName"
              label="Manager Name"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={`${managerObject.firstName ?? ""} ${
                managerObject.lastName ?? ""
              }`}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-managerEmailId"
              label="Manager Email Id"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={managerObject.emailId ?? ""}
            />
          </Grid>
          <Grid item xs={12}>
            <FormControl
              required
              fullWidth
              sx={{ width: "100%", height: "auto" }}
            >
              <InputLabel variant="standard" id="role-label">
                Expense Type
              </InputLabel>
              <Select
                variant="standard"
                labelId="expense-type"
                id="expense-type"
                value={expenseTypeName}
                label="Expense Type"
                onChange={(e) => {
                  const expenseTypeSelected = e.target.value;
                  console.log(expenseTypeSelected);
                  setExpenseTypeName(expenseTypeSelected);
                  console.log(
                    expenseTypesList.find(
                      (x) => x.expenseTypeDescription === expenseTypeSelected
                    ).expenseTypeRefId
                  );
                  setExpenseTypeId(
                    expenseTypesList.find(
                      (x) => x.expenseTypeDescription === expenseTypeSelected
                    ).expenseTypeRefId
                  );
                }}
              >
                {expenseTypesList.map((x) => {
                  return (
                    <MenuItem
                      key={x.expenseTypeRefId}
                      value={x.expenseTypeDescription}
                    >
                      {x.expenseTypeDescription}
                    </MenuItem>
                  );
                })}
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12}>
            <FormControl
              required
              fullWidth
              sx={{ width: "100%", height: "auto" }}
            >
              <InputLabel variant="standard" id="role-label">
                Expense Sub Type
              </InputLabel>
              <Select
                variant="standard"
                labelId="expense-type"
                id="expense-type"
                value={expenseSubTypeName}
                label="Expense Type"
                onChange={(e) => {
                  const expenseSubTypeSelected = e.target.value;
                  console.log(expenseSubTypeSelected);
                  setExpenseSubTypeName(expenseSubTypeSelected);
                  console.log(
                    expenseSubTypesList.find(
                      (x) =>
                        x.expenseSubTypeDescription === expenseSubTypeSelected
                    ).expenseSubTypeRefId
                  );
                  setExpenseSubTypeId(
                    expenseSubTypesList.find(
                      (x) =>
                        x.expenseSubTypeDescription === expenseSubTypeSelected
                    ).expenseSubTypeRefId
                  );
                }}
              >
                {expenseSubTypesList
                  .filter((x) => x.expenseTypeId === expenseTypeId)
                  .map((x) => {
                    return (
                      <MenuItem
                        key={x.expenseSubTypeRefId}
                        value={x.expenseSubTypeDescription}
                      >
                        {x.expenseSubTypeDescription}
                      </MenuItem>
                    );
                  })}
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12}>
            <FormControl
              fullWidth
              sx={{ m: 1, width: "100%", height: "auto" }}
              variant="standard"
            >
              <InputLabel htmlFor="standard-adornment-amount">
                Expense Amount
              </InputLabel>
              <Input
                id="standard-adornment-amount"
                value={expenseAmount}
                onChange={(e) => {
                  console.log("expense amount", e.target.value);
                  setExpenseAmount(e.target.value);
                }}
                startAdornment={
                  <InputAdornment position="start">$</InputAdornment>
                }
              />
            </FormControl>
          </Grid>
          <Grid item xs={12}>
            <TextField
              sx={{ width: "100%", height: "auto" }}
              id="standard-multiline-static"
              label="Comments"
              multiline
              rows={4}
              value={comments}
              variant="standard"
              onChange={(e) => {
                console.log("comments", e.target.value);
                setComments(e.target.value);
              }}
            />
          </Grid>
        </Grid>
        <Stack spacing={4} direction="row" sx={{ marginTop: "10%" }}>
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
              console.log("UPDATE expense clicked");
              const updateExpenseApiCall = async () => {
                const options = {
                  method: "PUT",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  body: JSON.stringify({
                    expenseId: props.expenseDetail.expenseId,
                    expenseTypeId: expenseTypeId,
                    expenseSubTypeID: expenseSubTypeId,
                    expenseAmount: expenseAmount,
                    submittedByUserId: appUser.user.userId,
                    createdBy: props.expenseDetail.expenseCreatedByUserId,
                    updatedBy: appUser.user.userId,
                  }),
                };

                const response = await fetch(
                  `http://localhost:8088/api/Expenses/${props.expenseDetail.expenseId}`,
                  options
                );

                console.log("PUT expense api response", response);
                if (!response.ok) {
                  window.alert("Error updating expense");
                }
              };
              updateExpenseApiCall();
              props.returnToCaller();
              props.toggleRefreshExpense();
            }}
          >
            Update Expense
          </Button>
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
              console.log("cancel expense creation");
              props.returnToCaller();
              props.toggleRefreshExpense();
            }}
          >
            Cancel
          </Button>
        </Stack>
      </Box>
    </Box>
  );
}
