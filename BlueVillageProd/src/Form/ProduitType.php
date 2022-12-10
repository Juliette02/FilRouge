<?php

namespace App\Form;

use App\Entity\Produit;
use App\Entity\Rubrique;
use App\Entity\Fournisseur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\OptionsResolver\OptionsResolver;


class ProduitType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options, ): void
    {
        $builder
            ->add('libelleCourt')
            ->add('libelleLong', TextareaType::class, [
                'attr' => ['rows'=>5]
            ])
            ->add('referenceFournisseur')
            ->add('photo', FileType::class, [
                'label' => 'Photo',
                'required' => false,
                // On le rend facultatif afin que l'on est pas à télécharger à nouveau l'image
                // chaque fois qu'on modifie les détails d'un disque
                "mapped" => false,
                // On sépare le champs image de l'entité
            ])
            ->add('prixAchat')
            ->add('prixHorsTaxe')
            ->add('rubrique', EntityType::class, [
                    'class' => Rubrique::class,
                    // 'choice_label' => 'getSousRubrique',
                    // 'query_builder' => function(RubriqueRepository $repo){
                    //     return $repo->createQueryBuilder('rub')->where('rub.id = null');
                    // }
                    ])
            ->add('fournisseur', EntityType::class, [
                'class' => Fournisseur::class,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Produit::class,
        ]);
    }
}
