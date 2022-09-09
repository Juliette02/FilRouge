import {React, useState, useEffect, useContext} from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { Create } from './pages/create/Create';
import { Read } from './pages/list/Liste';
import { Update } from './pages/update/Update';
import { fetchSync } from './components/fetchSync';
import { Clients } from './pages/clients/Clients';
import { Dashboard } from './pages/dashboard/Dashboard';
import Home from './pages/home/Home';
import "./style/dark.scss";
import { darkModeContext } from './context/darkModeContext';

function App() {
  const [data, setData] = useState([]);
  const {darkMode} = useContext(darkModeContext);

  /* Récupération de tous les produits que l'on met dans la constante "data" avec setData*/
  useEffect(() => {
      fetchSync('https://alexis.amorce.org/api/produits', 'get').then( (data) => setData(data) );
  }, [])
  
  /* On met à jour la liste des produits à chaque modification */
  const handleChange = () => {
      fetchSync('https://alexis.amorce.org/api/produits', 'get').then( (data) => setData(data) );
  }

  return (

    <div className={darkMode ? "app dark" : "app"}>
      <BrowserRouter>
          <div>
              
          </div>
          <Routes>
              <Route path='/' element={<Home/>}/>
              <Route path="create" element={<Create data={data} onChange={handleChange}/>} />
              <Route path="liste"  element={<Read data={data} onChange={handleChange}/>} />
              <Route path="update/:id" element={<Update onChange={handleChange}/>} />
              <Route path="clients" element={<Clients/>}/>
              <Route path="dashboard" element={<Dashboard/>}/>          
          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
