<?php

namespace App\Repositories;

use Illuminate\Support\Str;
use App\Helpers\UploadHelper;
use App\Interfaces\CrudInterface;
use App\Models\Vaccine;
use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Support\Facades\Cache;

class VaccineRepository implements CrudInterface
{
    /**
     * Constructor.
     */
    public function __construct()
    {
        // Initialize any dependencies or services here if needed
    }

    /**
     * Retrieve all vaccines ordered by ID descending.
     *
     * @return Object
     */
    public function getAll(): Object
    {
        return Vaccine::orderBy('id', 'desc')->get();
    }

    /**
     * Retrieve paginated vaccines.
     *
     * @param int $perPage
     * @return Paginator
     */
    public function getPaginatedData(int $perPage = 12): Paginator
    {
        return Vaccine::orderBy('id', 'desc')->paginate($perPage);
    }

    /**
     * Search for vaccines by keyword.
     *
     * @param string $keyword
     * @param int $perPage
     * @return Paginator
     */
    public function searchVaccine(string $keyword, int $perPage = 10): Paginator
    {
        return Vaccine::where('name', 'like', '%' . $keyword . '%')
            ->orWhere('batch', 'like', '%' . $keyword . '%')
            ->orWhere('expiry_date', 'like', '%' . $keyword . '%')
            ->orderBy('id', 'desc')
            ->paginate($perPage);
    }

    /**
     * Create a new vaccine.
     *
     * @param array $data
     * @return Vaccine
     */
    public function create(array $data): Vaccine
    {
        return Vaccine::create($data);
    }

    /**
     * Delete a vaccine by ID.
     *
     * @param int $id
     * @return bool
     */
    public function delete(int $id): bool
    {
        $vaccine = $this->getByID($id);

        if (!$vaccine) {
            return false; // Vaccine not found
        }

        return $vaccine->delete(); // Return the result of delete operation
    }

    /**
     * Retrieve a vaccine by ID.
     *
     * @param int $id
     * @return Vaccine|null
     */
    public function getByID(int $id): ?Vaccine
    {
        return Vaccine::find($id);
    }

    /**
     * Update a vaccine by ID.
     *
     * @param int $id
     * @param array $data
     * @return Vaccine|null
     */
    public function update(int $id, array $data): ?Vaccine
    {
        $vaccine = $this->getByID($id);

        if (!$vaccine) {
            return null;
        }

        $vaccine->update($data);

        return $vaccine; // Return the updated vaccine
    }
}
