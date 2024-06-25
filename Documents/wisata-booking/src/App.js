import React, { useEffect } from 'react';
import { Routes, Route, Link, useNavigate, useLocation } from 'react-router-dom';
import Login from './components/Login';
import Register from './components/Register';
import BookingTicket from './components/BookingTicket';
import BookingTicketDetail from './components/BookingTicketDetail';
import BookingHistory from './components/BookingHistory';
import { Navbar, Nav, NavDropdown } from 'react-bootstrap';

function App() {
  const user = JSON.parse(localStorage.getItem('user'));
  const navigate = useNavigate();
  const { pathname } = useLocation();

  useEffect(() => {
    // Redirect logic based on user login status
    if (!user && pathname !== '/login' && pathname !== '/register') {
      navigate('/login'); // Redirect to login if user is not logged in and not on login or register page
    } else if (user && (pathname === '/' || pathname === '/login' || pathname === '/register')) {
      navigate('/bookingticket'); // Redirect to home if user is logged in and on login or register page
    }
  }, [user, navigate, pathname]);

  const handleLogout = () => {
    localStorage.removeItem('user');
    navigate('/login');
  };

  return (
    <div>
      <Navbar bg="brown" variant="dark" expand="lg">
        <div className="container">
          {user ? (
            <Navbar.Brand as={Link} to="/bookingticket">Booking Ticket</Navbar.Brand>
          ) : (
            <Navbar.Brand>Ticket booking</Navbar.Brand>
          )}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="ms-auto">
              {user ? (
                <NavDropdown title={`Welcome, ${user.username}`} id="basic-nav-dropdown">
                  <NavDropdown.Item as={Link} to="/bookinghistory">Booking History</NavDropdown.Item>
                  <NavDropdown.Divider />
                  <NavDropdown.Item onClick={handleLogout}>Logout</NavDropdown.Item>
                </NavDropdown>
              ) : (
                <>
                  <Nav.Link as={Link} to="/login" className={pathname === '/login' ? 'active' : ''}>Login</Nav.Link>
                  <Nav.Link as={Link} to="/register" className={pathname === '/register' ? 'active' : ''}>Register</Nav.Link>
                </>
              )}
            </Nav>
          </Navbar.Collapse>
        </div>
      </Navbar>
      <div className="container mt-5">
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/bookingticket" element={<BookingTicket />} />
          <Route path="/booking/:id" element={<BookingTicketDetail />} />
          <Route path="/bookinghistory" element={<BookingHistory />} />
        </Routes>
      </div>
    </div>
  );
}

export default App;
