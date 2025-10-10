_**Shopping Cart Assignment
**_
-  **Why I chose class for ShoppingCart**_
I decided to use class for ShoppingCart because it needs reference semantics. The cart represents a single shared object 
that can be updated in different parts of the program. When items are added or removed from the cart, I want
those changes to be visible everywhere.
For example, in my code I have a function modifyCart(_:) that takes ShoppingCart as a parameter. When I call this function 
and modify the cart inside it, the original cart also changes. It shows that both references point to the same object.
This behavior makes sense for shopping cart because there should only be one instance for one user.

- **Why I chose struct for Product and Order**
I used struct for both Product and Order because they represent value types, because they are independent data and it should not be shared or
changed unexpectedly.
Each Product describes a single item and should stay constant after it is created. Using a
struct makes it clear that products are copied when assigned or passed, it helps to avoid unfortunate consequences.
Similarly, an Order is a snapshot of the cart at a specific time. Once order is created, it should not change
even if the original cart changes. Using a struct guarantees this immutability, so the order data remains isolated from future updates.

- _**Example where reference semantics matter**_
In the code, the function:
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: book, quantity: 2)
}
demonstrates reference semantics. When the function is called, it modifies the same ShoppingCart instance that exists outside
the function.
After the function call, the original cart is updated and has more items.
This shows that classes are reference types, so multiple references can point to the same object and any change through one
reference affects the others.

- _**Example where value semantics matter**_
Value semantics are shown in the following part:
let item1 = CartItem(product: chocolate, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
Here, item1 and item2 are two separate copies. Updating item2 does not affect item1, since CartItem is a struct. This behavior
ensures that each variable holds its own independent data and avoids unintentional changes to the original value.

- _**Challenges and how I solved them**_
The main challenge was understanding when to use a class and when to use a struct. At first, I tried reading materials and watching videos,
but still it wasn't 100% clear, because struct was something new to me, since I use Python in most of the time. Also the functions like removeAll() or .reduce()
are not something I am used to, so I am trying to practice with these parts to understand it better.
Another challenge was implementing discounts. I initially used fixed codes like SAVE10, but later simplified it by extracting
numbers directly from the discount code string. This made the logic more flexible and easier to extend.
Overall, this project helped me better understand the difference between reference and value types, as well as how to design
data models that behave predictably in Swift.

Output when cart was cleared: 
<img width="1470" height="956" alt="image" src="https://github.com/user-attachments/assets/493b65f6-04d1-45fa-8e34-4b52274cb21f" />

Output when cart is not cleared: 
<img width="1470" height="956" alt="Screenshot 2025-10-10 at 23 47 10" src="https://github.com/user-attachments/assets/28a57d17-6d42-49ea-a209-df302a198ae7" />
