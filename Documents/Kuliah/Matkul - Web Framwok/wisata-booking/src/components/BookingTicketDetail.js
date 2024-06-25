import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useLocation } from 'react-router-dom';

function BookingTicketDetail() {
    const location = useLocation();
    const [placeId, setPlaceId] = useState('');
    const [placeName, setPlaceName] = useState('');
    const [placeDescription, setPlaceDescription] = useState('');
    const [placeImageUrl, setPlaceImageUrl] = useState('');
    const [price, setPrice] = useState('');
    const [userId, setUserId] = useState('');

    useEffect(() => {
        const user = JSON.parse(localStorage.getItem('user'));
        if (location.state) {
            const { placeId, placeName, placeDescription, placeImageUrl, price } = location.state;
            setPlaceId(placeId);
            setPlaceName(placeName);
            setPlaceDescription(placeDescription);
            setPlaceImageUrl(placeImageUrl);
            setPrice(price);
            if (user != null) {
                setUserId(user.id);
            }
        }
    }, [location.state]);

    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [date, setDate] = useState('');
    const [time, setTime] = useState('');
    const [tickets, setTickets] = useState(1);
    const [isCheckIn, setCheckIn] = useState(false);
    const [paymentStatus, setPaymentStatus] = useState(false); // New state for payment status

    const handleSubmit = async (e) => {
        e.preventDefault();
        let numericPrice = parseFloat(price);
        let numericTickets = parseFloat(tickets);
        let total = numericPrice * numericTickets;

        const bookingData = {
            name,
            email,
            date,
            time,
            tickets: numericTickets,
            isCheckIn,
            placeId,
            placeName,
            placeDescription,
            placeImageUrl,
            price,
            totalPrice: total,
            idUser: userId,
            paymentStatus // Include payment status in the booking data
        };

        try {
            await axios.post('http://localhost:8000/bookings', bookingData);
            alert('Booking successful!');
            setName('');
            setEmail('');
            setDate('');
            setTime('');
            setTickets(1);
            setCheckIn(false);
            setPaymentStatus(false);
        } catch (error) {
            console.error('Error saving booking:', error);
            alert('There was an error saving your booking. Please try again.');
        }
    };

    return (
        <div className="container">
            <h2 className="text-center my-4">Book Tickets for {placeName}</h2>
            <div className="row">
                <div className="col-md-6 mb-4">
                    <div className="card">
                        <img src={placeImageUrl} className="card-img-top" alt={placeName} />
                        <div className="card-body">
                            <h5 className="card-title">{placeName}</h5>
                            <p className="card-text">{placeDescription}</p>
                            <p className="card-text price-tag mb-0">Rp. {price} ,-</p>
                        </div>
                    </div>
                </div>
                <div className="col-md-6 mb-4">
                    <form onSubmit={handleSubmit}>
                        <div className="form-group">
                            <label>Name</label>
                            <input
                                type="text"
                                className="form-control"
                                value={name}
                                onChange={(e) => setName(e.target.value)}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Email address</label>
                            <input
                                type="email"
                                className="form-control"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Date</label>
                            <input
                                type="date"
                                className="form-control"
                                value={date}
                                onChange={(e) => setDate(e.target.value)}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Time</label>
                            <input
                                type="time"
                                className="form-control"
                                value={time}
                                onChange={(e) => setTime(e.target.value)}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Number of Tickets</label>
                            <input
                                type="number"
                                className="form-control"
                                value={tickets}
                                onChange={(e) => setTickets(e.target.value)}
                                min="1"
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label>Payment Status</label>
                            <select
                                className="form-control"
                                value={paymentStatus}
                                onChange={(e) => setPaymentStatus(e.target.value === 'true')}
                                required
                            >
                                <option value="false">Belum Dibayar</option>
                                <option value="true">Sudah Dibayar</option>
                            </select>
                        </div>
                        <button type="submit" className="btn btn-black btn-block mt-3 w-100">Book</button>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default BookingTicketDetail;
