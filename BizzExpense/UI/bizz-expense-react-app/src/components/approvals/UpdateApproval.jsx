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

export default function UpdateApproval(props) {
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
  const [expenseStatusTypesList, setExpenseStatusTypesList] = useState([]);
  const [expenseStatusDescription, setExpenseStatusDescription] = useState(
    props.expenseDetail.statusDescription
  );
  const [expenseStatusId, setExpenseStatusId] = useState(
    props.expenseDetail.statusId
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
  const [submittedUserObject, setSubmittedUserObject] = useState({});
  const [submittedByUserId, setSubmittedByUserId] = useState(
    props.expenseDetail.submittedByUserId
  );

  useEffect(() => {
    const getApprovalStatusTypesList = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/Expenses/AllApprovalStatuses`,
        options
      );

      console.log("GET all expense status types api response", response);
      if (!response.ok) {
        window.alert("Error expense status types");
      } else {
        const responseDataFromApi = await response.json();
        console.log(
          "all expense status types api response",
          responseDataFromApi
        );
        setExpenseStatusTypesList(responseDataFromApi);
      }
    };
    getApprovalStatusTypesList();
  }, []);

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
    const getSubmittedObject = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/Users/${props.expenseDetail.submittedByUserId}`,
        options
      );

      console.log("GET submitted user object api response", response);
      if (!response.ok) {
        window.alert("Error getting submitted user object");
      } else {
        const responseDataFromApi = await response.json();
        console.log("submitted user object api response", responseDataFromApi);
        setSubmittedUserObject(responseDataFromApi);
      }
    };
    getSubmittedObject();
  }, []);

  return (
    <Box>
      <Typography sx={{ textAlign: "center" }} variant="h3" gutterBottom>
        Approve Expense Report
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
              id="standard-submittedUserName"
              label="Submitted User Name"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={`${submittedUserObject.firstName ?? ""} ${
                submittedUserObject.lastName ?? ""
              }`}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              fullWidth
              id="standard-submittedUserEmailId"
              label="Submitted User Email Id"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={submittedUserObject.emailId ?? ""}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              fullWidth
              id="standard-expense-type"
              label="Expense Type"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={expenseTypeName ?? ""}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              fullWidth
              id="standard-expense-subtype"
              label="Expense Sub Type"
              variant="standard"
              InputProps={{
                readOnly: true,
              }}
              value={expenseSubTypeName ?? ""}
            />
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
                InputProps={{
                  readOnly: true,
                }}
                startAdornment={
                  <InputAdornment position="start">$</InputAdornment>
                }
              />
            </FormControl>
          </Grid>{" "}
          <Grid item xs={12}>
            <FormControl
              required
              fullWidth
              sx={{ width: "100%", height: "auto" }}
            >
              <InputLabel variant="standard" id="role-label">
                Status
              </InputLabel>
              <Select
                variant="standard"
                labelId="expense-status"
                id="expense-status"
                value={expenseStatusDescription}
                label="Expense Staus"
                onChange={(e) => {
                  const expenseStatusSelected = e.target.value;
                  console.log("expenseStatusSelected", expenseStatusSelected);
                  setExpenseStatusDescription(expenseStatusSelected);
                  console.log(
                    "statusRefId",
                    expenseStatusTypesList.find(
                      (x) => x.statusDescription === expenseStatusDescription
                    ).statusRefId
                  );
                  setExpenseStatusId(
                    expenseStatusTypesList.find(
                      (x) => x.statusDescription === expenseStatusDescription
                    ).statusRefId
                  );
                }}
              >
                {expenseStatusTypesList.map((x) => {
                  return (
                    <MenuItem key={x.statusRefId} value={x.statusDescription}>
                      {x.statusDescription}
                    </MenuItem>
                  );
                })}
              </Select>
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
              console.log("approve expense clicked");
              const approveExpenseApiCall = async () => {
                const options = {
                  method: "PUT",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  body: JSON.stringify({
                    approvalStatusId: props.expenseDetail.approvalStatusId,
                    expenseId: props.expenseDetail.expenseId,
                    statusId: expenseStatusId,
                    comments: comments,
                    approverId: appUser.user.userId,
                    createdBy: props.expenseDetail.approvalCreatedByUserId,
                    updatedBy: appUser.user.userId,
                  }),
                };

                const response = await fetch(
                  `http://localhost:8088/api/ExpenseStatus/${props.expenseDetail.expenseId}`,
                  options
                );

                console.log("PUT approve expense api response", response);
                if (!response.ok) {
                  window.alert("Error updating expense");
                }
              };
              approveExpenseApiCall();
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
