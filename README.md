# [Achieving UI Independence](https://medium.com/@IanKeen/1916a35a6899)
This is the accompanying project to the blog post.

It showcases a way to architect a project such that:

- View controllers are not responsible for navigation, nor aware of each other.
- Table views are not aware of the specific types of cells they display.

Thus decoupling everything in the UI layer in the same manner as other service layer objects.
