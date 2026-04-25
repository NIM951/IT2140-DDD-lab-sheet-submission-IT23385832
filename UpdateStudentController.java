package com.dddlab.lab04_ddd.controller;

import com.dddlab.lab04_ddd.util.DBConnection;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;

public class UpdateStudentController {

    @FXML private TextField snameField;
    @FXML private TextField addressField;

    @FXML
    protected void handleUpdateButton() {
        String studentName = snameField.getText();
        String newAddress = addressField.getText();

        if (studentName.isEmpty() || newAddress.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Form Error!", "Please enter both student name and new address.");
            return;
        }

        try {
            int rowsAffected = DBConnection.updateStudentAddress(studentName, newAddress);

            if (rowsAffected > 0) {
                showAlert(Alert.AlertType.INFORMATION, "Success!", "Address for " + studentName + " was updated successfully.");
                clearForm();
            } else {
                showAlert(Alert.AlertType.WARNING, "Not Found", "No student with the name '" + studentName + "' was found.");
            }

        } catch (RuntimeException e) {
            showAlert(Alert.AlertType.ERROR, "Database Error", "Could not update address: " + e.getMessage());
        }
    }

    private void clearForm() {
        snameField.clear();
        addressField.clear();
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}
