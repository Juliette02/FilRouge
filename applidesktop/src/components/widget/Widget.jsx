import React, { useState, useEffect } from "react";
import "./Widget.scss";
import KeyboardArrowUpOutlinedIcon from '@mui/icons-material/KeyboardArrowUpOutlined';
import Person2OutlinedIcon from '@mui/icons-material/Person2Outlined';
import ShoppingCartOutlinedIcon from '@mui/icons-material/ShoppingCartOutlined';
import MonetizationOnOutlinedIcon from '@mui/icons-material/MonetizationOnOutlined';
import AccountBalanceWalletOutlinedIcon from '@mui/icons-material/AccountBalanceWalletOutlined';
import { HashLink as Link } from 'react-router-hash-link';



const Widget = ({ type }) => {

    const [NbCommandesLivraison, setNbCommandesLivraison] = useState([])

    useEffect(() => {
        fetch(`http://127.0.0.1:8000/nbcommandelivraison`, { method: 'GET' })
            .then(response => response.json())
            .then(response => setNbCommandesLivraison(response));
    }, [])

    let data;

    switch (type) {
        case "user":
            data = {
                title: "Nombre de commandes en cours de livraison",
                link: "",
                data: NbCommandesLivraison.map((stats, index) => (
                    stats.EnCoursDeLivraison
                )),
            };
            break;

        case "order":
            data = {
                title: "COMMANDES",
                isMoney: false,
                link: <Link to="/dashboard#ProduitsCommandes" style={{ textDecoration: "none" }}>Top 10 des produits les plus commandés</Link>,
                icon: <ShoppingCartOutlinedIcon
                    className="icon"
                    style={{
                        backgroundColor: "rgba(218, 165, 32, 0.2)",
                        color: "goldenrod",
                    }}
                />,
            };
            break;

        case "earnings":
            data = {
                title: "GAINS",
                isMoney: true,
                link: <Link to="/dashboard#ProduitsRemu" style={{ textDecoration: "none" }}>Top 10 des produits les plus rémunérateurs</Link>,
                icon: <MonetizationOnOutlinedIcon
                    className="icon"
                    style={{
                        backgroundColor: "rgba(0, 128, 0, 0.2)",
                        color: "green",
                    }}
                />,
            };
            break;

        case "balance":
            data = {
                title: "CLIENTS",
                isMoney: true,
                link: <Link to="/dashboard#ClientCA" style={{ textDecoration: "none" }}>Top 10 des clients les plus rémunérateurs</Link>,
                icon: <AccountBalanceWalletOutlinedIcon
                    className="icon"
                    style={{
                        backgroundColor: "rgba(128, 0, 128, 0.2)",
                        color: "purple",
                    }}
                />,
            };
            break;

        default:
            break;
    }



    return (
        <div className="widget">
            <div className="left">
                <span className="title">{data.title}</span>
                <span className="counter">
                    {data.data}
                </span>
                <span className="link">{data.link}</span>
            </div>
            <div className="right">
                {data.icon}
            </div>
        </div>
    )
}

export { Widget }