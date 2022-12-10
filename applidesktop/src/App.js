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
  const [CAPerYear, setCAPerYear] = useState([]);
  const [CAPerFou, setCAPerFou] = useState([]);
  const [Top10Commande, setTop10Commande] = useState([]);
  const [Top10Remu, setTop10Remu] = useState([]);
  const [Top10Clients, setTop10Clients] = useState([]);
  const [CAPerClients, setCAPerClients] = useState([]);
  const [NbCommandeLivraison, setNbCommandeLivraison] = useState([]);
  const {darkMode} = useContext(darkModeContext);

  /* Récupération de tous les produits que l'on met dans la constante "data" avec setData*/
  useEffect(() => {
      fetchSync('https://alexis.amorce.org/api/produits', 'get').then( (data) => setData(data) );
  }, [])

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/caperyear`, { method: 'GET' })
    .then( response => response.json())
    .then( data => setCAPerYear(data));
  },[])

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/caperfou`, { method: 'GET' })
    .then( response => response.json())
    .then( data => setCAPerFou(data));
  },[])

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/top10commande`, { method: 'GET' })
    .then( response => response.json())
    .then( data => setTop10Commande(data));
  },[])

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/top10remu`, { method: 'GET' })
    .then( response => response.json())
    .then( data => setTop10Remu(data));
  },[])

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/top10clients`, { method: 'GET' })
    .then( response => response.json())
    .then( data => setTop10Clients(data));
  },[])
  
  useEffect(() => {
    fetch(`http://127.0.0.1:8000/caperclients`, { method: 'GET' })
    .then( response => response.json())
    .then( data => setCAPerClients(data));
  },[])

  /* On met à jour la liste des produits à chaque modification */
  const handleChange = () => {
      fetchSync('https://alexis.amorce.org/api/produits', 'get').then( (data) => setData(data));
  }

  // const handleChangeStats = () => {
  //   fetch(`http://127.0.0.1:8000/dashboard`, { method: 'GET' })
  //   .then( response => response.json())
  //   .then( data => setDataDash(data));
  // }

  return (

    <div className={darkMode ? "app dark" : "app"}>
      <BrowserRouter>
          <div>
              
          </div>
          <Routes>
              <Route path='/' element={<Home caperyear={CAPerYear} caperfou={CAPerFou} caperclients={CAPerClients}/>}/>
              <Route path="create" element={<Create data={data} onChange={handleChange}/>} />
              <Route path="liste"  element={<Read data={data} onChange={handleChange}/>} />
              <Route path="update/:id" element={<Update onChange={handleChange}/>} />
              <Route path="clients" element={<Clients/>}/>
              <Route path="dashboard" element={<Dashboard top10commande={Top10Commande} top10remu={Top10Remu} top10clients={Top10Clients} />}/>          
          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
