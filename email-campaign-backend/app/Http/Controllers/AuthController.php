<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Mail\WelcomeMail;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:3',
        ]);

        if ($validator->fails()) {
            return response()->json([ 'success' => false, 'errors' => $validator->errors()], 422);
        }
        try {
            $plainPassword = $request->password;
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);
            Mail::to($user->email)->send(new WelcomeMail($user, $plainPassword));

            return response()->json([ 'success' => true, 'message' => 'User registered successfully!','user' => $user], 201);
        } catch (\Exception $e) {
            
            return response()->json([ 'success' => false, 'message' => 'An error occurred while registering the user.'], 500);
        }
    }

    public function login(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:3',
        ]);
        if ($validator->fails()) {
            return response()->json([ 'success' => false, 'errors' => $validator->errors()], 422);
        }
        $user = User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['success' => false, 'message' => 'Invalid credentials'], 401);
        }
        $token = $user->createToken('EmailCampaign')->plainTextToken;
        return response()->json([
            'success' => true,
            'message' => 'Login successful!',
            'token' => $token,
            'user' => $user
        ]);

    }

    

}
