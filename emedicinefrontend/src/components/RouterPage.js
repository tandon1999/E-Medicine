import React from  'react';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import AdminDashboard from './admin/AdminDashboard';
import AdminOrders from './admin/AdminOrders';
import CustomerList from './admin/CustomerList';
import Medicine from './admin/Medicine';
import Login from './Login';
import MedicineDisplay from './users/MedicineDisplay';
import Registration from './Registration';
import Cart from './users/Cart';
import Dashboard from './users/Dashboard';
import Orders from './users/Orders';
import Profile from './users/Profile';
import Receipt from './users/Receipt';
import SideMenu from './users/SideMenu';

export default function RouterPage(){
    
    return(
        <Router>
            <Routes>
                <Route exact path='/' element={ <Login /> } />
                <Route path='/registration' element={ <Registration /> } />
                <Route path='/dashboard' element={ <Dashboard /> } />                
                <Route path='/myorders' element={ <Orders /> } />
                <Route path='/profile' element={ <Profile /> } />
                <Route path='/cart' element={ <Cart /> } />

                <Route path='/admindashboard' element={ <AdminDashboard /> } />
                <Route path='/adminorders' element={ <AdminOrders /> } />
                <Route path='/customers' element={ <CustomerList /> } />
                <Route path='/medicine' element={ <Medicine /> } />

                <Route path='/products' element={ <MedicineDisplay /> } />

                <Route path='/receipt/:id' element={ <Receipt /> } />
                <Route path='/sidemenu' element={ <SideMenu /> } />
            </Routes>
        </Router>
    )
}