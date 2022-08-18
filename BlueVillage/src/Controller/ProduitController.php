<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Entity\Rubrique;
use App\Form\ProduitType;
use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Service\FileUploader;

#[Route('/produit')]
class ProduitController extends AbstractController
{

    #[Route('/_{id}', name: 'app_produit_index', methods: ['GET'])]
    public function produits(ProduitRepository $repo3, RubriqueRepository $repo4, Rubrique $rub ,$id): Response
    {    
        $produit = $repo3->findBy(array('rubrique' => $id ));

        $rubriques = $repo4->findBy(array('rubrique' => null));

        return $this->render('produit/index.html.twig', [
            'produits' => $produit,
            'rubrique' => $rubriques,
            'rub'      => $rub     
        ]);
    }

    #[Route('/new', name: 'app_produit_new')]
    public function new(Request $request, ProduitRepository $produitRepository, RubriqueRepository $repo, FileUploader $fileUploaders): Response
    {
        $produit = new Produit();
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            // dd($form);

            $photoFile = $form->get('photo')->getData();

            // Cette condition est nécessaire car le champ 'picture'  n'est pas obligatoire
            // donc le l'image doit être traité uniquement lorsqu'un fichier est téléchargé
            if ($photoFile) {
                $photoFilename = $fileUploaders->upload($photoFile);
                $produit->setPhoto($photoFilename);
            }

            $produitRepository->add($produit, true);

            return $this->redirectToRoute('rubrique');
        }

        $rubriques = $repo->findBy(array('rubrique' => null));
        
        
        return $this->renderForm('produit/new.html.twig', [
            'produit' => $produit,
            'rubrique' => $rubriques,
            'form' => $form,
            
        ]);
    }

    #[Route('/{id}', name: 'app_produit_show', methods: ['GET'])]
    public function show(Produit $produit, RubriqueRepository $repo): Response
    {
        $rubriques = $repo->findBy(array('rubrique' => null));

        return $this->render('produit/show.html.twig', [
            'produit' => $produit,
            'rubrique' => $rubriques,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_produit_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Produit $produit, ProduitRepository $produitRepository, RubriqueRepository $repo, FileUploader $fileUploaders): Response
    {
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $photoFile = $form->get('photo')->getData();

            // Cette condition est nécessaire car le champ 'picture'  n'est pas obligatoire
            // donc le l'image doit être traité uniquement lorsqu'un fichier est téléchargé
            if ($photoFile) {
                $photoFilename = $fileUploaders->upload($photoFile);
                $produit->setPhoto($photoFilename);
            }

            $produitRepository->add($produit, true);

            return $this->redirectToRoute('app_produit_show', [ "id" => $produit->getId() ], Response::HTTP_SEE_OTHER);
        }

        $rubriques = $repo->findBy(array('rubrique' => null));


        return $this->renderForm('produit/edit.html.twig', [
            'produit' => $produit,
            'rubrique' => $rubriques,
            'form' => $form,
            
        ]);
    }

    #[Route('/{id}', name: 'app_produit_delete', methods: ['POST'])]
    public function delete(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$produit->getId(), $request->request->get('_token'))) {
            $produitRepository->remove($produit, true);
        }

        return $this->redirectToRoute('rubrique', [], Response::HTTP_SEE_OTHER);
    }
}
