<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Email Campaign Platform</title>
</head>
<body>
    <h1>Welcome, {{ $user->name }}!</h1>
    <p>Thank you for signing up. We are excited to have you on board!</p>
    <p>Your credentials are:</p>
    <p>
        <strong>Email:</strong> {{ $user->email }}<br>
        <strong>Password:</strong> {{ $password }}
    </p>
    <p>Best Regards,<br>Your Team</p>
</body>
</html>