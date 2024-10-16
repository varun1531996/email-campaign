<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Jobs\SendEmailJob;
use App\Models\Campaign;
use App\Models\CsvFile;
use Illuminate\Support\Facades\Storage;

class CampaignController extends Controller
{
    public function uploadCsv(Request $request){
        $request->validate(['csv' => 'required|mimes:csv,txt']);
        $file = $request->file('csv');
        $filePath = $file->store('csv');
        $fileName = $file->getClientOriginalName();
        CsvFile::create([
            'campaign_name' => $request->name,
            'file_name' => $fileName,
            'path' => $filePath,
        ]);
        $this->processCsv($filePath);
        return response()->json(['message' => 'CSV uploaded and saved to the database.']);
    }

    public function processCsv($filePath){
        $csvData = array_map('str_getcsv', file(storage_path('app/' . $filePath)));
        foreach (array_slice($csvData, 1) as $row) {
            $name = $row[0];
            $email = $row[1];
            echo $name;
            echo $email;
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                SendEmailJob::dispatch($name, $email);
            }
        }
    }
}

