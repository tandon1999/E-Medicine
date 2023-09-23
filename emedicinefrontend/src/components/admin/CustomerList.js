import React, { Fragment, useEffect, useState } from "react";
import axios from "axios";
import Header from "./AdminHeader";
import { baseUrl } from "../constants";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import "./modal.css";

export default function CustomerList() {
  const [data, setData] = useState([]);
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const [email, setEmail] = useState("");
  const [funds, setFunds] = useState(0);

  useEffect(() => {
    getData();
  }, []);

  const getData = () => {
    const url = `${baseUrl}/api/Admin/userList`;
    axios
      .get(url)
      .then((result) => {
        const data = result.data;
        if (data.statusCode === 200) {
          setData(data.listUsers);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const handleItemDetail = (email) => {
    setEmail(email);
    setShow(true);
  };

  const handleManageFunds =(e) =>{
    e.preventDefault();
    const url = `${baseUrl}/api/Admin/updateFund`;
    const data = {  
      Email: email,
      Fund: funds
    };

    axios
      .post(url, data)
      .then((result) => {
        setShow(false);
        getData();
        setFunds(0);        
        const dt = result.data;
        alert(dt.statusMessage);
      })
      .catch((error) => {
        console.log(error);
      });
  }

  return (
    <Fragment>
      <Header />
      <br></br>
      <div class="form-group col-md-12">
        <h3>Customer List</h3>
      </div>
      {data ? (
        <table
          className="table stripped table-hover mt-4"
          style={{ backgroundColor: "white", width: "80%", margin: "0 auto" }}
        >
          <thead className="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
              <th scope="col">Email</th>
              <th scope="col">Password</th>
              <th scope="col">Funds</th>
              <th scope="col">Status</th>
              <th scope="col">Registration Date</th>
              <th scope="col">Manage Funds</th>
            </tr>
          </thead>
          <tbody>
            {data.map((val, index) => {
              return (
                <tr key={index}>
                  <th scope="row">{index + 1}</th>
                  <td>{val.firstName}</td>
                  <td>{val.lastName}</td>
                  <td>{val.email}</td>
                  <td>{val.password}</td>
                  <td>{val.fund}</td>
                  <td>{val.status}</td>
                  <td>{val.orderDate}</td>
                  <td>
                    <Button
                      variant="secondary"
                      onClick={() => handleItemDetail(val.email)}
                    >
                      Update
                    </Button>
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
            <Modal.Title>Manage Funds</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <div className="row">
              <div className="col-md-6">
                <label>
                  Email
                </label>
                <input
                  type="text"
                  id="form3Example1c"
                  className="form-control"
                  disabled
                  value={email}
                />
              </div>
              <div className="col-md-6">
                <label>
                  Funds
                </label>
                <input
                  type="text"
                  id="form3Example1c"
                  className="form-control"
                  onChange={(e) => setFunds(e.target.value)}
                  value={funds}
                  placeholder="Enter Funds"
                />
              </div>
            </div>
          </Modal.Body>
          <Modal.Footer>
          <Button variant="primary" onClick={(e) => handleManageFunds(e)}>
              Update
            </Button>
            <Button variant="secondary" onClick={handleClose}>
              Close
            </Button>
          </Modal.Footer>
        </Modal>
      </div>
    </Fragment>
  );
}
