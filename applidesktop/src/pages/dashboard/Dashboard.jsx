import React from "react";
import { Sidebar } from "../../components/sidebar/Sidebar";
import { Navbar } from "../../components/navbar/Navbar";
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import "./Dashboard.scss";


const Dashboard = (props) => {

    //console.log(props.data)

    return (
        <div className="dashboard">
            <Sidebar />
            <div className="dashboardContainer">
                <Navbar />
                <div id="ProduitsCommandes">
                    <TableContainer component={Paper} className="table">
                        <strong>TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur) </strong><br />
                        <Table sx={{ minWidth: 650 }} aria-label="simple table">
                            <TableHead>
                                <TableRow>
                                    <TableCell className="tableCellHead">Position</TableCell>
                                    <TableCell className="tableCellHead">Référence</TableCell>
                                    <TableCell className="tableCellHead">Descriptif du produit</TableCell>
                                    <TableCell className="tableCellHead">Quantité commandée</TableCell>
                                    <TableCell className="tableCellHead">Nom du fournisseur</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {props.top10commande?.map((stats, index) => (
                                    <TableRow key={index}>
                                        <TableCell className="tableCell">{index + 1}</TableCell>
                                        <TableCell className="tableCell">{stats.Reference}</TableCell>
                                        <TableCell className="tableCell">{stats.Nomproduit}</TableCell>
                                        <TableCell className="tableCell">{stats.QuantiteCommandee}</TableCell>
                                        <TableCell className="tableCell">{stats.NomFournisseur}</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                </div>
                <div id="ProduitsRemu">
                    <TableContainer component={Paper} className="table">
                        <strong>TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur) </strong><br />
                        <Table sx={{ minWidth: 650 }} aria-label="simple table">
                            <TableHead>
                                <TableRow>
                                    <TableCell className="tableCellHead">Position</TableCell>
                                    <TableCell className="tableCellHead">Référence</TableCell>
                                    <TableCell className="tableCellHead">Descriptif du produit</TableCell>
                                    <TableCell className="tableCellHead">Marge effectuée</TableCell>
                                    <TableCell className="tableCellHead">Nom du fournisseur</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {props.top10remu?.map((stats, index) => (
                                    <TableRow key={index}>
                                        <TableCell className="tableCell">{index + 1}</TableCell>
                                        <TableCell className="tableCell">{stats.Ref}</TableCell>
                                        <TableCell className="tableCell">{stats.DescriptionProduit}</TableCell>
                                        <TableCell className="tableCell">{stats.Marge} €</TableCell>
                                        <TableCell className="tableCell">{stats.NomFou}</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                </div>
                <div id="ClientCA">
                    <TableContainer component={Paper} className="table">
                        <strong>Top 10 des clients par chiffre d'affaires </strong><br />
                        <Table sx={{ minWidth: 650 }} aria-label="simple table">
                            <TableHead>
                                <TableRow>
                                    <TableCell className="tableCellHead">Position</TableCell>
                                    <TableCell className="tableCellHead">Client</TableCell>
                                    <TableCell className="tableCellHead">Chiffre d'affaires</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {props.top10clients?.map((stats, index) => (
                                    <TableRow key={index}>
                                        <TableCell className="tableCell">{index + 1}</TableCell>
                                        <TableCell className="tableCell">{stats.NomClient}</TableCell>
                                        <TableCell className="tableCell">{stats.CAC} €</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                </div>
                {/* {props.top10clients?.map((stats, index) =>
                    <div id={index}>
                        <p>Client : {stats.NomClient}</p>
                        <p>Chiffre d'affaire du client : {stats.CAC} €</p><br/>
                    </div>
                )} */}
                {/* <br/>
                <hr/>
                <strong>Nombre de commandes en cours de livraison : </strong><br/>
                {props.nbcommandeslivraison?.map((stats, index) =>
                    <div id={index}>
                        <p>Nombre de commandes en cours de livraison : {stats.EnCoursDeLivraison}</p>
                    </div>
                )} */}
            </div>
        </div>
    )
}

export { Dashboard };