import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

function BookingTicket() {
  const [places, setPlaces] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchPlaces = async () => {
      try {
        const response = await axios.get('http://localhost:8000/places');
        setPlaces(response.data);
      } catch (error) {
        console.error('Error fetching places:', error);
      }
    };

    fetchPlaces();
  }, []);

  const handleBookNow = (place) => {
    navigate(`/booking/${place.id}`, {
      state: {
        placeId: place.id,
        placeName: place.name,
        placeDescription: place.description,
        placeImageUrl: place.imageUrl,
        price: place.price
      },
    });
  };

  return (
<div className="container">
  <h2 className="text-center mb-4">Book Your Ticket</h2>
  <div className="row">
    {places.map((place) => (
      <div className="col-md-6 col-lg-4 mb-4" key={place.id}>
        <div className="card">
          <img src={place.imageUrl} className="card-img-top" alt={place.name} />
          <div className="card-body">
            <h5 className="card-title">{place.name}</h5>
            <p className="card-text">{place.description}</p>
            <div className="d-flex justify-content-between align-items-center">
              <p className="card-text price-tag mb-0">Rp. {place.price} ,-</p>
              <button
                className="btn btn-black"
                onClick={() => handleBookNow(place)}
              >
                Book Now
              </button>
            </div>
          </div>
        </div>
      </div>
    ))}
  </div>
</div>




  );
}

export default BookingTicket;