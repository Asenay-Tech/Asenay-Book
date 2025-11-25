drop extension if exists "pg_net";

drop policy "Anyone can view avatars" on "storage"."objects";

drop policy "Authenticated users can upload avatars" on "storage"."objects";

drop policy "Users can delete their own documents" on "storage"."objects";

drop policy "Users can update their own avatars" on "storage"."objects";

drop policy "Users can upload their own documents" on "storage"."objects";

drop policy "Users can view their own documents" on "storage"."objects";


