<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        "cpf",
        "full_name",
        "birth_date",
        "has_comorbidity",
        "first_dose_date",
        "second_dose_date",
        "third_dose_date",
        "vaccine_id"
    ];

    public function getAnonymizedCpfAttribute()
    {
        return substr($this->cpf, 0, 3) . '.***.***-**';
    }
}
