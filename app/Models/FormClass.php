<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FormClass extends Model
{
    protected $table = 'form_classes';

    public function teacher()
    {
        return $this->belongsTo(User::class, 'teacher_id', 'id');
    }

    // Relationship to the substitute teacher
    public function substituteTeacher()
    {
        return $this->belongsTo(User::class, 'substitute_teacher_id', 'id');
    }

    public function users()
    {
        return $this->hasMany(User::class, 'teacher_id', 'id');
    }
}
