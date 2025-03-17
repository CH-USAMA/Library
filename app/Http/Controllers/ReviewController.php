<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Review;
use App\Http\Requests\StoreReviewsRequest;
use App\Http\Requests\UpdateReviewsRequest;
use App\Models\User;
use App\Models\Book;
class ReviewController extends Controller
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
    public function reviewlist()
    {
        $data = Review::with('student','book')->get();
        //dd($data);
        return view('reviews.list',['reviewslist'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function createreview($student_id,$book_id)
    {
        $book = Book::where('id', $book_id)->first();          
        $student = User::where('id', $student_id)->first();
        return view('reviews.form',compact('book', 'student'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function storereview(Request $request)
    {
        //dd($request);
        $review = new Review();
        $review->book_id = $request->book_id;
        $review->student_id = $request->student_id;
        $review->rating = $request->rating;
        $review->comment_text = $request->comment_text;
        $review->save();
        return redirect()->route('reviews');

    }

    /**
     * Display the specified resource.
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update($request, Review $review)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function deletereview($id)
    {
        Review::destroy($id);
        return redirect()->route('reviews');
    }
}
