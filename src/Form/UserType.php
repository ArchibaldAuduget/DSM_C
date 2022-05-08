<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('firstName', TextType::class, [
                'label' => 'Prénom :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez entrer un prénom',
                    ])
                ]
            ])
            ->add('lastName', TextType::class, [
                'label' => 'Nom :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez entrer un nom de famille',
                    ])
                ]
            ])
            ->add('address', TextType::class, [
                'label' => 'Adresse :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez spécifier votre adresse',
                    ])
                ]
            ])
            ->add('phoneNumber', TextType::class, [
                'label' => 'Numéro de téléphone :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez entrer un numéro de téléphone',
                    ])
                ]
            ])
            ->add('country', TextType::class, [
                'label' => 'Pays :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez préciser un pays',
                    ])
                ]
            ])
            ->add('postalCode', TextType::class, [
                'label' => 'Code postal :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez précisez un code postal',
                    ])
                ]
            ])
            ->add('city', TextType::class, [
                'label' => 'Ville :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez spécifier la ville dans laquelle se trouve l\'adresse',
                    ])
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
