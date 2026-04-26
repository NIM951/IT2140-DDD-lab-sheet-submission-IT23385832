package com.dddlab.lab04_ddd.controller;

import com.dddlab.lab04_ddd.util.DBConnection;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;

public class DeleteModuleController {

    @FXML private TextField mnameField;

    @FXML
    protected void handleDeleteButton() {
        String moduleName = mnameField.getText();

        if (moduleName.isEmpty()) {
            showAlert(Alert.AlertType.ERROR, "Form Error!", "Please enter the name of the module to remove.");
            return;
        }

        try {
            int rowsAffected = DBConnection.deleteModuleByName(moduleName);

            if (rowsAffected > 0) {
                showAlert(Alert.AlertType.INFORMATION, "Success!", "The module '" + moduleName + "' was removed successfully.");
                mnameField.clear();
            } else {
                showAlert(Alert.AlertType.WARNING, "Not Found", "No module with the name '" + moduleName + "' was found.");
            }

        } catch (RuntimeException e) {
            showAlert(Alert.AlertType.ERROR, "Database Error", "Could not remove the module. It might be in use by a course offering.");
        }
    }

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}
