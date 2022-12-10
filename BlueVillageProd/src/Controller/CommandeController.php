<?php

namespace App\Controller;

use App\Entity\Commande;
use App\Form\CommandeType;
use App\Repository\ClientRepository;
use App\Repository\UserRepository;
use App\Repository\CommandeRepository;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/commande')]
class CommandeController extends AbstractController
{
    #[Route('/', name: 'app_commande_index', methods: ['GET'])]
    public function index(CommandeRepository $commandeRepository, UserRepository $userRepository, RubriqueRepository $repo, ClientRepository $clientRepository): Response
    {

        $rubriques = $repo->findBy(array('rubrique' => null));

        return $this->render('commande/index.html.twig', [
            'commandes' => $commandeRepository->findAll(),
            'user' => $userRepository->findAll(),
            'client' => $clientRepository->findAll(),
            'rubrique' => $rubriques,
        ]);
    }

    #[Route('/new', name: 'app_commande_new', methods: ['GET', 'POST'])]
    public function new(Request $request, CommandeRepository $commandeRepository, RubriqueRepository $repo): Response
    {
        $commande = new Commande();
        $form = $this->createForm(CommandeType::class, $commande);
        $form->handleRequest($request);

        $rubriques = $repo->findBy(array('rubrique' => null));


        if ($form->isSubmitted() && $form->isValid()) {
            $commandeRepository->add($commande, true);

            return $this->redirectToRoute('app_commande_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('commande/new.html.twig', [
            'commande' => $commande,
            'form' => $form,
            'rubrique' => $rubriques,
        ]);
    }

    #[Route('/{id}', name: 'app_commande_show', methods: ['GET'])]
    public function show(Commande $commande, RubriqueRepository $repo): Response
    {

        $rubriques = $repo->findBy(array('rubrique' => null));

        return $this->render('commande/show.html.twig', [
            'commande' => $commande,
            'rubrique' => $rubriques,
        ]);
    }

    #[Route('/{id}', name: 'app_commande_delete', methods: ['POST'])]
    public function delete(Request $request, Commande $commande, CommandeRepository $commandeRepository): Response
    {
        
        if ($this->isCsrfTokenValid('delete'.$commande->getId(), $request->request->get('_token'))) {
            $commandeRepository->remove($commande, true);
        }

        return $this->redirectToRoute('app_commande_index', [], Response::HTTP_SEE_OTHER);
    }
}
