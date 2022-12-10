<?php

namespace App\Form;

use App\Entity\User;
use App\Entity\Client;
// use Doctrine\DBAL\Types\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez entrer un email',
                    ]),
                    new Regex([
                        'pattern' => '/^([a-zA-Z0-9\-\.]+@[a-zA-Z0-9\-\.]+\.[a-z]{2,5})$/',
                        'match' => true,
                        'message' => 'Veuillez entrer votre email correctement (exemple:exemple@exemple.fr)'
                    ])
            ]

            ])
            ->add('agreeTerms', CheckboxType::class, [
                'required' => false,
                'mapped' => false,
                'constraints' => [
                    new IsTrue([
                        'message' => 'Vous devez accepter nos conditions.',
                    ]),
                ],
            ])
            ->add('plainPassword', PasswordType::class, [
                // au lieu d'être posé directement sur l'objet,
                // ceci est lu et encodé dans le contrôleur      
                'mapped' => false,
                'required' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez entrer un mot de passe',
                    ]),
                    new Regex([
                        'pattern' => '/^(?=.{6,}$)(?=(?:.*[A-Z]){1})(?=.*[a-z])(?=(?:.*[0-9]){1}).*/',
                        'match' => true,
                        'message' => 'Votre mot de passe doit contenir une majuscule, une minuscule, un chiffre et comporter plus de 6 lettres'
                    ]),
                ],
            ])            
            ->add('nom', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir votre nom',
                    ]),
                    new Regex([
                        'pattern' => '/^[A-Z][A-Za-z\é\è\ê\-]+$/',
                        'match' => true,
                        'message' => 'Votre nom doit comporter que des lettres'
                    ]),
                ]
            ])
            ->add('prenom', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir votre prenom',
                    ]),
                    new Regex([
                        'pattern' => '/^[A-Z][A-Za-z\é\è\ê\-]+$/',
                        'match' => true,
                        'message' => 'Votre nom doit comporter que des lettres'
                    ]),
                ]
            ])
            ->add('adresseLivraison' , TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir votre adresse',
                    ]),
                    new Regex([
                        'pattern' => '/^[a-zA-Z0-9\s,-]+$/',
                        'match' => true,
                        'message' => 'Votre adresse ne doit pas comporter de caractères spéciaux'
                    ])
                ]
            ])
            ->add('cpLivraison', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir votre code postal',
                    ]),
                    New Regex([
                        'pattern' => '/[0-9]{5}/',
                        'match' => true,
                        'message' => 'Votre code postal doit contenir 5 chiffres'
                    ])
                ]
            ])
            ->add('villeLivraison', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir votre ville',
                    ]),
                    new Regex([
                        'pattern' => '/^[A-Z][A-Za-z\é\è\ê\-]+$/',
                        'match' => true,
                        'message' => 'Votre ville est mal orthographié'
                    ])
                ]
            ])

            ->add('adresseFacture' , TextType::class, [
                'required' => false,
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[a-zA-Z0-9\s,-]+$/',
                        'match' => true,
                        'message' => 'Votre adresse ne doit pas comporter de caractères spéciaux'
                    ])
                ]
            ])
            ->add('cpFacture', TextType::class, [
                'required' => false,
                'constraints' => [
                    New Regex([
                        'pattern' => '/[0-9]{5}/',
                        'match' => true,
                        'message' => 'Votre code postal doit contenir 5 chiffres'
                    ])
                ]
            ])
            ->add('villeFacture', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[A-Z][A-Za-z\é\è\ê\-]+$/',
                        'match' => true,
                        'message' => 'Votre ville est mal orthographié'
                    ])
                ]
            ])
            
            ->add('categorie', CheckboxType::class, [
                'mapped' => false,
                'required' => false,
                'attr' => [
                    'onClick' => 'myFunction2()'
                ]
            ])

            ->add('adresseDifference', CheckboxType::class, [
                'mapped' => false,
                'required' => false,
                'attr' => [
                    'onClick' => 'myFunction1()'
                ]
            ])

            ->add('nomEntreprise' , TextType::class, [
                'mapped' => false,
                'required' => false,
            ])
            ->add('numeroSiret', TextType::class, [
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new Regex([
                        'pattern' => '/[0-9]{14}/',
                        'match' => true,
                        'message' => 'Votre numéro de SIRET est invalide'
                    ])
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // 'data_class' => User::class,
        ]);
    }
}