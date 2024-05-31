-- Create function to get movie showtimes
CREATE FUNCTION ufn_GetMovieShowtimes
(
    @MovieName VARCHAR(50),
    @Location VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        s.MovieName,
        s.ShowDate,
        s.ShowTime,
        t.TheatreName,
        s.TicketCost
    FROM 
        ShowDetails s
    JOIN 
        TheatreDetails t ON s.TheatreId = t.TheatreId
    WHERE 
        s.MovieName = @MovieName AND
        t.Location = @Location
);
GO
