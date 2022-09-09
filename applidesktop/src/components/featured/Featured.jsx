import React from "react";
import "./Featured.scss";
import MoreVertOutlinedIcon from '@mui/icons-material/MoreVertOutlined';
import KeyboardArrowUpOutlinedIcon from '@mui/icons-material/KeyboardArrowUpOutlined';
import KeyboardArrowDownOutlinedIcon from '@mui/icons-material/KeyboardArrowDownOutlined';
import { CircularProgressbar } from "react-circular-progressbar";
import "react-circular-progressbar/dist/styles.css";


const Featured = () => {
    return (
        <div className="featured">
            <div className="top">
                <h1 className="title">Revenu Total</h1>
                <MoreVertOutlinedIcon fontSize="small"/>
            </div>
            <div className="bottom">
                <div className="featuredChart">
                    <CircularProgressbar value={70} text={"70%"} strokeWidth={5}/>
                </div>
                <p className="title">Ventes du jour</p>
                <p className="amount">$420</p>
                <p className="desc">Description ici</p>
                <div className="summary">
                    <div className="item">
                        <div className="itemTitle">Target</div>
                        <div className="itemResult negative">
                        <KeyboardArrowDownOutlinedIcon fontSize="small"/>
                            <div className="resultAmount">$12.4k</div>
                        </div>
                    </div>
                    <div className="item">
                        <div className="itemTitle">Last week</div>
                        <div className="itemResult positive">
                        <KeyboardArrowDownOutlinedIcon fontSize="small"/>
                            <div className="resultAmount">$12.4k</div>
                        </div>
                    </div>
                    <div className="item">
                        <div className="itemTitle">Last Month</div>
                        <div className="itemResult positive">
                        <KeyboardArrowDownOutlinedIcon fontSize="small"/>
                            <div className="resultAmount">$12.4k</div>
                        </div>
                    </div>
                    <div className="item"></div>
                    <div className="item"></div>
                </div>
            </div>

        </div>
    )
}

export {Featured}