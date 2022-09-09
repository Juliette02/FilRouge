import React from "react";
import "./Datatable.scss";
import { DataGrid } from '@mui/x-data-grid';
import { clientsColumns, clientsRows } from "../../datatablesource";




const Datatable = () => {
    return (
        <div className="datatable">
            <div style={{ height: 430, width: '100%' }}>
                <DataGrid
                    className="datagrid"
                    rows={clientsRows}
                    columns={clientsColumns}
                    pageSize={6}
                    rowsPerPageOptions={[6]}
                    checkboxSelection
                />
            </div>
        </div>
    )
}

export { Datatable }