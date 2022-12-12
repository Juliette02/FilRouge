<?php

namespace App\Service\Cart;

use App\Repository\ProduitRepository;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class CartService
{

    protected $session;
    protected $produitRepository;

    public function __construct(SessionInterface $session, ProduitRepository $produitRepository)
    {
        $this->session = $session; //On récupère la session
        $this->produitRepository = $produitRepository; //On récupère la totalité des produits
    }


    //Permet l'ajout d'un produit au panier grace à son id
    public function add(int $id)
    {
        $panier = $this->session->get('panier', []); //On récupère le panier de la session, si vide le panier est un tableau vide

        if (!empty($panier[$id])) {

            //Si la panier n'est pas vide on incrémente la quantité du produit dan le panier par 1
            $panier[$id]++;
        } else {

            //Sinon la quantité du produit = 1
            $panier[$id] = 1;
        }

        $this->session->set('panier', $panier); //On dit que le panier de la session devient le panier modifié
    }


    //Permet la suppression d'un produit du panier grace à son id
    public function remove(int $id)
    {
        $panier = $this->session->get('panier', []); //On récupère le panier de la session, si vide le panier est un tableau vide

        if (!empty($panier[$id])) {

            //Si le panier n'est pas vide, on supprime le produit
            unset($panier[$id]);
        }

        $this->session->set('panier', $panier); //On dit que le panier de la session devient le panier modifié
    }

    public function removeAll()
    {
        $panier = $this->session->get('panier', []);//On récupère le panier de la session, si vide le panier est un tableau vide
        
        unset($panier);
    
        $this->session->set('panier', []); //On dit que le panier de la session devient le panier modifié
    }


    //Permet d'obtenir l'intégralité du panier
    public function getFullCart(): array
    {
        $panier = $this->session->get('panier', []);//On récupère le panier de la session, si vide le panier est un tableau vide

        $panierWithData = [];//Variable qui va contenir le panier avec le nom, le prix...

        foreach ($panier as $id => $quantity) {//On extrait l'id et la quantité de produit dans le panier
            $panierWithData[] = [
                'produit' => $this->produitRepository->find($id),//On récupère le nom du produit grace a son id
                'quantity' => $quantity//On récupère la quantité du produit
            ];
        }

        return $panierWithData;//On return le panier avec toutes les infos
    }


    //Permet d'obtenir le total du panier
    public function getTotal(): float
    {
        //Par défaut le total = 0
        $total = 0;
        $fdp = 0;

        foreach ($this->getFullCart() as $item) {//Pour chaque produit dans le panier

            $total += $item['produit']->getPrixHorsTaxe() * $item['quantity'];//On dit que le total = Prix du produit * la quantité de ce produtit
        }

        if($total <= 500){
            $fdp = 10;
        }else{
            $fdp = 0;
        }
        $total += $fdp;

        return $total;//On return le total
    }
}
