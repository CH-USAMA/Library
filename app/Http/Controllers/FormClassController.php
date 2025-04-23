<?php

namespace App\Http\Controllers;

use App\Models\FormClass;
use App\Models\User;
use App\Models\Book;
use App\Models\Review;
use Illuminate\Support\Facades\DB;

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

    public function classStudents()
    {
        $data = User::where('role', 'student')->with('class','book')->get();
        $classes = FormClass::all();
        return view('students.list', ['userslist' => $data, 'classes' => $classes]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function storeformclass(Request $request)
    {
        // dd($request->all());

        $request->validate([
            'teacher_id' => 'required',
            'class_name' => 'required',
        ]);


        $formclass = new FormClass();
        $formclass->class_name = $request->class_name;
        $formclass->teacher_id = $request->teacher_id;
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


    public function assignStudentsBook(Request $request)
    {


        $request->validate([
            'student_ids' => 'required|string',
        ]);
        
        $studentIds = explode(',', $request->student_ids);

        // Ensure we have valid IDs
            if (!is_array($studentIds) || count($studentIds) === 0) {
                return back()->withErrors(['student_ids' => 'No students selected.']);
            }

         // Update book_id for selected students

         foreach ($studentIds as $id) {
            $user = User::find($id);
            $preferredGenreIds = $user->genre->pluck('id')->toArray();;
    
            $matchingBookIds = DB::table('book_genre')
                ->whereIn('genre_id', $preferredGenreIds)
                ->pluck('book_id')
                ->unique() // Remove duplicates
                ->toArray();
            $reviewedBookIds = Review::where('student_id', $user->id)
                ->pluck('book_id')
                ->toArray();
    
            $unreviewedBooks = array_diff($matchingBookIds, $reviewedBookIds); // Remove reviewed books
    
            if (!empty($unreviewedBooks)) {
                $assignedBookId = reset($unreviewedBooks); // Get the first book ID
            } else {
                $assignedBookId = Book::whereNotIn('id', $reviewedBookIds)->inRandomOrder()->value('id');
            }
           
            $user->update(['book_id' => $assignedBookId, 'current_book_name' => Book::find($assignedBookId)->title]);
    
         }
        
       
    
        return back()->with('success', 'Books assigned to Stufdents successfully!');
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
