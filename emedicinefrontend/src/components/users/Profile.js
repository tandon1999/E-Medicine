import React, { Fragment, useEffect, useState } from "react";
import {baseUrl} from '../constants';
import axios from "axios";
import Header from "./Header";

export default function Profile() {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  useEffect(() => {
    getData();
  }, []);

  const getData = () => {
    const data = {
      Email: localStorage.getItem("username"),
    };
    const url = `${baseUrl}/api/Users/viewUser`;
    axios
      .post(url, data)
      .then((result) => {
        const data = result.data;
        if (data.statusCode === 200) {
          setFirstName(data.user.firstName);
          setLastName(data.user.lastName);
          setEmail(data.user.email);
          setPassword(data.user.password);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const uploadFile = async (e) => {
    debugger;
    e.preventDefault();
    const data = {
      FirstName: firstName,
      LastName: lastName,
      Email: email, 
      Password: password,
      actionType : 'Update'
    };

    const res = await axios.post(
      `${baseUrl}/api/Users/updateProfile`,
      data
    );
    if (res.data.statusCode === 200) {
      getData();
      Clear(e);
      alert("Profile updated successfully.");
    } else {
      alert(res.data.statusMessage);
    }
  };

  const Clear = () => {
    setFirstName("");
    setLastName("");
    setEmail("");
    setPassword("");
  };

  return (
    <Fragment>
      <Header />
      <br></br>
      <form>
        <div
          class="form-row"
          style={{ width: "80%", backgroundColor: "white", margin: " auto" }}
        >
          <div class="form-group col-md-12">
            <h3>My Profile</h3>
          </div>
          <div className="form-group col-md-6">
            <input
              type="text"
              onChange={(e) => setFirstName(e.target.value)}
              placeholder="First Name"
              className="form-control"
              required
              value={firstName}
            />
          </div>
          <div className="form-group col-md-6">
            <input
              type="text"
              onChange={(e) => setLastName(e.target.value)}
              placeholder="Last Name"
              className="form-control"
              required
              value={lastName}
            />
          </div>

          <div className="form-group col-md-6">
            <input
              type="text"
              className="form-control"
              id="validationTextarea"
              placeholder="Email"
              onChange={(e) => setEmail(e.target.value)}
              required
              value={email}
              disabled
            ></input>
          </div>
          <div className="form-group col-md-6">
            <input
              type="text"
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Passwprd"
              className="form-control"
              required
              value={password}
            />
          </div>
          <div className="form-group col-md-6">
            <button
              className="btn btn-primary"
              style={{ width: "150px", float: "left" }}
              onClick={(e) => uploadFile(e)}
            >
              Update
            </button>{" "}
            <button
              className="btn btn-danger"
              style={{ width: "150px" }}
              onClick={(e) => Clear(e)}
            >
              Reset
            </button>
          </div>
        </div>
      </form>
     
    </Fragment>
  );
}
