var envoie = '';
var email = document.getElementById('registration_form_email'); // On récupère la valeur du champs
var password = document.getElementById('registration_form_plainPassword'); // On récupère la valeur du champs

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

/*************************************Checkbox Address Facturation*****************************************************************************/

function myFunction1(){

var Facturation = document.getElementById("registration_form_adresseDifference"); // On récupère l'id de la checkbox
// console.log(Facturation.checked);

var Facture = document.getElementById('Facture');// On récupère l'id de la div qui contient les champs facture

if ( Facturation.checked == true ){
    // console.log('Check');
    Facture.style.display = "block"; // On affiche le block
} else {
    Facture.style.display = "none"; // Sinon on laisse le block en none
};
};

/**************************************Checkbox Professionnelle*******************************************************************************/

function myFunction2(){

var Pro = document.getElementById("registration_form_categorie"); // On récupère l'id de la checkbox
// console.log(Pro.checked);

var Professionnelle = document.getElementById('Professionnelle'); // On récupère l'id de la div qui contient les champs de professionnelle

if ( Pro.checked == true ){
    // console.log('Check');
    Professionnelle.style.display = "block"; // On affiche le block
} else {
    Professionnelle.style.display = "none"; // Sinon on laisse le block en none
};
};