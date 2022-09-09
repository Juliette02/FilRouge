import React from "react";
import { Sidebar } from "../../components/sidebar/Sidebar";
import { Navbar } from "../../components/navbar/Navbar";
import "./Dashboard.scss";


const Dashboard = () => {
    return(
        <div className="dashboard">
            <Sidebar/>
            <div className="dashboardContainer">
                <Navbar/>
            </div>
        </div>
    )
}

export {Dashboard};