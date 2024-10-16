import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './Campaign.css';
import Papa from 'papaparse';

const Campaign = () => {
    const [name, setName] = useState('');
    const [csvFile, setCsvFile] = useState(null);
    const [error, setError] = useState({ name: '', csv: '' });
    const navigate = useNavigate();

    const isValidEmail = (email) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    };

    const handleCsvUpload = (e) => {
        const file = e.target.files[0];
        setCsvFile(file);
        setError((prev) => ({ ...prev, csv: '' }));
        if (file) {
            const validTypes = ['text/csv', 'application/vnd.ms-excel'];
            if (!validTypes.includes(file.type)) {
                setError((prev) => ({ ...prev, csv: 'Please upload a valid CSV file.' }));
                setCsvFile(null);
                return;
            }
            Papa.parse(file, {
                header: true,
                skipEmptyLines: true,
                complete: (results) => {
                    const { data } = results;
                    const hasEmailColumn = data.some((row) => row.email);
                    const hasNameColumn = data.some((row) => row.name);
                    if (!hasEmailColumn || !hasNameColumn) {
                        setError((prev) => ({
                            ...prev,
                            csv: 'CSV must contain both name and email fields with values.',
                        }));
                        setCsvFile(null);
                        return;
                    }
                    for (const row of data) {
                        const name = row.name ? row.name.trim() : '';
                        const email = row.email ? row.email.trim() : '';
                        if (!name || !email) {
                            setError((prev) => ({
                                ...prev,
                                csv: 'CSV rows must contain both name and email values.',
                            }));
                            setCsvFile(null);
                            return;
                        }
                        if (!isValidEmail(email)) {
                            setError((prev) => ({
                                ...prev,
                                csv: 'Invalid email format found in CSV.',
                            }));
                            setCsvFile(null);
                            return;
                        }
                    }
                    setError((prev) => ({ ...prev, csv: '' }));
                },
                error: (error) => {
                    setError((prev) => ({
                        ...prev,
                        csv: 'Error parsing CSV file: ' + error.message,
                    }));
                    setCsvFile(null);
                },
            });
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        let hasError = false;

        if (!name) {
            setError((prev) => ({ ...prev, name: 'Campaign name is required.' }));
            hasError = true;
        } else {
            setError((prev) => ({ ...prev, name: '' }));
        }

        if (!csvFile) {
            setError((prev) => ({ ...prev, csv: 'CSV file is required.' }));
            hasError = true;
        } else {
            setError((prev) => ({ ...prev, csv: '' }));
        }

        if (hasError) {
            return;
        }

        const formData = new FormData();
        formData.append('name', name);
        formData.append('csv', csvFile);

        try {
            const token = localStorage.getItem('token');
            const response = await axios.post('http://localhost:8000/api/campaign', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                    Authorization: `Bearer ${token}`,
                },
            });
            console.log(response);
        } catch (error) {
            console.error(error);
            setError((prev) => ({
                ...prev,
                csv: 'Failed to create campaign.',
            }));
        }
    };

    const handleLogout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        navigate('/login');
    };

    return (
        <div className="campaign-container">
            <button className="logout-button" onClick={handleLogout}>
                Logout
            </button>
            <form className="campaign-form" onSubmit={handleSubmit}>
                <h2>Create Campaign</h2>
                <input
                    type="text"
                    placeholder="Campaign Name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="input-field"
                />
                <div className="error-message">{error.name}</div>
                <input
                    type="file"
                    accept=".csv"
                    onChange={handleCsvUpload}
                    className="file-input"
                />
                <div className="error-message">{error.csv}</div>
                <button type="submit" className="submit-button">Create Campaign</button>
            </form>
        </div>
    );
};

export default Campaign;
