-- Create function to get booking details
CREATE FUNCTION ufn_BookedDetails
(
    @BookingId VARCHAR(5)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        b.BookingId,
        u.UserName,
        s.MovieName,
        t.TheatreName,
        s.ShowDate,
        s.ShowTime,
        b.NoOfTickets,
        b.TotalAmt
    FROM 
        BookingDetails b
    JOIN 
        Users u ON b.UserId = u.UserId
    JOIN 
        ShowDetails s ON b.ShowId = s.ShowId
    JOIN 
        TheatreDetails t ON s.TheatreId = t.TheatreId
    WHERE 
        b.BookingId = @BookingId
);
GO
