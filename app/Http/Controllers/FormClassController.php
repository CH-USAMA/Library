<?php

namespace App\Http\Controllers;

use App\Models\FormClass;
use App\Models\User;
use Illuminate\Http\Request;

class FormClassController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     */
    public function formclassteacherlist()
    {
        $data = FormClass::with(['teacher', 'substituteteacher'])->get();
        return view('formclasses.list',['formclasseslist'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function createformclass()
    {
        $teachers = User::where('role', 'teacher')->get();
        return view('formclasses.form',['teacherslist'=>$teachers]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function storeformclass(Request $request)
    {
        //dd($request);
        $formclass = new FormClass();
        $formclass->class_name = $request->class_name;
        $formclass->save();
        return redirect()->route('formclassteacher');
    }

    /**
     * Display the specified resource.
     */
    public function assignStudents(Request $request)
    {
        $request->validate([
            'class_id' => 'required|exists:form_classes,id',
            'student_ids' => 'required|string',
        ]);
        
        $studentIds = explode(',', $request->student_ids);

        // Ensure we have valid IDs
            if (!is_array($studentIds) || count($studentIds) === 0) {
                return back()->withErrors(['student_ids' => 'No students selected.']);
            }

         // Update class_id for selected students
        User::whereIn('id', $studentIds)->update(['assigned_class' => $request->class_id]);


        // dd($request->all());
    
        return back()->with('success', 'Students assigned to class successfully!');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(FormClass $formClass)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, FormClass $formClass)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(FormClass $formClass)
    {
        //
    }
}
