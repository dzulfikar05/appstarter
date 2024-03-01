<?php

namespace Modules\Main\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB; 

class MainController extends Controller
{
    
   
    public function index()
    {
        return view('main::index',[
			'title' => 'Main',
			'content' => ''
		]);
        // return view('main::index');
    }

    public function getPage()
    {
        $userRole = session()->get('userdata.role_id');

        $operation = DB::table('v_user_roles')->where([
            ['role_id' ,'=', $userRole],
        ])->orderBy('order', 'ASC')->get()->toArray();

        $data = convertArray($operation);
        
        return($data);

    
    }
}
