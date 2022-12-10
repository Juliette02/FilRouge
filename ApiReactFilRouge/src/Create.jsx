import { React, useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';

const Create = (props) => {

    const navigate = useNavigate();

    /* On assigne les valeurs */
    const handleAjout = (e) => {
        e.preventDefault();
        const data = {
            'libelleCourt': libelleCourt,
            'libelleLong': libelleLong,
            'referenceFournisseur': referenceFournisseur,
            'photo': photo,
            'prixAchat': prixAchat,
            'prixHorsTaxe': prixHorsTaxe,
            'rubrique' : rubrique,
            'fournisseur' : fournisseur
        }

        /*Requête de création*/
        fetch('http://127.0.0.1:8000/api/produits', {
            method: 'POST',
            headers: {
                Accept: 'application/json',
                'Content-Type' : 'application/json',
            },
            body: JSON.stringify(data),
        })
            .then(response => response.json())
            .then(props.onChange()); /*On remonte l'info dans App.jsx pour afficher la liste avec le produit ajouté */
         navigate("/");
    }

    const [libelleCourt, setLibelleCourt] = useState('');
    const [libelleLong, setLibelleLong] = useState('');
    const [referenceFournisseur, setReferenceFournisseur] = useState('');
    const [photo, setPhoto] = useState('');
    const [prixAchat, setPrixAchat] = useState('');
    const [prixHorsTaxe, setPrixHorsTaxe] = useState('');
    const [rubrique, setRubrique] = useState('');
    const [fournisseur, setFournisseur] = useState('');

    return (
        <>
            <div>
                Formulaire d'ajout
            </div>

            <hr /><br />
            <form>

                <label htmlFor='nom'>Nom</label><br />
                <input type="text" id="nom" name="libelleCourt" value={libelleCourt} onChange={(e) => setLibelleCourt(e.target.value)} /><br />

                <label htmlFor='description'>Description</label><br />
                <input type="text" id='description' name='libelleLong' value={libelleLong} onChange={(e) => setLibelleLong(e.target.value)} /><br />

                <label htmlFor='referenceFournisseur'>Référence fournisseur</label><br />
                <input type="text" id='referenceFournisseur' name='referenceFournisseur' value={referenceFournisseur} onChange={(e) => setReferenceFournisseur(e.target.value)} /><br />

                <label htmlFor='photo'>Photo</label><br />
                <input type="text" id='photo' name='photo' value={photo} onChange={(e) => setPhoto(e.target.value)} /><br />

                <label htmlFor='prixAchat'>Prix achat</label><br />
                <input type="text" id='prixAchat' name='prixAchat' value={prixAchat} onChange={(e) => setPrixAchat(e.target.value)} /><br />

                <label htmlFor='prixHorsTaxe'>Prix HT</label><br />
                <input type="text" id='prixHorsTaxe' name='prixHorsTaxe' value={prixHorsTaxe} onChange={(e) => setPrixHorsTaxe(e.target.value)} /><br />

                <label htmlFor='rubrique'>Rubrique</label><br />
                <input type="text" id='rubrique' name='rubrique' value={rubrique} onChange={(e) => setRubrique(e.target.value)} /><br />

                <label htmlFor='fournisseur'>Fournisseur</label><br />
                <input type="text" id='fournisseur' name='fournisseur' value={fournisseur} onChange={(e) => setFournisseur(e.target.value)} /><br />

                <br /><button type='submit' onClick={(e) => handleAjout(e)}>Ajouter le produit</button><br /><br />

            </form>
            <Link to="/">Retour à la liste</Link>
        </>
    );
}

export { Create };