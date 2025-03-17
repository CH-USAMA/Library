<?php

namespace App\Http\Controllers;

use App\Models\Note;
use App\Models\user;
use Illuminate\Http\Request;

class NoteController extends Controller
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
        $data = Note::all();
        return view( 'note.list',['noteslist'=>$data]);
    }

    public function viewstudentnotes($id)
    {
        $data = Note::all(); //change query with id
        return view( 'note.list',['noteslist'=>$data,'selectedid'=>$id]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function notecreate()
    {
        $data = User::all();
        return view( 'note.form',['userslist'=>$data]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function notestore(Request $request)
    {
        //dd(vars: $request);
        $note = new Note();
        $note->title = $request->title;
        $note->date = $request->date;
        $note->content = $request->content;
        $note->teacher_id = $request->teacher_id;
        $note->student_id = $request->student_id;
        $note->save();
        //$note->user()->attach($request->id);
        return redirect()->route('notes');
    }

    /**
     * Display the specified resource.
     */
    public function show(Note $note)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function editnote($id)
    {
        $note = Note::find($id);
        return view('note.form',['note'=>$note]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateNote(Request $request)
    {
        $request->validate([
            'content' => ['nullable']
        ]);
        $id = $request->id;
        $note = Note::find(id: $id);
        //$note->update($request->all());
        //dd($note);
        //$note->update($request->all());
        $note->update($request->only('title', 'content'));
        //$note->update($request->all()->except(['title', 'content']));
        //$note->update($request->title);
        //$note->update($request->all());
        //User::where($id)->update($request->User);
        return redirect()->route('notes');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function deletenote($id)
    {
        Note::destroy($id);
        return redirect()->route('notes');
    }
}
