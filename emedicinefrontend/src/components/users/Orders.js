import React, { Fragment, useEffect, useState } from "react";
import axios from "axios";
import Header from "./Header";
import { baseUrl } from "../constants";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import "./modal.css";
import { Link } from "react-router-dom";

export default function Orders() {
  const [data, setData] = useState([]);
  const [itemData, setItemData] = useState([]);

  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);

  useEffect(() => {
    getData("User", 0);
  }, []);

  const getData = (type, id) => {
    const data = {
      ID : id,
      type: type,
      Email: localStorage.getItem("username"),
    };
    const url = `${baseUrl}/api/Medicines/orderList`;
    axios
      .post(url, data)
      .then((result) => {
        const data = result.data;
        if (data.statusCode === 200) {
          type === "User" ? setData(data.listOrders) : setItemData(data.listOrders);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const handleItemDetail = (id) => {
    getData("UserItems",id);
    setShow(true);
  };

  return (
    <Fragment>
      <Header />
      <br></br>
      <div class="form-group col-md-12">
        <h3>My Orders</h3>
      </div>
      {data ? (
        <table
          className="table stripped table-hover mt-4"
          style={{ backgroundColor: "white", width: "80%", margin: "0 auto" }}
        >
          <thead className="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Order No</th>
              <th scope="col">Total</th>
              <th scope="col">Status</th>
              <th scope="col">Order Date</th>
              <th scope="col">Receipt</th>
            </tr>
          </thead>
          <tbody>
            {data.map((val, index) => {
              return (
                <tr key={index}>
                  <th scope="row">{index + 1}</th>
                  <td onClick={() => handleItemDetail(val.id)}>
                    {val.orderNo}
                  </td>
                  <td>{val.orderTotal}</td>
                  <td>{val.orderStatus}</td>
                  <td>{val.createdOn}</td>
                  <td>
                    <Link target="_blank" to={`/receipt/${val.id}`}>Generate Receipt</Link>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      ) : (
        "No data found"
      )}
      <div style={{ width: "100%" }}>
        <Modal show={show} onHide={handleClose}>
          <Modal.Header>
            <Modal.Title>Order Details for : ({itemData && itemData.length > 0 ? itemData[0]["orderNo"] : ""})</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            {itemData ? (
              <table className="table stripped table-hover mt-4">
                <thead className="thead-dark">
                  <tr>
                    <th scope="col">#</th>                   
                    <th scope="col">Medicine Name</th>
                    <th scope="col">Manufacturer</th>
                    <th scope="col">Unit Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Order Date</th>
                    {/* <th scope="col">Image</th>                     */}
                  </tr>
                </thead>
                <tbody>
                  {itemData.map((val, index) => {
                    return (
                      <tr key={index}>
                        <th scope="row">{index + 1}</th>
                        <td>{val.medicineName}</td>
                        <td>{val.manufacturer}</td>
                        <td>{val.unitPrice}</td>
                        <td>{val.quantity}</td>
                        <td>{val.totalPrice}</td>
                        <td>{val.createdOn}</td>
                        {/* <td>
                          <img src={val.imageUrl} style={{ height:"10%" }} />
                        </td> */}
                        
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            ) : (
              "No data found"
            )}
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
              Close
            </Button>
          </Modal.Footer>
        </Modal>
      </div>
    </Fragment>
  );
}
