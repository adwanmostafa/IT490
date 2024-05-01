CREATE TABLE workout_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    status ENUM('pending', 'accepted', 'declined') NOT NULL DEFAULT 'pending',
    FOREIGN KEY (sender_id) REFERENCES push_notifications(id),
    FOREIGN KEY (recipient_id) REFERENCES push_notifications(id)
);