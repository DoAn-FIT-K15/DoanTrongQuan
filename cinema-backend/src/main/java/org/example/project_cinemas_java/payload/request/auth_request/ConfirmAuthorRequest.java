package org.example.project_cinemas_java.payload.request.auth_request;

import lombok.Data;

@Data
public class ConfirmAuthorRequest {
    private String password;
    private String newEmail;
}
