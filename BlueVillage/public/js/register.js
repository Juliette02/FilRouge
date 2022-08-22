    var envoie = '';
    var email = document.getElementById('registration_form_email'); // On récupère la valeur du champs
    var password = document.getElementById('registration_form_plainPassword'); // On récupère la valeur du champs
    var adresseDifference = document.getElementById('registration_form_adresseDifference').checked; // On récupère la valeur du checkbox 
    var labelVilleFacture = document.getElementById('registration_form_adresseFacture');

    var e = /^([a-zA-Z0-9\-\.]+@[a-zA-Z0-9\-\.]+\.[a-z]{2,5})$/; // Regex pour un email

    // Regex pour un mot-de-passe
    // Au moins 1 majuscules, 1 minuscule, 1 chiffre et une longeur de 6
    var p = /^(?=.{6,}$)(?=(?:.*[A-Z]){1})(?=.*[a-z])(?=(?:.*[0-9]){1}).*/; 


    // Champ email :

    if(email.value == '') {
        // Si champ vide :
        E1 = '';
    } else if (!e.test(email.value)) {
        // Si champ ne correspond pas au regex :
        E1 = '';
    } else {
        // Si OK :
        E1 = '';
    }
    // document.getElementById('E1').innerHTML = E1; 

    // Champ Password : 
    
    if(password.value == '') {
        // Si champ vide
        E2 = ' ';
    } else if (!p.test(password.value)) {
        // Si champ ne correspond pas au regex : 
        E2 = ' ';
    } else {
        // Si OK : 
        E2 ='';
    }
    // document.getElementById('E2').innerHTML = E2;

    // Champ pour envoyé form :

    if (E1+E2 != "") {
        e.preventDefault;
    } else {
        envoie = "Formulaire envoyé !"
        alert(envoie);
    }


    // if (adresseDifference == false) {
    //     console.log("Uncheck");
    //     labelVilleFacture.disabled = true;
    // }

    // if (adresseDifference == true) {
    //     console.log("Check");
    //     labelVilleFacture.disabled = false;
    // }
