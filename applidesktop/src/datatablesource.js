export const clientsColumns = [
    { field: 'id', headerName: 'ID', width: 70 },
    { field: 'nom', headerName:'Nom', width: 130},
    { field: 'prenom', headerName:'Prénom', width: 130},
    { field: 'categorie', headerName:'Catégorie', width: 130},
    { field: 'adresseLivraison', headerName:'Adresse de livraison', width: 400, renderCell: (params) => {
        return (
            <> 
                <p>{params.row.adresse_livraison},</p>
                <p>{params.row.cp_livraison},</p>
                <p>{params.row.ville_livraison}</p>
            </>
        );
    },},
    { field: 'mode_paiement', headerName:'Moyen de Paiement', width: 200},
];





export const clientsRows = [
    {
        id: 1,
        nom: "Bazinet",
        prenom: "Jules",
        categorie: "Particulier",
        adresse_livraison: "39193 Lulu Way Apt. 696",
        cp_livraison: "80287",
        ville_livraison: "Baton Rouge",
        mode_paiement: "CB"
    },
    {
        id: 2,
        nom: "Bureau",
        prenom: "Ray",
        categorie: "Particulier",
        adresse_livraison: "4968 Marie Street",
        cp_livraison: "21217",
        ville_livraison: "Baltimore",
        mode_paiement: "CB"
    },
    {
        id: 3,
        nom: "Meilleur",
        prenom: "Parnella",
        categorie: "Particulier",
        adresse_livraison: "3083 Norma Lane",
        cp_livraison: "71201",
        ville_livraison: "Monroe",
        mode_paiement: "CB"
    },
    {
        id: 4,
        nom: "Bouchard",
        prenom: "Percy",
        categorie: "Professionnel",
        adresse_livraison: "1292 Waterview Lane",
        cp_livraison: "88005",
        ville_livraison: "Las Cruces",
        mode_paiement: "Virement/Chèque"
    },
    {
        id: 5,
        nom: "Faure",
        prenom: "Eustache",
        categorie: "Professionnel",
        adresse_livraison: "1728 Meadowview Drive",
        cp_livraison: "22821",
        ville_livraison: "Dayton",
        mode_paiement: "Virement/Chèque"
    },
    {
        id: 6,
        nom: "Flamand",
        prenom: "William",
        categorie: "Professionnel",
        adresse_livraison: "3570 County Line Road",
        cp_livraison: "33602",
        ville_livraison: "Tampa",
        mode_paiement: "CB"
    },
];