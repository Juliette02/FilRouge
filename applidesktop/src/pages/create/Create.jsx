import { React, useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { Button } from 'semantic-ui-react';
import { Navbar } from '../../components/navbar/Navbar';
import { Sidebar } from '../../components/sidebar/Sidebar';
import DriveFolderUploadOutlinedIcon from '@mui/icons-material/DriveFolderUploadOutlined';
import "./Create.scss";

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
            'rubrique': rubrique,
            'fournisseur': fournisseur
        }

        /*Requête de création*/
        fetch('https://alexis.amorce.org/api/produits', {
            method: 'POST',
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        })
            .then(response => response.json())
            .then(props.onChange()); /*On remonte l'info dans App.jsx pour afficher la liste avec le produit ajouté */
        navigate("/liste");
    }

    const upload = (e) => {
        setPhoto(e.target.value);
        setFile(e.target.files[0]);
    }

    const [file, setFile] = useState('');
    const [libelleCourt, setLibelleCourt] = useState('');
    const [libelleLong, setLibelleLong] = useState('');
    const [referenceFournisseur, setReferenceFournisseur] = useState('');
    const [photo, setPhoto] = useState('');
    const [prixAchat, setPrixAchat] = useState('');
    const [prixHorsTaxe, setPrixHorsTaxe] = useState('');
    const [rubrique, setRubrique] = useState('');
    const [fournisseur, setFournisseur] = useState('');

    return (
        <div className='create'>
            <Sidebar />
            <div className='createContainer'>
                <Navbar />

                <div className='top'>
                    <h1>Ajouter un produit</h1>
                </div>

                <div className='bottom'>

                    <div className='left'>
                        <img
                            src={file ? URL.createObjectURL(file) : "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg"}
                            alt=""
                        />

                    </div>

                    <div className='right'>

                        <form className='addForm'>

                            <div className='formInput'>
                                <label htmlFor='photo'>Image : <DriveFolderUploadOutlinedIcon className='icon'/></label><br />
                                <input type="file" id='photo' name='photo' style={{ display: "none" }} onChange={upload} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='nom'>Nom</label><br />
                                <input type="text" id="nom" name="libelleCourt" placeholder='Produit trop génial' value={libelleCourt} onChange={(e) => setLibelleCourt(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='description'>Description</label><br />
                                <input type="text" id='description' name='libelleLong' placeholder='Bois de chêne, acier trempé,...' value={libelleLong} onChange={(e) => setLibelleLong(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='referenceFournisseur'>Référence fournisseur</label><br />
                                <input type="text" id='referenceFournisseur' name='referenceFournisseur' placeholder='PRO160' value={referenceFournisseur} onChange={(e) => setReferenceFournisseur(e.target.value)} /><br />
                            </div>


                            {/*                             <div className='formInput'>
                                <label htmlFor='photo'>Photo</label><br />
                                <input type="text" id='photo' name='photo' value={photo} onChange={(e) => setPhoto(e.target.value)} /><br />
                            </div> */}

                            <div className='formInput'>
                                <label htmlFor='prixAchat'>Prix achat</label><br />
                                <input type="text" id='prixAchat' name='prixAchat' placeholder='150' value={prixAchat} onChange={(e) => setPrixAchat(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='prixHorsTaxe'>Prix HT</label><br />
                                <input type="text" id='prixHorsTaxe' name='prixHorsTaxe' placeholder='160' value={prixHorsTaxe} onChange={(e) => setPrixHorsTaxe(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='rubrique'>Rubrique</label><br />
                                <input type="text" id='rubrique' name='rubrique' placeholder='/api/rubriques/1' value={rubrique} onChange={(e) => setRubrique(e.target.value)} /><br />
                            </div>

                            <div className='formInput'>
                                <label htmlFor='fournisseur'>Fournisseur</label><br />
                                <input type="text" id='fournisseur' name='fournisseur' placeholder='/api/fournisseurs/1' value={fournisseur} onChange={(e) => setFournisseur(e.target.value)} /><br />
                            </div>
                                <button className='boutonAjout' onClick={(e) => handleAjout(e)}>Ajouter le produit</button>
                                {/* <Link to="/liste"><Button className='boutonRetour'>Retour à la liste</Button></Link> */}
                        </form>
                    </div>
                </div>
            </div>
        </div>
    );
}

export { Create };