<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\User;
use App\Models\Genre;
use App\Models\Review;

//use App\Http\Requests\StoreBooksRequest;
use Illuminate\Http\Request;
//use App\Http\Requests\UpdateBooksRequest;
use Illuminate\Support\Facades\Auth;


class BookController extends Controller
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
        // $data = Book::all();
        $data = Book::withCount('review') // Get total reviews per book
        ->withAvg('review', 'rating') // Get average rating per book
        ->get();
        return view( 'books.list',['bookslist'=>$data]);
    }

    public function assignedBook()
    {
        $data = Book::with('review')->where('id', Auth::user()->book_id)->get();
        $totalReviews = Review::where('book_id', Auth::user()->book_id)->count();
        $avgRating = Review::where('book_id', Auth::user()->book_id)->avg('rating');
        $canReview = !Review::where('book_id', Auth::user()->book_id)
        ->where('student_id', Auth::id())
        ->exists();



        // dd($data);
        return view( 'books.studentAssignedBook',['book'=>$data, 'totalReviews'=>$totalReviews, 'avgRating'=>$avgRating, 'canReview'=>$canReview]);
    }
    public function tindex()
    {
        $data = Book::all();
        return view( 'books.workinglist');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function createbook()
    {
        $allgenres = Genre::all();
        return view( 'books.form',['genrelist'=>$allgenres]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function bookstore(Request $request)
    {
        //dd(vars: $request);
        $book = new Book();
        $book->publisher = $request->publisher;
        $book->author = $request->author;
        $book->title = $request->title;
        //$book->genre = $request->genre;
        $book->category = $request->category;
        $book->description = $request->description;
        $book->or_level = $request->or_level;
        if ($request->hasFile('image')){
            $imagename = $request->file('image');
            $filename = time() . '.' . $imagename->getClientOriginalExtension();
            $path = $request->file('image')->move(public_path('/assets/book-images/'), $filename);
            $book->image = $filename;
        }
        $book->save();
        $book->genre()->attach($request->genre);
        return redirect()->route('books');
    }

    /**
     * Display the specified resource.
     */
    public function show( $book)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function editbook( $id)
    {
        $allgenres = Genre::all();
        $book = Book::find($id);
        return view('books.form',['book'=>$book,'genrelist'=>$allgenres]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function updatebook(Request $request)
    {
        $request->validate([
            'title' => ['nullable']
        ]);
        $id = $request->id;
        $book = Book::find(id: $id);
        $book->update($request->all());
        //dd($note);
        //$note->update($request->all());
        //$book->update($request->only('title', 'content'));
        //$note->update($request->all()->except(['title', 'content']));
        //$note->update($request->title);
        //$note->update($request->all());
        //User::where($id)->update($request->User);
        return redirect()->route('books');
    }

    /**
     * Remove the specified resource from storage.
     */

    public function deletebook($id)
    {
        //$book = Book::find($id);
        //$book->delete();
        Book::destroy($id);
        return redirect()->route('books');

    }




   
}
