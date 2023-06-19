import React, { useState, useEffect } from "react";

import Typography from "@mui/material/Typography";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
// import "./Home.css";
import Accordion from "@mui/material/Accordion";
import AccordionSummary from "@mui/material/AccordionSummary";
import AccordionDetails from "@mui/material/AccordionDetails";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import AddIcon from "@mui/icons-material/Add";
import AddExpense from "../expenses/AddExpense";
import Expense from "../expenses/Expense";

const ExpensesContainer = () => {
  const [isCreateExpense, setIsCreateExpense] = useState(false);
  const [refreshExpense, setRefreshExpense] = useState(false);
  const [allExpenses, setAllExpenses] = useState([]);

  const [isPanel1Expanded, setIsPanel1Expanded] = useState(true);

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
        `http://localhost:8088/api/Expenses/ExpensesByUser/${appUser.user.userId}`,
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
      <Box sx={{ minWidthidth: "100vw", minHeight: "100vh" }}>
        <Typography
          variant="h3"
          gutterBottom
          sx={{ textAlign: "Center", marginLeft: "2%", marginTop: "2%" }}
        >
          {`Expense Reports`}
        </Typography>
        <Box sx={{ marginLeft: "2%", marginTop: "2%", height: "30%" }}>
          <Button
            sx={{
              backgroundColor: "#a8dadc",
              width: "30%",
              height: "90%",
              fontSize: "large",
              fontWeight: "bold",
              color: "#1f2421",
              "&:hover": {
                background: "#a8dadc",
              },
            }}
            variant="contained"
            onClick={() => {
              setIsCreateExpense(true);
            }}
          >
            <AddIcon
              sx={{
                height: "70%",
                width: "70%",
              }}
            />
          </Button>
        </Box>

        {isCreateExpense && (
          <AddExpense
            returnToCaller={toggleCreateExpenseButton}
            toggleRefreshExpense={toggleRefreshExpense}
          />
        )}

        <Accordion
          sx={{ padding: "0.5rem" }}
          expanded={isPanel1Expanded}
          onChange={() => setIsPanel1Expanded(!isPanel1Expanded)}
        >
          <AccordionSummary
            sx={{ background: "#457b9d", color: "#fff" }}
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel1a-content"
            id="panel1a-header"
          >
            <Typography sx={{ fontSize: "x-large", fontWeight: "bold" }}>
              Previous Expense Reports
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
            {allExpenses.map((x, index) => {
              return (
                <Expense
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

export default ExpensesContainer;
