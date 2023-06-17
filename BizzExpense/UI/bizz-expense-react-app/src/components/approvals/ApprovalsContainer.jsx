import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";

import { styled } from "@mui/material/styles";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardMedia from "@mui/material/CardMedia";
import CardContent from "@mui/material/CardContent";
import CardActions from "@mui/material/CardActions";
import Collapse from "@mui/material/Collapse";
import Avatar from "@mui/material/Avatar";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import { red } from "@mui/material/colors";
import FavoriteIcon from "@mui/icons-material/Favorite";
import ShareIcon from "@mui/icons-material/Share";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import MoreVertIcon from "@mui/icons-material/MoreVert";
import { FloorPlans } from "../floorPlans/FloorPlans";
// import "./Home.css";
import Accordion from "@mui/material/Accordion";
import AccordionSummary from "@mui/material/AccordionSummary";
import AccordionDetails from "@mui/material/AccordionDetails";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import AddIcon from "@mui/icons-material/Add";
import { DataGrid } from "@mui/x-data-grid";
import AddExpense from "../expenses/AddExpense";
import Expense from "../expenses/Expense";
import Approval from "./Approval";

const ApprovalsContainer = () => {
  const [isCreateExpense, setIsCreateExpense] = useState(false);
  const [refreshExpense, setRefreshExpense] = useState(false);
  const [allExpenses, setAllExpenses] = useState([]);

  const toggleCreateExpenseButton = () => {
    setIsCreateExpense(!isCreateExpense);
  };

  const toggleRefreshExpense = () => {
    setRefreshExpense(!refreshExpense);
  };

  const [expanded, setExpanded] = React.useState(false);

  const handleChange = (panel) => (event, isExpanded) => {
    setExpanded(isExpanded ? panel : false);
  };

  const currencyFormatter = new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  });

  const appUser = JSON.parse(localStorage.getItem("app_user"));

  const accordingChangeHandler = (panel) => (event, newExpanded) => {
    setExpanded(newExpanded ? panel : false);
  };

  useEffect(() => {
    const getAllExpenses = async () => {
      const options = {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      };

      const response = await fetch(
        `http://localhost:8088/api/Expenses/ExpensesByApprover/${appUser.user.userId}`,
        options
      );

      console.log("GET all expenses for a user", response);
      if (!response.ok) {
        window.alert("Error all expenses for a user");
      } else {
        const responseDataFromApi = await response.json();
        console.log("all expenses for a user", responseDataFromApi);
        setAllExpenses(responseDataFromApi);
      }
    };
    getAllExpenses();
  }, [isCreateExpense, refreshExpense]);

  return (
    <>
      <Box sx={{ width: "100%", height: "100%" }}>
        <Typography
          variant="h3"
          gutterBottom
          sx={{ textAlign: "Center", marginLeft: "2%", marginTop: "2%" }}
        >
          {`Expense Reports in Approval Queue`}
        </Typography>

        <Accordion sx={{ padding: "0.5rem" }}>
          <AccordionSummary
            expanded={expanded === "panel1"}
            onChange={handleChange("panel1")}
            sx={{ background: "#457b9d", color: "#fff" }}
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel1a-content"
            id="panel1a-header"
          >
            <Typography sx={{ fontSize: "x-large", fontWeight: "bold" }}>
              Pending Approvals
            </Typography>
          </AccordionSummary>
          <AccordionDetails
            sx={{
              display: "flex",
              flexDirection: "row",
              flexWrap: "wrap",
              justifyContent: "flex-start",
              alignContent: "center",
              gap: "10px 30px",
            }}
          >
            {allExpenses
              .filter((x) => x.statusId === 1)
              .map((x, index) => {
                return (
                  <Approval
                    key={index}
                    expenseDetail={x}
                    toggleRefreshExpense={toggleRefreshExpense}
                  />
                );
              })}
          </AccordionDetails>
        </Accordion>
        <Accordion sx={{ padding: "0.5rem" }}>
          <AccordionSummary
            expanded={expanded === "panel1"}
            onChange={handleChange("panel1")}
            sx={{ background: "#457b9d", color: "#fff" }}
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel1a-content"
            id="panel1a-header"
          >
            <Typography sx={{ fontSize: "x-large", fontWeight: "bold" }}>
              Previous Decisioned Reports
            </Typography>
          </AccordionSummary>
          <AccordionDetails
            sx={{
              display: "flex",
              flexDirection: "row",
              flexWrap: "wrap",
              justifyContent: "flex-start",
              alignContent: "center",
              gap: "10px 30px",
            }}
          >
            {allExpenses
              .filter((x) => x.statusId !== 1)
              .map((x, index) => {
                return (
                  <Approval
                    key={index}
                    expenseDetail={x}
                    toggleRefreshExpense={toggleRefreshExpense}
                  />
                );
              })}
          </AccordionDetails>
        </Accordion>
      </Box>
    </>
  );
};

export default ApprovalsContainer;
