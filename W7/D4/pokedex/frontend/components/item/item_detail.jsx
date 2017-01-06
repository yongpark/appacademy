import React from 'react';

const ItemDetail = ({ item }) => {
  const { name, happiness, price } = item;

  return (
    <div className="item-details">
      <h4>{name}</h4>
      <h5>Happiness: {happiness}</h5>
      <h5>Price: {price}</h5>
    </div>
  );
};

export default ItemDetail;
