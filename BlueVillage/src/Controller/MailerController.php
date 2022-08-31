<?php

namespace App\Controller;


use App\Form\ContactType;
use App\Repository\RubriqueRepository;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class MailerController extends AbstractController
{
    #[Route('/contact', name: 'app_mailer')]
    public function sendEmail(MailerInterface $mailer, Request $request, RubriqueRepository $repo): Response
    {
        //Attention, nécessite d'avoir MailHog installé pour recevoir les mails

        $rubriques = $repo->findBy(array('rubrique' => null));

        $form = $this->createForm(ContactType::class);

        $contact = $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            //On crée le mail
            $email = (new TemplatedEmail())
                ->from($contact->get('email')->getData())
                ->to('BlueVillage@ex.com')
                ->subject('Contact')
                ->htmlTemplate('mailer/contact.html.twig')
                ->context([
                    'mail'  => $contact->get('email')->getData(),
                    'message' => $contact->get('message')->getData(),
                    'rubrique' => $rubriques
                ]);
            //Envoi du mail
            $mailer->send($email);

            //Confirmation + redirection
            $this->addFlash('message', 'Votre email a bien été envoyé');
            return $this->redirectToRoute('app_mailer');
        }

        return $this->render('mailer/index.html.twig', [
            'controller_name' => 'MailerController',
            'form'            => $form->createView(),
            'rubrique'        => $rubriques
        ]);
    }
}
