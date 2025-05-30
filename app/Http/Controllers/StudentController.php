<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\FormClass;
use App\Models\User;
use App\Models\Book;
use App\Models\Genre;
use App\Models\Review;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
// use App\Http\Controllers\Auth;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;

class StudentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // dd("here");
        // $data = User::where('role', 'student')->get();
        // $classes = FormClass::where('teacher_id', 62)
        // ->with('students')
        // ->get();

        // dd($classes);


        $data = User::where('role', 'student')->with('class', 'book')->get();
        $classes = FormClass::all();
        // dd($data);
        // dd($data[0]->class->class_name);
        return view('students.list', ['userslist' => $data, 'classes' => $classes]);
    }

    public function profile($id)
    {
        $user = User::find($id);
        // get count of reviews
        $reviewsCount = Review::where('student_id', $id)->count();
        // get average rating
        // $averageRating = Review::where('student_id',$id)->avg('rating');

        //return view('students.list',['userslist'=>$data]);
        return view('students.profile', ['user' => $user, 'reviewsCount' => $reviewsCount]);
    }

    public function teacherindex()
    {
        $data = User::all();
        return view('teachers.list', ['userslist' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function studentCreate()
    {
        $allgenres = Genre::all();
        $allclasses = FormClass::all();
        return view('students.form', ['genrelist' => $allgenres, 'classes' => $allclasses]);
    }

    public function teacherCreate()
    {
        $allgenres = Genre::all();
        return view('teachers.form', ['genrelist' => $allgenres]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $request->validate([
            'name' => ['required'],
            'email' => ['required'],
            'password' => ['required', 'string', 'min:8', 'regex:/^(?=.*[A-Z])(?=.*[\W_]).+$/'],
            'date_of_birth' => ['required'],
            'or_level' => ['required'],
            'assigned_class' => ['required']
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->date_of_birth = $request->date_of_birth;
        $user->role = $request->role;
        $user->or_level = $request->or_level;
        $user->current_book_name = $request->current_book_name;
        $user->topic = $request->topic;
        $user->assigned_class = $request->assigned_class;
        //$user->interests = $request->interests;
        $user->save();
        $user->genre()->attach($request->genre);
        return redirect()->route('users');
    }

    public function teacherstore(Request $request)
    {
        $request->validate([
            'name' => ['required'],
            'email' => ['required'],
            'password' => ['required'],
            'date_of_birth' => ['required'],
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->date_of_birth = $request->date_of_birth;
        $user->role = $request->role;
        $user->current_book_name = $request->current_book_name;
        //$user->interests = $request->interests;
        $user->save();
        $user->genre()->attach($request->interests);
        return redirect()->route('teacherusers');
    }

    /**
     * Display the specified resource.
     */
    public function show(Student $student)
    {
        //
    }

    public function delete($id)
    {
        //$book = Book::find($id);
        //$book->delete();
        User::destroy($id);
        //return redirect()->route('users');
        return redirect()->back();
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $user = User::find($id);
        $allgenres = Genre::all();
        $allclasses = FormClass::all();
        return view('students.form', ['user' => $user, 'genrelist' => $allgenres, 'classes' => $allclasses]);
    }

    public function tedit($id)
    {
        $user = User::find($id);
        $allgenres = Genre::all();
        $allclasses = FormClass::all();
        return view('teachers.form', ['user' => $user, 'genrelist' => $allgenres, 'classes' => $allclasses]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'name' => ['required'],
        ]);
        $id = $request->id;
        $user = User::find(id: $id);
        $user->update($request->all());
        $user->genre()->sync($request->genre);
        //User::where($id)->update($request->User);
        if ($user->role === 'teacher') {
            return redirect()->route('teacherusers');
        } elseif ($user->role === 'student') {
            return redirect()->route('users');
        }
    }


    // public function assign($id)
    // {
    //     $user = User::find($id);
    //     $studentInterest = $user->interests;
    //     $book = Book::where('genre',$studentInterest)->first();
    //     $user->book_id = $book->id;
    //     $user->save();
    //     return redirect()->back();
    // }


    public function assign($id)
    {
        // $user = User::find($id);
        // $preferredGenreIds = $user->genre->pluck('id')->toArray();
        // $studentOrLevel = $user->or_level;

        // // 1. Book IDs that match preferred genres AND student OR level
        // $matchingBookIds = DB::table('book_genre')
        //     ->join('books', 'book_genre.book_id', '=', 'books.id')
        //     ->whereIn('book_genre.genre_id', $preferredGenreIds)
        //     ->where('books.or_level', $studentOrLevel)
        //     ->pluck('book_genre.book_id')
        //     ->unique()
        //     ->toArray();

        // // 2. Get reviewed book IDs by this student
        // $reviewedBookIds = Review::where('student_id', $user->id)
        //     ->pluck('book_id')
        //     ->toArray();

        // // 3. Filter out already reviewed books
        // $unreviewedBooks = array_diff($matchingBookIds, $reviewedBookIds);

        // // 4. Smart book assignment flow
        // if (!empty($unreviewedBooks)) {
        //     // Found unreviewed books with matching genre & or_level
        //     $assignedBookId = reset($unreviewedBooks);
        // } else {
        //     // Try: Any unreviewed book with same or_level
        //     $assignedBookId = Book::where('or_level', $studentOrLevel)
        //         ->whereNotIn('id', $reviewedBookIds)
        //         ->inRandomOrder()
        //         ->value('id');

        //     // Final fallback: Any unreviewed book
        //     if (!$assignedBookId) {
        //         $assignedBookId = Book::whereNotIn('id', $reviewedBookIds)
        //             ->inRandomOrder()
        //             ->value('id');
        //     }
        // }

        // $user = User::find($id);
        // $preferredGenreIds = $user->genre->pluck('id')->toArray();;

        // $matchingBookIds = DB::table('book_genre')
        //     ->whereIn('genre_id', $preferredGenreIds)
        //     ->pluck('book_id')
        //     ->unique() // Remove duplicates
        //     ->toArray();
        // $reviewedBookIds = Review::where('student_id', $user->id)
        //     ->pluck('book_id')
        //     ->toArray();

        // $unreviewedBooks = array_diff($matchingBookIds, $reviewedBookIds); // Remove reviewed books

        // if (!empty($unreviewedBooks)) {
        //     $assignedBookId = reset($unreviewedBooks); // Get the first book ID
        // } else {
        //     $assignedBookId = Book::whereNotIn('id', $reviewedBookIds)->inRandomOrder()->value('id');
        // }
        //dd($assignedBookId);
        //dd($user->book_id);
        $user = User::find($id);
        $preferredGenreIds = $user->genre->pluck('id')->toArray();
        $studentOrLevel = $user->or_level;

        $reviewedBookIds = Review::where('student_id', $user->id)
            ->pluck('book_id')
            ->toArray();

        $assignedBookId = null;

        // Step 1: Preferred genres + OR level
        $assignedBookId = DB::table('book_genre')
            ->join('books', 'book_genre.book_id', '=', 'books.id')
            ->whereIn('book_genre.genre_id', $preferredGenreIds)
            ->where('books.or_level', $studentOrLevel)
            ->whereNotIn('books.id', $reviewedBookIds)
            ->inRandomOrder()
            ->value('book_genre.book_id');
        dd($assignedBookId,$studentOrLevel,$preferredGenreIds,$reviewedBookIds);
        // Step 2: Preferred genres + OR level +1
        if (!$assignedBookId) {
            $assignedBookId = DB::table('book_genre')
                ->join('books', 'book_genre.book_id', '=', 'books.id')
                ->whereIn('book_genre.genre_id', $preferredGenreIds)
                ->where('books.or_level', $studentOrLevel + 1)
                ->whereNotIn('books.id', $reviewedBookIds)
                ->inRandomOrder()
                ->value('book_genre.book_id');
        }

        // Step 3: Any book + OR level
        if (!$assignedBookId) {
            $assignedBookId = Book::where('or_level', $studentOrLevel)
                ->whereNotIn('id', $reviewedBookIds)
                ->inRandomOrder()
                ->value('id');
        }

        // Step 4: Any book + OR level +1
        if (!$assignedBookId) {
            $assignedBookId = Book::where('or_level', $studentOrLevel + 1)
                ->whereNotIn('id', $reviewedBookIds)
                ->inRandomOrder()
                ->value('id');
        }

        // Step 5: Still nothing
        if (!$assignedBookId) {
            $assignedBookId = null; // or return 'N/A';
            $book_name = 'N/A';
        }else{
            $book_name = Book::find($assignedBookId)->title;
        }

        $user->update(['book_id' => $assignedBookId, 'current_book_name' => $book_name]);

        return redirect()->back();
    }



    public function updatePassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required',
            'new_password' => 'required|min:8|confirmed',
        ]);

        $user = Auth::user();

        // Check if current password is correct
        if (!Hash::check($request->current_password, $user->password)) {
            return back()->with('error', 'Current password is incorrect.');
        }

        // Update the password
        $user->update([
            'password' => Hash::make($request->new_password),
        ]);

        return back()->with('success', 'Password updated successfully.');
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Student $student)
    {
        //
    }
}
