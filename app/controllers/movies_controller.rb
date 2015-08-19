class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else 
      render :new
    end 
  end 

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else 
      render :edit
    end 
  end 

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end 

  def search

    runtime_in_minutes = params[:runtime_in_minutes]
    case runtime_in_minutes
    when 'Under 90 minutes'  
      min_duration = '0'
      max_duration = '90'

    when '90-120 minutes'  
      min_duration = '90'
      max_duration = '120'

    when 'Over 120 minutes'  
      min_duration = '120'
      max_duration = '99999'
    end

    #  @movies = Movie.find(:all, :conditions => ['title LIKE ? OR director LIKE ? OR runtime_in_minutes > ? AND runtime_in_minutes < ?', "%#{params[:title]}%", "%#{params[:director]}%", min_duration, max_duration])
    # render :index

    @movies = Movie.all 

    if !params[:title].empty? 
      @movies = @movies.where('title LIKE ?', "%#{params[:title]}%")
    end 

    if !params[:director].empty?
      @movies = @movies.where('director LIKE ?', "%#{params[:director]}%")
    end 

    if !params[:runtime_in_minutes].empty?
      @movies = @movies.where('runtime_in_minutes > ? AND runtime_in_minutes <= ?', min_duration, max_duration)
    end 

    render :index

  end 

  protected 

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
    )
  end  

end

