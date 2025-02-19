<?php

namespace App\Interfaces;

interface CrudInterface
{
    /**
     * Get All Data
     *
     * @return array All Data
     */
    public function getAll();

    /**
     * Get Paginated Data
     *
     * @param int   Page No
     * @return array Paginated Data
     */
    public function getPaginatedData(int $perPage);

    /**
     * Create New Item
     *
     * @param array $data
     * @return object Created Employee
     */
    public function create(array $data);

    /**
     * Delete Item By Id
     *
     * @param int $id
     * @return object Deleted Employee
     */
    public function delete(int $id);

    /**
     * Get Item Details By ID
     *
     * @param int $id
     * @return object Get Employee
     */
    public function getByID(int $id);

    /**
     * Update Employee By Id and Data
     *
     * @param int $id
     * @param array $data
     * @return object Updated Employee Information
     */
    public function update(int $id, array $data);
}
