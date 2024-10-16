import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Login from '../src/components/login/Login';
import Signup from '../src/components/signup/Signup';
import Campaign from "../src/components/campaign/Campaign";
import ProtectedRoute from './components/ProtectedRoute';

const App = () => {
    return (
        <Router>
            <Routes>
                <Route path="/login" element={<Login />} />
                <Route path="/signup" element={<Signup />} />
                <Route path="/dashboard" element={
                    <ProtectedRoute>
                        <Campaign />
                    </ProtectedRoute>
                } />
            </Routes>
        </Router>
    );
};

export default App;
