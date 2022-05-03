<?php

namespace App\Form;

use App\Entity\Purchase;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class PurchaseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fullName', TextType::class, [
                'label' => 'Nom prénom :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez spécifier votre nom et prénom',
                    ])
                ]
            ])
            ->add('address', TextType::class, [
                'label' => 'Adresse de livraison :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez spécifier une adresse de livraison',
                    ])
                ]
            ])
            ->add('postalCode', TextType::class, [
                'label' => 'Code postal :',
                'constraints' => [
                    new NotBlank ([
                        'message' => 'Vous devez spécifier votre code postal',
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
            ->add('carrier', ChoiceType::class, [
                'label' => 'Transporteur :',
                'choices'  => [
                    'Chronopost' => 'Chronopost',
                    'Colissimo' => 'Colissimo'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Purchase::class,
        ]);
    }
}
