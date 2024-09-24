-- Create the view
CREATE VIEW Users_VIEW AS
SELECT id, name, age
FROM dbo.Users;

-- Create the Orders table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE Orders (
      id INT IDENTITY(1,1) PRIMARY KEY,
      product_id INT NOT NULL,
      quantity INT NOT NULL,
      user_id INT NOT NULL,
      shopping_mall_id INT NOT NULL,
      status NVARCHAR(10) NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
      FOREIGN KEY (product_id) REFERENCES Products(id),
      FOREIGN KEY (user_id) REFERENCES Users(id),
      FOREIGN KEY (shopping_mall_id) REFERENCES ShoppingMalls(id)
    );
END;
