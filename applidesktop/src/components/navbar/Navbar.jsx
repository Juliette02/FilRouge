import React from "react";
import "./Navbar.scss";
import { Link } from "react-router-dom";
import SearchOutlinedIcon from '@mui/icons-material/SearchOutlined';
import LanguageOutlinedIcon from '@mui/icons-material/LanguageOutlined';
import HomeIcon from '@mui/icons-material/Home';

const Navbar = () => {
    return(
        <div className="navbar">
            <div className="wrapper">
                <div className="search">
                    <input type="text" placeholder="Rechercher..."/>
                    <SearchOutlinedIcon/>
                </div>
                <div className="items">
                    <div className="item">
                        <LanguageOutlinedIcon className="icon"/>
                        Français
                    </div>
                    <div className="item">
                        <Link to='/' className="homeLink">
                            <HomeIcon className="icon"/>
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    )
}

export  {Navbar}