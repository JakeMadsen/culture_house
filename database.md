# Tables for db_kulturhavnen

tb_users
- user_id       - int           - auto increment
- user_name     - varchar - 50  - unique
- user_password - varchar - 25
- fk_user_info  - tb_user_info  -> fk_info_id
- fk_user_role  - tb_user_roles -> fk_role_id

tb_user_info
- info_id       - int           - auto increment
- info_name     - varchar - 50
- info_surName  - varchar - 50
- info_email    - varchar - 255

tb_user_roles
- role_id       - int           - auto increment
- role_name     - varchar - 50  - unique




tb_events
- event_id      - int           - auto increment
- event_name    - varchar 100
- event_text    - text         
- event_start   - datetime
- event_end     - datetime
- event_image   - varchar 255
- fk_event_type - tb_event_types -> fk_type_id

tb_event_types
- type_id       - int           - auto increment
- type_name     - varchar - 50  - unique
- type_text     - text
- type_image    - varchar - 255

Titel
Billede
Event type
dato
    - start
    - slut
pris
    - børn
    - voksen
    - pensionist
Adresse
    - vej
    - post nr
    - by
    - land
    - bygning nr
    - lokale nr
Kontakt
    - email
    - tlf
    - hjemmeside
Text