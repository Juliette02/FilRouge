import React from "react";
import "./Table.scss";
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

const List = () => {

    const rows = [
        {
            id: 1,
            numero_client: 1,
            date: "2022-05-17",
            adresse_livraison: "39193 Lulu Way Apt. 696",
            cp_livraison: "80287",
            ville_livraison: "Baton Rouge",
            adresse_facture: "39193 Lulu Way Apt. 696",
            cp_facture: "80287",
            ville_facture: "Baton Rouge",
            date_facture: "2022-05-17",
            status: "Livré",
        },
        {
            id: 2,
            numero_client: 4,
            date: "2022-05-17",
            adresse_livraison: "1292 Waterview Lane",
            cp_livraison: "88005",
            ville_livraison: "Las Cruces",
            adresse_facture: "2212 Neville Street",
            cp_facture: "80287",
            ville_facture: "Terre Haute",
            date_facture: "2022-05-26",
            status: "Livraison",
        },
        {
            id: 3,
            numero_client: 3,
            date: "2022-05-17",
            adresse_livraison: "3083 Norma Lane",
            cp_livraison: "71201",
            ville_livraison: "Monroe",
            adresse_facture: "3083 Norma Lane",
            cp_facture: "71201",
            ville_facture: "Monroe",
            date_facture: "2022-05-17",
            status: "Livré",
        },
        {
            id: 4,
            numero_client: 2,
            date: "2022-05-17",
            adresse_livraison: "4968 Marie Street",
            cp_livraison: "21217",
            ville_livraison: "Baltimore",
            adresse_facture: "4968 Marie Street",
            cp_facture: "21217",
            ville_facture: "Baltimore",
            date_facture: "2022-05-17",
            status: "Livré",
        },
        {
            id: 5,
            numero_client: 6,
            date: "2022-04-03",
            adresse_livraison: "3570 County Line Road",
            cp_livraison: "33602",
            ville_livraison: "Tampa",
            adresse_facture: "2511 Mount Olive Road",
            cp_facture: "30501",
            ville_facture: "Gainesville",
            date_facture: "2022-06-03",
            status: "Livraison",
        },
        {
            id: 6,
            numero_client: 5,
            date: "2022-04-03",
            adresse_livraison: "1728 Meadowview Drive",
            cp_livraison: "22821",
            ville_livraison: "Dayton",
            adresse_facture: "1728 Meadowview Drive",
            cp_facture: "22821",
            ville_facture: "Dayton",
            date_facture: "2022-05-17",
            status: "Livré",
        },
    ]

    return (
            <TableContainer component={Paper} className="table">
                <Table sx={{ minWidth: 650 }} aria-label="simple table">
                    <TableHead>
                        <TableRow>
                            <TableCell className="tableCellHead">Numéro de commande</TableCell>
                            <TableCell className="tableCellHead">Numéro de client</TableCell>
                            <TableCell className="tableCellHead">Date</TableCell>
                            <TableCell className="tableCellHead">Adresse de livraison</TableCell>
                            <TableCell className="tableCellHead">Code postal de livraison</TableCell>
                            <TableCell className="tableCellHead">Ville de livraison</TableCell>
                            <TableCell className="tableCellHead">Adresse de facturation</TableCell>
                            <TableCell className="tableCellHead">Code postal de facturation</TableCell>
                            <TableCell className="tableCellHead">Ville de facturation</TableCell>
                            <TableCell className="tableCellHead">Date de facturation</TableCell>
                            <TableCell className="tableCellHead">Status</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {rows.map((row) => (
                            <TableRow key={row.id}>
                                <TableCell className="tableCell">{row.id}</TableCell>
                                <TableCell className="tableCell">{row.numero_client}</TableCell>
                                <TableCell className="tableCell">{row.date}</TableCell>
                                <TableCell className="tableCell">{row.adresse_livraison}</TableCell>
                                <TableCell className="tableCell">{row.cp_livraison}</TableCell>
                                <TableCell className="tableCell">{row.ville_livraison}</TableCell>
                                <TableCell className="tableCell">{row.adresse_facture}</TableCell>
                                <TableCell className="tableCell">{row.cp_facture}</TableCell>
                                <TableCell className="tableCell">{row.ville_facture}</TableCell>
                                <TableCell className="tableCell">{row.date_facture}</TableCell>
                                <TableCell className="tableCell">
                                    <span className={`status ${row.status}`}>{row.status}</span>
                                </TableCell>

                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
    )
}

export { List }