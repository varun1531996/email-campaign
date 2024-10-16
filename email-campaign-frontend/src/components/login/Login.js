import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './Login.css';

const Login = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState({});
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();
    const [successMessage, setSuccessMessage] = useState('');

    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        let validationErrors = {};
        if (!email) {
            validationErrors.email = 'Email is required';
        } else if (!validateEmail(email)) {
            validationErrors.email = 'Please enter a valid email';
        }
        if (!password) {
            validationErrors.password = 'Password is required';
        }
        if (Object.keys(validationErrors).length > 0) {
            setErrors(validationErrors);
            return; 
        }
        setLoading(true);
        try {
            const response = await axios.post('http://localhost:8000/api/signin', { email, password });
            console.log(response.data);
            setErrors({});
            localStorage.setItem('token', response.data.token);
            localStorage.setItem('user', JSON.stringify(response.data.user));
            navigate('/dashboard');
        } catch (error) {
            console.error(error.response.data);
            if (error.response && error.response.status === 401) {
                setSuccessMessage('Invalid credentials');
            } else {
                setErrors({ email: 'An error occurred. Please try again later.' });
            }
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="login-container">
            <form className="login-form" onSubmit={handleSubmit}>
                <h2>Login</h2>
                {successMessage && (
                    <div className="alert alert-danger" role="alert">
                        {successMessage}
                    </div>
                )}
                <input
                    type="email"
                    placeholder="Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="input-field"
                />
                {errors.email && <p className="error">{errors.email}</p>}

                <input
                    type="password"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    className="input-field"
                />
                {errors.password && <p className="error">{errors.password}</p>}

                <button type="submit" className="login-button" disabled={loading}>
                    {loading ? 'Logging in...' : 'Login'}
                </button>
            </form>
        </div>
    );
};

export default Login;
