<?php

namespace Modules\User\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, HasRoles;

    protected $table = 'users';

    protected $primaryKey = 'id';
    // protected $keyType = 'string';
    public $incrementing = true;
    
    protected $fillable = [
        'user_id',
        'user_nama',
        'user_username',
        'user_email',
        'user_password',
        'user_photo',
        'user_active',
        'user_created_at',
        'user_updated_at',
        'user_deleted_at',
    ];

    public $timestamps = true;
    
    public function getAuthPassword () {
        return $this->password;
    }
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }
}
