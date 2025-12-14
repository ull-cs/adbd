package es.ull.adbd.exception;

import java.util.Date;

public class ErrorMessage {

    private int statusCode;
    private Date timestamp;
    private String message;
    private String description;

    public ErrorMessage(int statusCode, Date timestamp, String message, String description) {
        this.statusCode = statusCode;
        this.timestamp = timestamp;
        this.message = message;
        this.description = description;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public Date getTimestamp() {
        return this.timestamp;
    }

    public String getMessage() {
        return this.message;
    }

    public String getDescription() {
        return this.description;
    }

    @Override
    public String toString() {
        return "ErrorMessage=[" + 
                "id=" + this.statusCode + ", " + 
                "timestamp=" + this.timestamp + ", " + 
                "message=" + this.message + ", " + 
                "description=" + this.description +
            "]";
    }      
}