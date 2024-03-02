<?php

namespace Modules\Login\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Socialite\Facades\Socialite;
use Modules\User\Entities\User;


class LoginController extends Controller
{
    public function index()
    {
        return view('login::index');
    }

    public function authentication(Request $request)
    {
        $response = [];
        $credentials = $request->validate([
            'email' => 'required',
            // 'email' => ['required','email'],
            'password' => 'required'
        ]);
        // print_r('<pre>'); print_r(Auth::attempt($credentials)); print_r('</pre>');exit;
        if(Auth::attempt($credentials)){
            $request->session()->regenerate();
            $users = User::select()->where('email', $request->email)->get()->toArray();
            session(['userdata' => $users[0]]);
            return redirect()->to('');
        }else{
            $response['success']=false;
            $response['message']='Your username or password is wrong !';
            return $response;
        }
        $response['success']=false;
        $response['message']='Please contact administrator !';
        return $response;
    }

    public function logout()
    {
        Auth::logout();
        request()->session()->invalidate();
        request()->session()->regenerateToken();
        return;
    }

    public function googleRedirect()
    {
        return Socialite::driver('google')->redirect();
    }

    public function googleCallback()
    {
        session()->regenerate();
        $user = Socialite::driver('google')->user();
        $userCheck = User::where('email', $user->email)->first();

        if($userCheck){

            Auth::login($userCheck);
            $dataUser = convertArray($userCheck);
            session(['userdata' => $dataUser]);
        }else{
            $data =[
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'google_auth' => 1
            ];
            User::insert($data);
            Auth::login($user);
            $dataUser = convertArray($userCheck);
            session(['userdata' => $dataUser]);
        }

        return redirect()->to('');
    }
}
