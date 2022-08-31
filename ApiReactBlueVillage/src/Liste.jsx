import { Link } from 'react-router-dom';

const Liste = (props) => {

    return (
        <>
            <div>
                <Link to="/create">Ajouter un produit</Link><br/><br/>
                <Link to="/read">Détails des produits</Link><br/><br/>

                Liste : <br/><br/>
                
            </div>
            {
                props.data.map( (produit, index) => 
                    <div key={index}>
                        {produit.libelleCourt} 
                    </div>
                )
            }
        </>
    );
}

export { Liste };