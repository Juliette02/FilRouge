import { React, useState, useEffect } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { Button } from 'semantic-ui-react';
import { Navbar } from '../../components/navbar/Navbar';
import { Sidebar } from '../../components/sidebar/Sidebar';
import DriveFolderUploadOutlinedIcon from '@mui/icons-material/DriveFolderUploadOutlined';
import "./Update.scss";


const Update = (props) => {
    const [produit, setProduit] = useState({ loading: true, data: undefined })

    const { loading, data } = produit

    const { id: produitId } = useParams()

    useEffect(() => {
        fetch(`https://127.0.0.1/api/produits/${produitId}`).then((res) => res.json()).then(res => setProduit({ loading: false, data: res })).catch(e => console.log(e));
    }, [])

    const [file, setFile] = useState('');
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
            'libelleLong': description,
            'referenceFournisseur': refFou,
            'photo': image,
            'prixAchat': prix,
            'prixHorsTaxe': prixHT,
            'rubrique': categorie,
            'fournisseur': fou,
        }


        /* On effectue la requête de modification */
        fetch(`https://alexis.amorce.org/api/produits/${id}`, {
            method: 'PUT',
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(infos),

        })
            .then(props.onChange());/* On fait remonter le changement dans App.jsx pour mettre à jour le produit */
        navigate("/liste");
    }

    const upload = (e) => {
        setImage(e.target.value);
        setFile(e.target.files[0]);
    }


    if (loading) {
        return <p>Loading...</p>
    }

    const { id, libelleCourt, libelleLong, referenceFournisseur, photo, prixAchat, prixHorsTaxe, rubrique, fournisseur } = data;

    if (nom === '') {
        setNom(libelleCourt);
    }

    if (description === '') {
        setDescription(libelleLong);
    }

    if (refFou === '') {
        setRefFou(referenceFournisseur)
    }

    if (image === '') {
        setImage(photo);
    }

    if (prix === '') {
        setPrix(prixAchat);
    }

    if (prixHT === '') {
        setPrixHT(prixHorsTaxe);
    }

    if (categorie === '') {
        setCategorie(rubrique);
    }

    if (fou === '') {
        setFou(fournisseur);
    }


    return (
        <div className='update'>
            <Sidebar />
            <div className='updateContainer'>
                <Navbar />

                <div className='top'>
                    <h1>Formulaire de modification</h1>
                </div>


                <div className='bottom'>

                    <div className='left'>
                        <img
                            src={file ? URL.createObjectURL(file) : "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg"}
                            alt=""
                        />
                    </div>

                    <div className='right'>

                        <form className='updateForm'>

                            <div className='formInput'>
                                <label htmlFor='photo'>Image : <DriveFolderUploadOutlinedIcon className='icon'/></label><br />
                                <input type="file" id='photo' name='photo' style={{ display: "none" }} onChange={upload} /><br />
                            </div>


                            <div className='formInput'>
                                <label htmlFor='description' className='labelField'>Description</label><br />
                                <textarea rows='6' cols="90" id='description' name='libelleLong' className='inputField' defaultValue={libelleLong} onChange={(e) => setDescription(e.target.value)} /><br />
                            </div>


                            <div className='formInput'>
                                <label htmlFor='nom' className='labelField'>Nom</label><br />
                                <input type="text" id="nom" name="libelleCourt" className='inputField' defaultValue={libelleCourt} onChange={(e) => setNom(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='referenceFournisseur' className='labelField'>Référence fournisseur</label><br />
                                <input type="text" id='referenceFournisseur' name='referenceFournisseur' className='inputField' defaultValue={referenceFournisseur} onChange={(e) => setRefFou(e.target.value)} /><br />
                            </div>

{/*                             <div className='formInput'>
                                <label htmlFor='photo' className='labelField'>Photo</label><br />
                                <input type="text" id='photo' name='photo' className='inputField' defaultValue={photo} onChange={(e) => setImage(e.target.value)} /><br />
                            </div> */}

                            <div className='formInput'>
                                <label htmlFor='prixAchat' className='labelField'>Prix achat</label><br />
                                <input type="text" id='prixAchat' name='prixAchat' className='inputField' defaultValue={prixAchat} onChange={(e) => setPrix(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='prixHorsTaxe' className='labelField'>Prix HT</label><br />
                                <input type="text" id='prixHorsTaxe' name='prixHorsTaxe' className='inputField' defaultValue={prixHorsTaxe} onChange={(e) => setPrixHT(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='rubrique' className='labelField'>Rubrique</label><br />
                                <input type="text" id='rubrique' name='rubrique' className='inputField' defaultValue={rubrique} onChange={(e) => setCategorie(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='fournisseur' className='labelField'>Fournisseur</label><br />
                                <input type="text" id='fournisseur' name='fournisseur' className='inputField' defaultValue={fournisseur} onChange={(e) => setFou(e.target.value)} /><br />
                            </div>

                            <div className='boutons'>
                                <button type='submit' className='boutonUpdate' onClick={(e) => updateData(e)}>Modifier</button><br /><br />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    );
}

export { Update };