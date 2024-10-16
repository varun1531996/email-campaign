<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CsvFile extends Model
{
    use HasFactory;
    protected $fillable = ['campaign_name','file_name', 'path'];
}
