<?php

namespace Modules\User\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB; 
use Modules\User\Entities\User;
use Yajra\DataTables\DataTables;

// use DataTables;


class UserController extends Controller
{
    public function index()
    {
        return view('main::index',[
			'title' => 'User',
			'content' => view('user::index')
		]);
    }

    public function initTable(Request $request)
    {
        if ($request->ajax()) {
            $data = User::where([
                    ['deleted_at', null], 
                ])->get()->toArray();
            
            return DataTables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        $id = $row->id;
                           $btn = '<div >
                                        <a href="#" onclick="onEdit(this)" data-id="'.$id.'" title="Edit Data" class="btn btn-warning btn-sm"><i class="align-middle fa fa-pencil fw-light text-dark"> </i></a>
                                        <a href="#" onclick="onDelete(this)" data-id="'.$id.'" title="Delete Data" class="btn btn-danger btn-sm"><i class="align-middle fa fa-trash fw-light"> </i></a>
                                </div>
                                ';
    
                            return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
       
        return view('user.index');
    }

    public function store(Request $request){
        $response=[];

        $data = $request->input();
       
        $image = $request->file('photo');

        $data['id'] = uniqid();
        $data['created_at'] = date('Y-m-d H:i:s');

        if(isset($data['is_active'])){
            $data['is_active'] = 1;
        }else{
            $data['is_active'] = 0;
        }

        if($image){
            $image->storeAs('public/uploads/user', $image->hashName());
            $data['photo'] = $image->hashName();
        }

        $operation = DB::table('tb_user')->insert($data);
        if($operation == 1){
            $response['success'] = true;
            $response['title'] = 'Success';
            $response['message'] = 'Berhasil Menambahkan Data';
        }else{
            $response['success'] = false;
            $response['title'] = 'Failed';
            $response['message'] = 'Gagal Mengubah Data!';
        }

        return $response;
    }

    public function edit(Request $request){
        $id = $request->input('id');

        $operation = DB::table('tb_user')->where('id', $id)->get()->toArray();

        return $operation;
    }

    public function update(Request $request)
    {
        $response=[];
        $image = $request->file('photo');

        $data = $_POST;
        $data['updated_at'] = date('Y-m-d H:i:s');

        if(isset($data['password'])){
            if($data['password'] == '' || $data['password'] == null){
                unset($data['password']);
            }
        }

        if($image){
            $image->storeAs('public/uploads/user', $image->hashName());
            $data['photo'] = $image->hashName();
        }

        $operation = DB::table('tb_user')->where('id', $data['id'])->update($data);

        if($operation == 1){
            // $users = DB::table('tb_user')->where('id', $data['id'])->get()->toArray();
            // session(['userdata' => $users[0]]);
            // $request->session()->put('userdata', $users[0]);
            

            $response['success'] = true;
            $response['title'] = 'Success';
            $response['message'] = 'Berhasil Mengubah Data!';
        }else{
            $response['success'] = false;
            $response['title'] = 'Failed';
            $response['message'] = 'Gagal Mengubah Data!';
        }
        return $response;
    }

    public function destroy(Request $request){
        $response = [];
        $id = $request->input('id');

        $user = DB::table('tb_user')->where('id', $id)->get()->toArray();
        $data = [
            'deleted_at' => date('Y-m-d H:i:s'),
            'is_active' => null
        ];
        $operation = DB::table('tb_user')->where('id', $id)->update($data);
        Storage::disk('local')->delete('public/uploads/user/'.$user[0]->photo);

        if($operation == 1){
            $response['success'] = true;
            $response['title'] = 'Success';
            $response['message'] = 'Berhasil Mengubah Data!';
        }else{
            $response['success'] = false;
            $response['title'] = 'Failed';
            $response['message'] = 'Gagal Mengubah Data!';
        }
        return $response;
    }
}
