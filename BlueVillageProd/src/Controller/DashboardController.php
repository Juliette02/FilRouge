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
    #[Route('/caperyear', name: 'caperyear')]
    public function CAPerYear(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->CAPerYear());
    }
    
    #[Route('/caperfou', name: 'caperfou')]
    public function CAPerFou(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->CAPerFou());
    }

    #[Route('/top10commande', name: 'top10commande')]
    public function TOP10Commande(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->TOP10Commande());
    }

    #[Route('/top10remu', name: 'top10remu')]
    public function TOP10Remu(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->Top10Remu());
    }

    #[Route('/top10clients', name: 'top10clients')]
    public function TOP10Clients(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->Top10Clients());
    }

    #[Route('/caperclients', name: 'caperclients')]
    public function CAPerClients(DetailCommandeRepository $repo)
    {
        return new JsonResponse($repo->CAParClient());
    }

    #[Route('/nbcommandelivraison', name: 'nbcommandelivraison')]
    public function NbCommandesLivraison(LivraisonRepository $repo)
    {
        return new JsonResponse($repo->NbCommandesLivraison());
    }
}
