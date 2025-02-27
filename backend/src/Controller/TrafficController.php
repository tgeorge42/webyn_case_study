<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class TrafficController extends AbstractController
{
    #[Route('/api/traffic', name: 'api_traffic', methods: ['GET'])]
    public function getTraffic(): JsonResponse
    {
        $trafficData = [
            ["page_id" => 1, "page_url" => "/home", "traffic" => 125],
            ["page_id" => 2, "page_url" => "/about", "traffic" => 80],
            ["page_id" => 3, "page_url" => "/products", "traffic" => 300],
            ["page_id" => 4, "page_url" => "/contact", "traffic" => 45],
            ["page_id" => 5, "page_url" => "/blog", "traffic" => 95],
        ];

        return $this->json($trafficData);
    }
}
