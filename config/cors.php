<?php

return [
    'paths' => ['*'], // Define as rotas da API que precisam do CORS
    'allowed_methods' => ['*'], // Permite todos os métodos HTTP (GET, POST, etc)
    'allowed_origins' => ['http://localhost:4200'], // O domínio do seu frontend Angular
    'allowed_origins_patterns' => [],
    'allowed_headers' => ['Origin, Content-Type, X-Auth-Token , Cookie'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true, // Defina como true se estiver usando autenticação via cookies
];

