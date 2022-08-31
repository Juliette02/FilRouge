import { React, useState, useEffect } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';


const Update = (props) => {
    const [produit, setProduit] = useState({ loading: true, data: undefined })

    const { loading, data } = produit

    const { id: produitId } = useParams()
    
    useEffect(() => {
        fetch(`http://127.0.0.1:8000/api/produits/${produitId}`).then((res) => res.json()).then(res => setProduit({ loading: false, data: res })).catch(e => console.log(e));
    }, [])

    const [nom, setNom] = useState('');
    const [description, setDescription] = useState('');
    const [refFou, setRefFou] = useState('');
    const [image, setImage] = useState('');
    const [prix, setPrix] = useState('');
    const [prixHT, setPrixHT] = useState('');
    const [categorie, setCategorie] = useState('');
    const [fou, setFou] = useState('');

    const navigate = useNavigate();

    const updateData = (e) => {
        e.preventDefault();
        /* On assigne les infos du produit sélectionné*/
        const infos = {
            'id': id,
            'libelleCourt': nom,
            'libelleLong' : description,
            'referenceFournisseur' : refFou,
            'photo' : image,
            'prixAchat' : prix,
            'prixHorsTaxe' : prixHT,
            'rubrique' : categorie,
            'fournisseur' : fou,
        }
        
        
        /* On effectue la requête de modification */
        fetch(`http://127.0.0.1:8000/api/produits/${id}`, {
            method: 'PUT',
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(infos),
            
        })
        .then(props.onChange());/* On fait remonter le changement dans App.jsx pour mettre à jour le produit */
        navigate("/read");
    }


    if (loading) {
        return <p>Loading...</p>
    }

    const { id, libelleCourt, libelleLong, referenceFournisseur, photo, prixAchat, prixHorsTaxe, rubrique, fournisseur } = data;

    if(nom === ''){
        setNom(libelleCourt);
    }

    if(description === ''){
        setDescription(libelleLong);
    }

    if(refFou === ''){
        setRefFou(referenceFournisseur)
    }

    if(image === ''){
        setImage(photo);
    }

    if(prix === ''){
        setPrix(prixAchat);
    }

    if(prixHT === ''){
        setPrixHT(prixHorsTaxe);
    }

    if(categorie === ''){
        setCategorie(rubrique);
    }

    if(fou === ''){
        setFou(fournisseur);
    }


    return (
        <>
            <div>
                Formulaire de modification
            </div>

            <hr /><br />
            <form>

                <label htmlFor='nom'>Nom</label><br />
                <input type="text" id="nom" name="libelleCourt" defaultValue={libelleCourt} onChange={(e) => setNom(e.target.value)} /><br />

                <label htmlFor='description'>Description</label><br />
                <textarea rows='12' cols="90" id='description' name='libelleLong' defaultValue={libelleLong} onChange={(e) => setDescription(e.target.value)} /><br />

                <label htmlFor='referenceFournisseur'>Référence fournisseur</label><br />
                <input type="text" id='referenceFournisseur' name='referenceFournisseur' defaultValue={referenceFournisseur} onChange={(e) => setRefFou(e.target.value)} /><br />

                <label htmlFor='photo'>Photo</label><br />
                <input type="text" id='photo' name='photo' defaultValue={photo} onChange={(e) => setImage(e.target.value)} /><br />

                <label htmlFor='prixAchat'>Prix achat</label><br />
                <input type="text" id='prixAchat' name='prixAchat' defaultValue={prixAchat} onChange={(e) => setPrix(e.target.value)} /><br />

                <label htmlFor='prixHorsTaxe'>Prix HT</label><br />
                <input type="text" id='prixHorsTaxe' name='prixHorsTaxe' defaultValue={prixHorsTaxe} onChange={(e) => setPrixHT(e.target.value)} /><br />

                <label htmlFor='rubrique'>Rubrique</label><br />
                <input type="text" id='rubrique' name='rubrique' defaultValue={rubrique} onChange={(e) => setCategorie(e.target.value)} /><br />

                <label htmlFor='fournisseur'>Fournisseur</label><br />
                <input type="text" id='fournisseur' name='fournisseur' defaultValue={fournisseur} onChange={(e) => setFou(e.target.value)} /><br />

                <br /><button type='submit' onClick={(e) => updateData(e)}>Modifier</button><br /><br />

            </form>
            <Link to="/read">Retour</Link>
        </>
    );
}

export { Update };