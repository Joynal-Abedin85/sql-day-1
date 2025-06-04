1. What is PostgreSQL?
PostgreSQL একটি ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা ডেটা সংরক্ষণ, পরিচালনা এবং নিরাপদভাবে অ্যাক্সেস করার জন্য ব্যবহৃত হয়। এটি SQL (Structured Query Language) ব্যবহার করে।

2. What is the purpose of a database schema in PostgreSQL?
একটি স্কিমা হলো ডেটাবেসের মধ্যে একটি যুক্তিসঙ্গত বিভাগ বা সংগঠন, যেখানে টেবিল, ভিউ, ফাংশন ইত্যাদি রাখা হয়। এটি একাধিক ইউজার বা অ্যাপ্লিকেশনের মধ্যে ডেটা আলাদা রাখতে সাহায্য করে।

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key: একটি টেবিলের এমন একটি কলাম যা প্রতিটি সারির জন্য ইউনিক মান নিশ্চিত করে। এটি নাল (NULL) হতে পারে না।

Foreign Key: একটি টেবিলের এমন একটি কলাম যা অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক স্থাপন করে।

4. Explain the purpose of the WHERE clause in a SELECT statement.

WHERE ক্লজ ব্যবহার করে ডেটাবেস থেকে নির্দিষ্ট শর্ত অনুযায়ী তথ্য বাছাই করা যায়। উদাহরণ:


SELECT * FROM students WHERE age > 18;
5. What are the LIMIT and OFFSET clauses used for?

LIMIT নির্ধারণ করে কতটি রেকর্ড রিটার্ন হবে।

OFFSET নির্ধারণ করে কতটি রেকর্ড স্কিপ করা হবে।

উদাহরণ:
SELECT * FROM products LIMIT 10 OFFSET 20;


* 6. How can you modify data using UPDATE statements?
UPDATE ব্যবহার করে টেবিলের ডেটা আপডেট করা যায়।
উদাহরণ:


UPDATE students SET age = 20 WHERE id = 1;