import React, { useState, useEffect } from "react";
import Box from "@mui/material/Box";
import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import EditOutlinedIcon from "@mui/icons-material/EditOutlined";
import DeleteOutlineOutlinedIcon from "@mui/icons-material/DeleteOutlineOutlined";
import EditExpense from "./EditExpense";
import Modal from "@mui/material/Modal";
import Stack from "@mui/material/Stack";

const currencyFormatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

export default function Expense(props) {
  const [isEditMode, setIsEditMode] = useState(false);
  const [openDeleteModal, setOpenDeleteModal] = useState(false);
  const [openEditModal, setOpenEditModal] = React.useState(false);

  const toggleEditModal = () => {
    setOpenEditModal(!openEditModal);
  };

  return (
    <Box sx={{ width: "30%" }}>
      <Card variant="outlined">
        <CardContent>
          <Typography sx={{ fontSize: 14 }} color="text.secondary" gutterBottom>
            {props.expenseDetail.expenseType}
          </Typography>
          <Typography variant="h5" component="div">
            {props.expenseDetail.expenseSubType}
          </Typography>
          <Typography sx={{ mb: 1.5 }} color="text.secondary">
            {currencyFormatter.format(
              isNaN(props.expenseDetail.expenseAmount)
                ? 0.0
                : props.expenseDetail.expenseAmount
            )}
          </Typography>
          <Typography variant="body2">
            {props.expenseDetail.statusDescription}
          </Typography>
        </CardContent>
        <CardActions>
          <Button
            size="small"
            onClick={() => {
              setOpenEditModal(true);
            }}
          >
            <EditOutlinedIcon />
          </Button>
          <Button
            size="small"
            onClick={() => {
              setOpenDeleteModal(true);
            }}
          >
            <DeleteOutlineOutlinedIcon />
          </Button>
        </CardActions>
      </Card>
      <Modal
        open={openEditModal}
        onClose={() => {
          setOpenEditModal(false);
        }}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box
          sx={{
            position: "absolute",
            top: "45%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            width: "70%",
            height: "90%",
            bgcolor: "background.paper",
            border: "2px solid #000",
            boxShadow: 24,
            p: 4,
          }}
        >
          <EditExpense
            expenseDetail={props.expenseDetail}
            returnToCaller={toggleEditModal}
            toggleRefreshExpense={props.toggleRefreshExpense}
          />
        </Box>
      </Modal>
      <Modal
        open={openDeleteModal}
        onClose={() => {
          setOpenDeleteModal(false);
        }}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box
          sx={{
            position: "absolute",
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            width: "60%",
            height: "55%",
            bgcolor: "background.paper",
            border: "2px solid #000",
            boxShadow: 24,
            p: 4,
          }}
        >
          <Typography sx={{ textAlign: "center" }} variant="h3" gutterBottom>
            This action will delete the expense report.do you want to proceed?
          </Typography>
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
                console.log("DELETE expense clicked");

                const deleteExpenseApiCall = async () => {
                  const options = {
                    method: "DELETE",
                    headers: {
                      "Content-Type": "application/json",
                    },
                  };

                  const response = await fetch(
                    `http://localhost:8088/api/Expenses/${props.expenseDetail.expenseId}`,
                    options
                  );

                  console.log("DELETE expense api response", response);
                  if (!response.ok) {
                    window.alert("Error DELETEING expense");
                  }
                };
                deleteExpenseApiCall();
                setOpenDeleteModal(false);
                props.toggleRefreshExpense();
              }}
            >
              Yes, Delete
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
                console.log("cancel expense delete");
                setOpenDeleteModal(false);
                props.toggleRefreshExpense();
              }}
            >
              Cancel
            </Button>
          </Stack>
        </Box>
      </Modal>
    </Box>
  );
}
