import React from "react";
import { Link } from "react-router-dom";
import { Button } from "semantic-ui-react";
import "./Liste.scss";
import { Sidebar } from '../../components/sidebar/Sidebar';
import { Navbar } from '../../components/navbar/Navbar';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import AddIcon from '@mui/icons-material/Add';




const Read = (props) => {

    /* Fonction pour supprimer un produit par son id */
    const onDelete = (id) => {
        fetch(`https://alexis.amorce.org/api/produits/${id}`, { method: 'DELETE' }) /*Requête de suppression*/
            .then(
                props.onChange() /*On remonte le changement dans App.jsx pour mettre à jour la liste sans le produit supprimé */
            );
    }


    return (
        <div className='list'>
            <Sidebar />
            <div className='listContainer'>
                <Navbar />
                <div className="liens">
                    <Link to='/create'><AddIcon className="addIcon"/></Link><br /><br />
                </div>
                <TableContainer component={Paper} className="table">
                    <Table sx={{ minWidth: 650 }} aria-label="simple table">
                        <TableHead>
                            <TableRow>
                                <TableCell className="cellTitle">Id</TableCell>
                                <TableCell className="cellTitle">Nom du produit</TableCell>
                                <TableCell className="cellTitle">Description</TableCell>
                                <TableCell className="cellTitle">Référence Fournisseur</TableCell>
                                <TableCell className="cellTitle">Photo</TableCell>
                                <TableCell className="cellTitle">Prix d'achat</TableCell>
                                <TableCell className="cellTitle">Prix HT</TableCell>
                                <TableCell className="cellTitle">Rubrique</TableCell>
                                <TableCell className="cellTitle">Fournisseur</TableCell>
                                <TableCell className="cellTitle">Actions</TableCell>
                            </TableRow>
                        </TableHead>

                        {props.data.map((produit, index) =>

                            <TableBody key={index}>
                                <TableRow>
                                    <TableCell className="cellContent">{produit.id}</TableCell>
                                    <TableCell className="cellContent">{produit.libelleCourt}</TableCell>
                                    <TableCell className="cellContent">{produit.libelleLong}</TableCell>
                                    <TableCell className="cellContent">{produit.referenceFournisseur}</TableCell>
                                    <TableCell className="cellContent">{produit.photo}</TableCell>
                                    <TableCell className="cellContent">{produit.prixAchat}</TableCell>
                                    <TableCell className="cellContent">{produit.prixHorsTaxe}</TableCell>
                                    <TableCell className="cellContent">{produit.rubrique}</TableCell>
                                    <TableCell className="cellContent">{produit.fournisseur}</TableCell>

                                        <TableCell className="actions">
                                            <Link to={`/update/${produit.id}`}>
                                                <Button className="updateButton">Update</Button>
                                            </Link>
                                        </TableCell>

                                        <TableCell className="actions">
                                            <Button className="deleteButton" onClick={() => onDelete(produit.id)}>Delete</Button>
                                        </TableCell>
                                </TableRow>

                            </TableBody>
                        )
                        }
                    </Table>
                </TableContainer>
            </div>
        </div>





    )
}

export { Read };