<?php

namespace App\Controller;

use App\Service\Cart\CartService;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{
    //Permet d'afficher le panier
    #[Route('/cart', name: 'app_cart')]
    public function index(CartService $cartService, RubriqueRepository $repo): Response
    {//On demande a Symfony de nous passer le CartService(Service/Cart/CartService.php)
        
        $rubriques = $repo->findBy(array('rubrique' => null));


        return $this->render('cart/index.html.twig', [
            'controller_name' => 'CartController',
            'items'           => $cartService->getFullCart(),//Fonction du CartService qui permet d'afficher la totalité du panier
            'total'           => $cartService->getTotal(),//Fonction du CartService qui permet d'obtenir le prix total du panier
            'rubrique'        => $rubriques
        ]);
    }


    #[Route('/paiement', name: 'app_paiement')]
    public function index2(CartService $cartService, RubriqueRepository $repo): Response
    {//On demande a Symfony de nous passer le CartService(Service/Cart/CartService.php)
        
        $rubriques = $repo->findBy(array('rubrique' => null));


        return $this->render('paiement/paiement.html.twig', [
            'controller_name' => 'CartController',
            'items'           => $cartService->getFullCart(),//Fonction du CartService qui permet d'afficher la totalité du panier
            'total'           => $cartService->getTotal(),//Fonction du CartService qui permet d'obtenir le prix total du panier
            'rubrique'        => $rubriques
        ]);
    }


    //Permet d'ajouter des produits dans le panier
    #[Route('/cart/add/{id}', name:'cart_add')]
    public function add($id, CartService $cartService) {
        //On demande a Symfony de nous passer le CartService(Service/Cart/CartService.php)


        $cartService->add($id); //On appelle la fonction add() du CartService pour lui passer l'id du produit à ajouter au panier

        return $this->redirectToRoute("app_cart");//On redirige sur le panier une fois un produit ajouté
    }

    //Permet de retirer des produits du panier
    #[Route('/cart/remove/{id}', name: 'cart_remove'  )]
    public function remove($id, CartService $cartService) {
        //On demande a Symfony de nous passer le CartService(Service/Cart/CartService.php)


        $cartService->remove($id);//Fonction du CartService qui permet la suppression du produit dans le panier grace a son id

        return $this->redirectToRoute("app_cart");//On redirige sur le panier
    }
}
