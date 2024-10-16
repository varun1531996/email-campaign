import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './Signup.css';

const Signup = () => {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState({});
    const [successMessage, setSuccessMessage] = useState('');
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();

    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        let validationErrors = {};

        if (!name) {
            validationErrors.name = 'Name is required';
        }
        if (!email) {
            validationErrors.email = 'Email is required';
        } else if (!validateEmail(email)) {
            validationErrors.email = 'Please enter a valid email';
        }
        if (!password) {
            validationErrors.password = 'Password is required';
        } else if (password.length <= 3) {
            validationErrors.password = 'Password must be longer than 3 characters';
        }

        if (Object.keys(validationErrors).length > 0) {
            setErrors(validationErrors);
        } else {
            setLoading(true);
            try {
                const response = await axios.post('http://localhost:8000/api/signup', { name, email, password });
                if (response.data.success) {
                    setErrors({});
                    setSuccessMessage(response.data.message);
                    setTimeout(() => {
                        navigate('/login', { state: { message: response.data.message } });
                    }, 2000);
                }
            } catch (error) {
                if (error.response && error.response.status === 422) {
                    setErrors(error.response.data.errors);
                } else {
                    console.error('Signup error:', error);
                }
            } finally {
                setLoading(false);
            }
        }
    };

    return (
        <div className="signup-container">
            <form className="signup-form" onSubmit={handleSubmit}>
                <h2>Sign Up</h2>
                {successMessage && (
                    <div className="alert alert-success" role="alert">
                        {successMessage}
                    </div>
                )}
                <input type="text" placeholder="Name" value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="input-field" />
                {errors.name && <span className="error">{errors.name}</span>}
                <input type="text" placeholder="Email" value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="input-field" />
                {errors.email && <span className="error">{errors.email}</span>}
                <input type="password" placeholder="Password" value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    className="input-field" />
                {errors.password && <span className="error">{errors.password}</span>}
                <button type="submit" className="signup-button" disabled={loading}>
                    {loading ? 'Signing Up...' : 'Sign Up'}
                </button>
            </form>
        </div>
    );
};

export default Signup;
