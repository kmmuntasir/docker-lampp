<?php

/**
 * Just a simple test file proving that we are connected :)
 */

echo "Hello from lampp on Docker!!!<br><br>\n\n";

try {
    $connection = new mysqli(
        hostname: 'docker_lampp_mariadb',
        username: 'root',
        password: 'root',
        database: 'test',
    );

    echo "Database Connected!!!\n";
} catch (Exception $exception) {
    print_r($exception);
}