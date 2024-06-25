import React, { useEffect, useState } from 'react';
import axios from 'axios';

function BookingHistory() {
  const [bookings, setBookings] = useState([]);
  const [editingBooking, setEditingBooking] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [userId, setUserId] = useState('');

  useEffect(() => {
    const user = JSON.parse(localStorage.getItem('user'));
    if (user != null) {
      setUserId(user.id);
      fetchBookings(user.id);
    }
  }, []);

  const fetchBookings = async (userId) => {
    try {
      const response = await axios.get(`http://localhost:8000/bookings?idUser=${userId}`);
      setBookings(response.data);
    } catch (error) {
      console.error('There was an error fetching the bookings!', error);
    }
  };

  const handleDelete = async (id) => {
    try {
      await axios.delete(`http://localhost:8000/bookings/${id}`);
      fetchBookings(userId);
    } catch (error) {
      console.error('There was an error deleting the booking!', error);
    }
  };

  const handleEdit = (booking) => {
    setEditingBooking(booking);
    setShowModal(true);
  };

  const handleModalClose = () => {
    setShowModal(false);
    setEditingBooking(null);
  };

  const handleTotalPrice = (tickets, price) => {
    const numericTickets = parseInt(tickets);
    const unitPrice = parseFloat(price);

    if (!isNaN(numericTickets) && !isNaN(unitPrice)) {
      const totalPrice = unitPrice * numericTickets;
      setEditingBooking((prev) => ({ ...prev, tickets: numericTickets, totalPrice }));
    }
  };

  const handleSave = async () => {
    try {
      await axios.put(`http://localhost:8000/bookings/${editingBooking.id}`, editingBooking);
      fetchBookings(userId);
      handleModalClose();
    } catch (error) {
      console.error('There was an error updating the booking!', error);
    }
  };

  return (
    <div className="container">
      <h2 className="text-center mb-4">Booking History</h2>
      <div className="row">
        {bookings.length === 0 ? (
          <p className="text-center">No bookings found</p>
        ) : (
          bookings.map((booking) => (
            <div className="col-md-6 col-lg-4 mb-4" key={booking.id}>
              <div className="card">
                <img src={booking.placeImageUrl} className="card-img-top" alt={booking.placeName} />
                <div className="card-body">
                  <h5 className="card-title">Booking ID: {booking.id}</h5>
                  <p><strong>Total Price :</strong>Rp. {booking.totalPrice} ,-</p>
                  <p><strong>Jumlah Ticket :</strong> {booking.tickets}</p>
                  <p><strong>Tanggal :</strong> {booking.date} {booking.time} </p>
                  <p><strong>Payment Status :</strong> {booking.paymentStatus ? 'Sudah Dibayar' : 'Belum Dibayar'}</p>
                  <div className="d-flex justify-content-between mt-2">
                    <button className="btn btn-danger text-white custom-button" onClick={() => handleDelete(booking.id)}>Delete</button>
                    <button className="btn btn-outline-primary custom-button" onClick={() => handleEdit(booking)}>Edit</button>
                  </div>
                </div>
              </div>
            </div>
          ))
        )}
      </div>

      {showModal && editingBooking && (
        <div className="modal show" style={{ display: 'block' }}>
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title">Edit Booking</h5>
              </div>
              <div className="modal-body">
                <div className="form-group">
                  <label>Total Price</label>
                  <input
                    type="number"
                    className="form-control"
                    value={isNaN(editingBooking.totalPrice) ? '' : editingBooking.totalPrice}
                    disabled
                    style={{ backgroundColor: '#e9ecef', cursor: 'not-allowed' }}
                  />
                </div>
                <div className="form-group">
                  <label>Jumlah Ticket</label>
                  <input
                    type="number"
                    className="form-control"
                    value={isNaN(editingBooking.tickets) ? '' : editingBooking.tickets}
                    onChange={(e) => handleTotalPrice(e.target.value, editingBooking.price)}
                  />
                </div>
                <div className="form-group">
                  <label>Payment Status</label>
                  <select
                    className="form-control"
                    value={editingBooking.paymentStatus}
                    onChange={(e) => setEditingBooking((prev) => ({
                      ...prev,
                      paymentStatus: e.target.value === 'true'
                    }))}
                  >
                    <option value="false">Belum Dibayar</option>
                    <option value="true">Sudah Dibayar</option>
                  </select>
                </div>
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-secondary" onClick={handleModalClose}>Close</button>
                <button type="button" className="btn btn-primary" onClick={handleSave}>Save changes</button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default BookingHistory;
