<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Employee;

class GenerateUnvaccinatedReport implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle()
    {
        $directory = storage_path('reports');

        // Verificar se o diretório existe, se não, criar
        if (!file_exists($directory)) {
            mkdir($directory, 0755, true); // 0755 é a permissão padrão
        }

        // Extraia os dados dos colaboradores não vacinados
        $unvaccinatedEmployees = Employee::where('first_dose_date',null)
            ->orWhere('second_dose_date',null)
            ->orWhere('third_dose_date',null)
            ->select('cpf', 'full_name')
            ->get();

        // Gerar o relatório
        $reportData = [];
        foreach ($unvaccinatedEmployees as $employee) {
            $reportData[] = [
                'cpf' => $employee->cpf,
                'full_name' => $employee->full_name,
            ];
        }

        // Nomeie o arquivo com a data e hora
        $timestamp = now()->format('Ymd_His'); // Exemplo: 20241014_123456
        $fileName = $directory . "/unvaccinated_report_{$timestamp}.csv"; // Nome personalizado
        $file = fopen($fileName, 'w');
        fputcsv($file, ['CPF', 'Nome']); // Cabeçalho

        foreach ($reportData as $row) {
            fputcsv($file, $row);
        }

        fclose($file);
    }


}
