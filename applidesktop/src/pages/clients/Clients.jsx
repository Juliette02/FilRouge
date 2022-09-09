import React from "react";
import { Datatable } from "../../components/datatable/Datatable";
import { Navbar } from "../../components/navbar/Navbar";
import { Sidebar } from "../../components/sidebar/Sidebar";
import "./Clients.scss";

const Clients = () => {
    return(
        <div className="clients">
            <Sidebar/>
            <div className="clientsContainer">
                <Navbar/>
                <Datatable className="datatable"/>
            </div>
        </div>
    )
}
export {Clients}