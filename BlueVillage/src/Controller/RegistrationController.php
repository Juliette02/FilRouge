<?php

namespace App\Controller;

use App\Entity\Client;
use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Repository\RubriqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager, RubriqueRepository $repo): Response
    {
        $rubriques = $repo->findBy(array('rubrique' => null));
        $user = new User();
        $client = new Client();
        $form = $this->createForm(RegistrationFormType::class);
        $form->handleRequest($request);

      
        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password  
            $user->setPassword(
            $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $email = $form->get('email')->getData();
            $user->setEmail($email);

            $nom = $form->get('nom')->getData();
            $prenom = $form->get('prenom')->getData();

            $adresseLivraison = $form->get('adresseLivraison')->getData();
            $cpLivraison = $form->get('cpLivraison')->getData();
            $villeLivraison = $form->get('villeLivraison')->getData();

            $categorie = $form->get('categorie')->getData();
            $adresseDifference = $form->get('adresseDifference')->getData();

            $nomEntreprise = $form->get('nomEntreprise')->getData();
            $numeroSiret = $form->get('numeroSiret')->getData();

            if ($adresseDifference == false) {             // Si la checkbox "Categorie" n'est pas coché, les informations de facture sont les memes que la livraison
                $adresseFacture = $form->get('adresseLivraison')->getData();
                $cpFacture = $form->get('cpLivraison')->getData();
                $villeFacture = $form->get('villeLivraison')->getData();
            }

            else if ($adresseDifference == true) {         // Si la checkbox "Categorie" est pas coché, le client doit renseigner les informations de la facture
                $adresseFacture = $form->get('adresseFacture')->getData();
                $cpFacture = $form->get('cpFacture')->getData();
                $villeFacture = $form->get('villeFacture')->getData();
            }

            if ($categorie == false) {              // Si la checkbox "Categorie" n'est pas coché, le client est un particulier et cela est rentré en BDD
                $client->setCategorie('Particulier');
                $client->setModePaiement('CB');
            }

            else if ($categorie == true) {           // Si la checkbox "Categorie" est coché, le client est un professionnel et cela est rentré en BDD
                $client->setCategorie('Professionnel');
                $client->setModePaiement('Virement/Chèque');
            }

            
            $client->setNom($nom);
            $client->setPrenom($prenom);
            $client->setAdresseLivraison($adresseLivraison);
            $client->setCpLivraison($cpLivraison);
            $client->setVilleLivraison($villeLivraison);
            $client->setAdresseFacture($adresseFacture);
            $client->setCpFacture($cpFacture);
            $client->setVilleFacture($villeFacture);
            $client->setNomEntreprise($nomEntreprise);
            $client->setNumeroSiret($numeroSiret);

            $client->setReduction('1');
            $client->setCoefficient('1');

            $user->setClient($client);
            $entityManager->persist($user);
            $entityManager->persist($client);
            $entityManager->flush();

            return $this->redirectToRoute('rubrique');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
            'rubrique'         => $rubriques
        ]);
    }
}
