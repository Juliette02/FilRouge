import React, { useState , useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { Table, Button } from "semantic-ui-react";
import { fetchSync } from './fetchSync';




const Read = (props) => {

    /* Fonction pour supprimer un produit par son id */
    const onDelete = (id) => {
        fetch(`http://127.0.0.1:8000/api/produits/${id}`, { method: 'DELETE'}) /*Requête de suppression*/
        .then(
            props.onChange() /*On remonte le changement dans App.jsx pour mettre à jour la liste sans le produit supprimé */
        );
    }
    

    return (
        <div>
        <Link to='/'>Retour à la liste</Link>
            <Table singleLine>
                <Table.Header>
                    <Table.Row>
                        <Table.HeaderCell>Id</Table.HeaderCell>
                        <Table.HeaderCell>Nom du produit</Table.HeaderCell>
                        <Table.HeaderCell>Description</Table.HeaderCell>
                        <Table.HeaderCell>Référence Fournisseur</Table.HeaderCell>
                        <Table.HeaderCell>Photo</Table.HeaderCell>
                        <Table.HeaderCell>Prix d'achat</Table.HeaderCell>
                        <Table.HeaderCell>Prix HT</Table.HeaderCell>
                        <Table.HeaderCell>Rubrique</Table.HeaderCell>
                        <Table.HeaderCell>Fournisseur</Table.HeaderCell>
                    </Table.Row>
                </Table.Header>

                {props.data.map( (produit, index) =>

                    <Table.Body key={index}>
                        <Table.Row>
                            <Table.Cell>{produit.id}</Table.Cell>
                            <Table.Cell>{produit.libelleCourt}</Table.Cell>
                            <Table.Cell>{produit.libelleLong}</Table.Cell>
                            <Table.Cell>{produit.referenceFournisseur}</Table.Cell>
                            <Table.Cell>{produit.photo}</Table.Cell>
                            <Table.Cell>{produit.prixAchat}</Table.Cell>
                            <Table.Cell>{produit.prixHorsTaxe}</Table.Cell>
                            <Table.Cell>{produit.rubrique}</Table.Cell>
                            <Table.Cell>{produit.fournisseur}</Table.Cell>
                            
                                <Table.Cell>
                                <Link to={`/update/${produit.id}`}>
                                  Update
                                </Link>
                                </Table.Cell>

                                <Table.Cell>
                                    <Button onClick={() => onDelete(produit.id)}>Delete</Button>
                                </Table.Cell>
                            
                        </Table.Row>
                        
                    </Table.Body>
                )
                }
            </Table>
        </div>
    )
}

export { Read };