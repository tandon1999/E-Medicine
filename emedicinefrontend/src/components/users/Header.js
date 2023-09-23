import React, {useState,Fragment,useEffect} from  'react';
import { Link } from "react-router-dom";

export  default function Header(){    
    const [username, setUserName] = useState("");

    useEffect(() => {
      setUserName(localStorage.getItem("username"));
    }, []);
  
    const logout = (e) => {
      e.preventDefault();
      localStorage.removeItem("username");
      window.location.href = "/";
    };
  
    return (
      <Fragment>
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
          <a className="navbar-brand" href="#">
            E-Medicine ( User Panel)
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
  
          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav mr-auto">
              <li className="nav-item active">
              <Link to="/dashboard"  className="nav-link" >
                  Welcome <span className="sr-only">(current)</span>
                  ( {username} )
                  </Link>
              </li>
              <li className="nav-item">
                <Link to="/profile" className="nav-link">
                  My Profile
                </Link>
              </li>
              <li className="nav-item">
                <Link to="/myorders" className="nav-link">
                  My Orders
                </Link>
              </li>
              <li className="nav-item">
                <Link to="/products" className="nav-link">
                  All Products
                </Link>
              </li>
              <li className="nav-item">
                <Link to="/cart" className="nav-link">
                  Cart
                </Link>
              </li>
            </ul>
            <form className="form-inline my-2 my-lg-0">
              <button
                className="btn btn-outline-success my-2 my-sm-0"
                type="submit"
                onClick={(e) => logout(e)}
              >
                Logout
              </button>
            </form>
          </div>
        </nav>
      </Fragment>
    );
}