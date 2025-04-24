<?php

namespace App\Http\Controllers;

use App\Models\Assignment;
use App\Models\AssignmentQuestions;
use App\Models\User;





use App\Models\Book;
use App\Models\Question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AssignmentController extends Controller
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
    public function index()
    {
        if (Auth::user()->role == 'admin')
            $data = Assignment::with('student', 'teacher', 'book')->get();
        elseif(Auth::user()->role == 'student')
             $data = Assignment::with('student', 'teacher', 'book')->where('teacher_id', auth()->id())->get();
        else
            $data = Assignment::with('student', 'teacher', 'book')->where('student_id', auth()->id())->get();
       
        return view('assignments.list', ['assignmentslist' => $data]);
    }

    public function studentassignment($id)
    {
        $data = Assignment::with('student', 'teacher', 'book')->where('student_id', $id)->get();
        //dd($data);
        return view('student_assignment.list', ['assignmentslist' => $data]);
    }
   
    /**
     * Show the form for creating a new resource.
     */
    public function createassignment()
    {
        //$questions = Question::with('Book')->where('book_id', $id)->get();
        $books = Book::all();
        $users = User::where('role', 'student')->get();
        $questionslist =  Question::all();

        return view('assignments.form', ['bookslist' => $books, 'userslist' => $users, 'questionslist' => $questionslist]);
    }

    public function selectbook()
    {
        $books = Book::all();
        //return view('students.list',['userslist'=>$data]);
        return view('assignments.book', ['bookslist' => $books]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function storeassignment(Request $request)
    {
        // dd($request->all());

        // dd($request->all());

        foreach ($request->student_id as $student) {

            $assignment = new Assignment();
            $assignment->name = $request->name;
            $assignment->book_id = $request->book_id; //changed from $assignment->book_id = 42;
            $assignment->student_id = $student;
            $assignment->teacher_id = $request->teacher_id;
            $assignment->status = $request->status;
            $assignment->save();

            foreach ($request->questionlist as $question) {
                $AssignmentQuestions = new AssignmentQuestions();
                $AssignmentQuestions->assignment_id = $assignment->id;
                $AssignmentQuestions->question_id = $question;
                $AssignmentQuestions->save();
            }
        }


        return redirect()->route('assignments');
    }

    /**
     * Display the specified resource.
     */
    public function show(Assignment $assignment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Assignment $assignment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Assignment $assignment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function deleteassignment($id)
    {
        Assignment::destroy($id);
        return redirect()->route('assignments');
    }
}
