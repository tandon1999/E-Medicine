import React, { useEffect, useState, Fragment } from 'react'
import axios from "axios";
import { baseUrl } from "../constants";
import {
    useParams,
    useNavigate
} from "react-router-dom";
import html2canvas from "html2canvas";
import { jsPDF } from "jspdf";

const Receipt = () => {
    const { id } = useParams();

    const [data, setData] = useState([]);
    const [itemData, setItemData] = useState([]);
    const [orderNo, setOrderNo] = useState('')
    const [orderTotal, setOrderTotal] = useState('')

    useEffect(() => {
        getData("UserItems", id);
    }, []);

    const getData = (type, id) => {
        const data = {
            ID: id,
            type: type,
            Email: localStorage.getItem("username"),
        };
        const url = `${baseUrl}/api/Medicines/orderList`;
        axios
            .post(url, data)
            .then((result) => {
                const data = result.data;
                console.log(data.listOrders)
                if (data.statusCode === 200) {
                    setOrderNo(data.listOrders[0].orderNo)
                    setOrderTotal(data.listOrders[0].orderTotal)
                    type === "User" ? setData(data.listOrders) : setItemData(data.listOrders);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    };


    const downloadPdfDocument = (rootElementId) => {
        const input = document.getElementById(rootElementId);
        html2canvas(input)
            .then((canvas) => {
                const imgData = canvas.toDataURL('image/png');
                const pdf = new jsPDF();
                pdf.addImage(imgData, 'JPEG', 0, 0);
                pdf.save(`sample.pdf`);
            })
    }

    return (
        <Fragment>
        <button onClick={() => downloadPdfDocument("testId")}>PDF</button>
        <div id="testId" style={{
        backgroundColor: '#f5f5f5',
        width: '600px',
        height: '600px',
        marginLeft: 'auto',
        marginRight: 'auto'
      }}>
        <b>Order NO : {orderNo}</b><hr></hr>
        
        <b>Order Total : {orderTotal}</b><hr></hr>

        {itemData ? (
              <table className="table stripped table-hover mt-4">
                <thead className="thead-dark">
                  <tr>
                    <th>#</th>                   
                    <th>Name</th>
                    <th>Manufacturer</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Order Date</th>
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
        </div>
        </Fragment>
    )
}

export default Receipt