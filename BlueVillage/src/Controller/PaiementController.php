<?php

namespace App\Controller;

use App\Service\Cart\CartService;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PaiementController extends AbstractController
{
    #[Route('/paiement', name: 'app_paiement')]
    public function index2(Request $request, CartService $cartService, RubriqueRepository $repo): Response
    {//On demande a Symfony de nous passer le CartService(Service/Cart/CartService.php)
        
        $rubriques = $repo->findBy(array('rubrique' => null));


        return $this->render('paiement/paiement.html.twig', [
            'controller_name' => 'CartController',
            'items'           => $cartService->getFullCart(),//Fonction du CartService qui permet d'afficher la totalité du panier
            'total'           => $cartService->getTotal(),//Fonction du CartService qui permet d'obtenir le prix total du panier
            'rubrique'        => $rubriques
        ]);
    }

        //Permet de retirer des produits du panier
        #[Route('/remove', name: 'paiement_remove')]
        public function removeAll(CartService $cartService) {
            //On demande a Symfony de nous passer le CartService(Service/Cart/CartService.php)
    
            $cartService->removeAll();//Fonction du CartService qui permet la suppression du produit dans le panier grace a son id
    
            return $this->redirectToRoute("rubrique");//On redirige sur le panier
        }
}