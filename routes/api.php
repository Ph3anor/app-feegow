<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Employees\EmployeesController;
use App\Http\Controllers\Vaccines\VaccinesController;
use App\Jobs\GenerateUnvaccinatedReport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group([
    'middleware' => 'api'
], function ($router) {
    /**
     * Employees Module
     */
    Route::resource('employees', EmployeesController::class);
    Route::get('employees/view/all', [EmployeesController::class, 'indexAll']);
    Route::get('employees/view/search', [EmployeesController::class, 'search']);
    /**
     * Vaccine Module
     */
    Route::resource('vaccines', VaccinesController::class);
    Route::get('vaccines/view/all', [VaccinesController::class, 'indexAll']);
    Route::get('vaccines/view/search', [VaccinesController::class, 'search']);
    /**
     * Job
     */
    Route::get('/generate-report', function () {
        GenerateUnvaccinatedReport::dispatch();
        return response()->json(['message' => 'A geração de relatórios foi colocada na fila.']);
    });

    Route::get('/reports', [EmployeesController::class, 'listReports']);

});

