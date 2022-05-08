<?php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

class AmountExtension extends AbstractExtension
{
    public function getFilters()
    {
        // Permet de lier une fonction à un filtre qui sera automatiquement connu de twig
        return [
            new TwigFilter('amount', [$this, 'amount'])
        ];

    }


    // Grace à l'instanciation : $value compris comme param dans template twig
    public function amount($value)
    {
        $finalValue = $value / 100;
        // number_format permet de formater la valeur donnée
        $finalValue = number_format($finalValue, 2, ',', ' ');

        return $finalValue . ' €';
    }
    
}