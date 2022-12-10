import {React, useState, useEffect} from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { Liste } from './Liste';
import { Create } from './Create';
import { Read } from './Read';
import { Update } from './Update';
import { fetchSync } from './fetchSync';

const App = (props) => {

    const [data, setData] = useState([]);

    /* Récupération de tous les produits que l'on met dans la constante "data" avec setData*/
    useEffect(() => {
        fetchSync('http://127.0.0.1:8000/api/produits', 'get').then( (data) => setData(data) );
    }, [])
    
    /* On met à jour la liste des produits à chaque modification */
    const handleChange = () => {
        fetchSync('http://127.0.0.1:8000/api/produits', 'get').then( (data) => setData(data) );
    }

    return (
        <BrowserRouter>
            <div>
                
            </div>
            <Routes>
                <Route path="/" element={<Liste data={data} />} />
                <Route path="create" element={<Create data={data} onChange={handleChange}/>} />
                <Route path="read"  element={<Read data={data} onChange={handleChange}/>} />
                <Route path="update/:id" element={<Update onChange={handleChange}/>} />           
            </Routes>
        </BrowserRouter>
    );
}

export { App };