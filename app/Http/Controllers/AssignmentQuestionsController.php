<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;
use App\Models\Auth;
use App\Models\Assignment;
use App\Models\AssignmentQuestions;

class AssignmentQuestionsController extends Controller
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

    public function createassignmentquestions($book_id)
    {
        $questions = Question::where('book_id', $book_id)->get();
        return response()->json(['questions' => $questions]);
    }

    public function viewassignmentquestions($id)
    {
        $assignmentquestions = AssignmentQuestions::where('assignment_id', $id)->with('question')->with('assignment')->get();
        //dd($assignmentquestions);
        return view('assignmentquestions.form', ['assignmentquestionslist' => $assignmentquestions]);
    }

    public function updateanswerquestions(Request $request)
    {
        $questions = $request->input('questions'); // Retrieve all questions
        //dd($questions);

        foreach ($questions as $question) {

            $assignmentQuestion = AssignmentQuestions::find($question['id']);
            $assignmentId = $assignmentQuestion->assignment_id;


            if (!empty($question['id']) && isset($question['answer_field'])) {
                // Find the assignment question by ID
                $assignmentQuestion = AssignmentQuestions::find($question['id']);
                if ($assignmentQuestion) {
                    //dd($assignmentQuestion);
                    // Save the answer
                    $assignmentQuestion->answer_field = $question['answer_field'];
                    $assignmentQuestion->save();
                    $assignmentId = $assignmentQuestion->assignment_id;
                }
            }
        }
        if ($assignmentId) {
            $assignment = Assignment::find($assignmentId);
            if ($assignment->status == 'Pending Feedback') {
                $assignment->feedback = $request->feedback;
                $assignment->status = 'Completed';
                $assignment->save();
            }
            // elseif ($assignment) {
            //     $assignment->status = 'Pending Feedback';
            //     $assignment->save();
            //     return redirect()->route('reviewform', ['student_id' => $assignment->student_id,'book_id' => $assignment->book_id]);
            // }
        }
        // if ($request->user_role == 'student'){
        // return redirect()->route('studentassignment', ['id' => $request->user_id]);
        // } else
        return redirect()->route('assignments');
    }
}
