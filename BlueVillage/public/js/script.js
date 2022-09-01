$("#new_edit_utilisateur").on('submit', function(){
    if($("#utilisateur_password").val() != $("#verifpass").val()) {
        //implémntez votre code
        alert("Les deux mots de passe saisies sont différents");
        alert("Merci de renouveler l'opération");
        return false;
    }
});

    document.getElementById('btnpayernonvalide').onclick = function() {
    {
        console.log('Check');
        document.querySelector('.msgconnexion').style.opacity = "1";
    } 
    };


    function myFunction3(){

        var facturation = document.querySelector("#checkboxliv123"); // On récupère l'id de la checkbox
        // console.log(Pro.checked);
        
        var inputfacturation = document.getElementById('inputfacturation'); // On récupère l'id de la div qui contient les champs de professionnelle
        
        if ( facturation.checked == true ){
            // console.log('Check');
            inputfacturation.style.display = "block"; // On affiche le block
        } else {
            inputfacturation.style.display = "none"; // Sinon on laisse le block en none
        };
        };

        