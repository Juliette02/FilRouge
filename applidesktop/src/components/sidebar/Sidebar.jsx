import React, {useContext}from "react";
import "./Sidebar.scss";
import DashboardIcon from '@mui/icons-material/Dashboard';
import Person2OutlinedIcon from '@mui/icons-material/Person2Outlined';
import Inventory2OutlinedIcon from '@mui/icons-material/Inventory2Outlined';
import { Link } from "react-router-dom";
import { darkModeContext } from "../../context/darkModeContext";

const Sidebar = () => {

    const {dispatch} = useContext(darkModeContext);

    return(
        <div className="sidebar">
            <div className="top">
                <Link to="/" style={{ textDecoration: "none" }}>
                    <span className="logo">The Blue Village</span>
                </Link>
            </div>
            <hr/>
            <div className="center">
                <ul>
                    <p className="title">Performances</p>
                    <Link to="/dashboard" style={{ textDecoration: "none" }}>
                    <li>
                    <DashboardIcon className="icon"/>
                        <span>Tableau de bord</span>
                    </li>
                    </Link>

                    <p className="title">Clients</p>
                    <Link to="/clients" style={{ textDecoration: "none" }}>
                        <li>
                            <Person2OutlinedIcon className="icon"/>
                            <span>Liste des clients</span>
                        </li>
                    </Link>
                    <p className="title">Produits</p>
                    <Link to="/liste" style={{ textDecoration: "none" }}>
                        <li>
                            <Inventory2OutlinedIcon className="icon"/>
                            <span>Liste des produits</span>
                        </li>
                    </Link>
                </ul>
            </div>
            <div className="bottom">
                <div className="colorOption" onClick={()=> dispatch({type: "LIGHT"})}></div>
                <div className="colorOption" onClick={()=> dispatch({type: "DARK"})}></div>
            </div>
        </div>
    )
}
export {Sidebar};