<?php

namespace App\Controller;

use App\Entity\DetailCommande;
use App\Repository\DetailCommandeRepository;
use App\Repository\LivraisonRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\ORM\EntityRepository\createQueryBuilder;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class DashboardController extends AbstractController
{
    #[Route('/caperyear', name: 'caperyear')] //-- Chiffre d'affaires mois par mois pour une année sélectionnée
    public function CAPerYear(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->CAPerYear());
    }
    
    #[Route('/caperfou', name: 'caperfou')] //Chiffre d'affaires généré pour un fournisseur
    public function CAPerFou(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->CAPerFou());
    }

    #[Route('/top10commande', name: 'top10commande')] //TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
    public function TOP10Commande(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->TOP10Commande());
    }

    #[Route('/top10remu', name: 'top10remu')] // TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)
    public function TOP10Remu(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->Top10Remu());
    }

    #[Route('/top10clients', name: 'top10clients')] //Top 10 des clients en nombre de commandes ou chiffre d'affaires
    public function TOP10Clients(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->Top10Clients());
    }

    #[Route('/caperclients', name: 'caperclients')] //Répartition du chiffre d'affaires par type de client
    public function CAPerClients(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->CAParClient());
    }

    #[Route('/nbcommandelivraison', name: 'nbcommandelivraison')] //Nombre de commandes en cours de livraison.
    public function NbCommandesLivraison(LivraisonRepository $repo)
    {
        return new JsonResponse($repo->NbCommandesLivraison());
    }
}
