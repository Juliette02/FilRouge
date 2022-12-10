import React from "react";
import { Chart } from "../../components/chart/Chart";
import { Featured } from "../../components/featured/Featured";
import { Navbar } from "../../components/navbar/Navbar";
import { Sidebar } from "../../components/sidebar/Sidebar";
import { List } from "../../components/table/Table";
import { Widget } from "../../components/widget/Widget";
import './Home.scss'

const Home = (props) => {
    return(
        <div className="home">
            <Sidebar/>
            <div className="homeContainer">
                <Navbar/>
                <div className="widgets">
                    <Widget type="user"/>
                    <Widget type="order"/>
                    <Widget type="earnings"/>
                    <Widget type="balance"/>
                </div>
                    <p>Chiffre d'affaires mois par mois : </p>
                <div className="charts">
                    <Chart data={props.caperyear}/>
                    <Featured/>
                </div>
                    <p>Chiffre d'affaires par fournisseur : </p>
                <div className="charts">
                    <Chart data={props.caperfou}/>
                </div>
                    <p>Chiffre d'affaires par type de client : </p>
                <div className="charts">
                    <Chart data={props.caperclients}/>
                </div>
                <div className="listContainer">
                    <div className="listTitle">Dernières commandes</div>
                    <List/>
                </div>
            </div>
        </div>
    )
}
export default Home