-- Create stored procedure to book tickets
CREATE PROCEDURE usp_BookTheTicket
    @UserId VARCHAR(50),
    @ShowId INT,
    @NoOfTickets INT
AS
BEGIN
    DECLARE @TicketCost DECIMAL(6,2), @TicketsAvailable INT, @TotalAmt DECIMAL(6,2);
    DECLARE @BookingId VARCHAR(5), @MaxBookingId VARCHAR(5);

    -- Check if UserId is valid
    IF NOT EXISTS (SELECT 1 FROM Users WHERE UserId = @UserId)
    BEGIN
        RETURN -1; -- UserId is invalid
    END

    -- Check if ShowId is valid
    IF NOT EXISTS (SELECT 1 FROM ShowDetails WHERE ShowId = @ShowId)
    BEGIN
        RETURN -2; -- ShowId is invalid
    END

    -- Check if NoOfTickets is a positive value and less than or equal to TicketsAvailable
    SELECT @TicketsAvailable = TicketsAvailable, @TicketCost = TicketCost 
    FROM ShowDetails 
    WHERE ShowId = @ShowId;

    IF @NoOfTickets <= 0
    BEGIN
        RETURN -3; -- NoOfTickets is less than zero
    END
    ELSE IF @NoOfTickets > @TicketsAvailable
    BEGIN
        RETURN -4; -- NoOfTickets is greater than TicketsAvailable
    END

    -- Calculate the total amount
    SET @TotalAmt = @NoOfTickets * @TicketCost;

    -- Generate new BookingId
    SELECT @MaxBookingId = MAX(BookingId) FROM BookingDetails;
    IF @MaxBookingId IS NULL
    BEGIN
        SET @BookingId = 'B1001';
    END
    ELSE
    BEGIN
        SET @BookingId = 'B' + CAST(CAST(SUBSTRING(@MaxBookingId, 2, 4) AS INT) + 1 AS VARCHAR(4));
    END

    -- Insert the booking details
    INSERT INTO BookingDetails (BookingId, UserId, ShowId, NoOfTickets, TotalAmt)
    VALUES (@BookingId, @UserId, @ShowId, @NoOfTickets, @TotalAmt);

    -- Update the TicketsAvailable in ShowDetails
    UPDATE ShowDetails 
    SET TicketsAvailable = TicketsAvailable - @NoOfTickets 
    WHERE ShowId = @ShowId;

    RETURN 1; -- Successful insertion
END
GO
