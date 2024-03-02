<?php
use Illuminate\Support\Facades\Route;
use Laravel\Socialite\Facades\Socialite;
use Modules\Login\Http\Controllers\LoginController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::controller(LoginController::class)->middleware('guest')->group(function() {
    Route::get('/login','index')->name('login');
});
Route::controller(LoginController::class)->group(function() {
    // Route::get('/login','index')->name('login');
    Route::post('/login/authentication','authentication')->name('login/authentication');
    Route::post('/login/logout', 'logout')->name(('login/logout'));
});

Route::controller(LoginController::class)->group(function() {
    Route::get('/login/googleRedirect','googleRedirect')->name('login/googleRedirect');
    Route::get('/google/redirect','googleCallback')->name('google/redirect');
});
 
// Route::get('/auth/callback', function () {
//     $user = Socialite::driver('github')->user();
 
//     // $user->token
// });