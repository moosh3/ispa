--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Database creation
--

REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO postgres;

--
-- Name: blog_blogindexpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


ALTER TABLE blog_blogindexpage OWNER TO postgres;

--
-- Name: blog_blogpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blogpage (
    page_ptr_id integer NOT NULL,
    date date NOT NULL,
    intro character varying(250) NOT NULL,
    body text NOT NULL
);


ALTER TABLE blog_blogpage OWNER TO postgres;

--
-- Name: core_alumni; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_alumni (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(128),
    image character varying(100),
    description character varying(512),
    slug character varying(40),
    extended_description text
);


ALTER TABLE core_alumni OWNER TO postgres;

--
-- Name: core_alumni_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_alumni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_alumni_id_seq OWNER TO postgres;

--
-- Name: core_alumni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_alumni_id_seq OWNED BY core_alumni.id;


--
-- Name: core_sponsor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_sponsor (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(128),
    image character varying(100),
    description character varying(512),
    slug character varying(40),
    extended_description text
);


ALTER TABLE core_sponsor OWNER TO postgres;

--
-- Name: core_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_sponsor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sponsor_id_seq OWNER TO postgres;

--
-- Name: core_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_sponsor_id_seq OWNED BY core_sponsor.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: events_announcement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_announcement (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(128),
    text text,
    slug character varying(40)
);


ALTER TABLE events_announcement OWNER TO postgres;

--
-- Name: events_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_announcement_id_seq OWNER TO postgres;

--
-- Name: events_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_announcement_id_seq OWNED BY events_announcement.id;


--
-- Name: events_attendance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_attendance (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL,
    is_owner boolean NOT NULL,
    attending boolean NOT NULL
);


ALTER TABLE events_attendance OWNER TO postgres;

--
-- Name: events_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_attendance_id_seq OWNER TO postgres;

--
-- Name: events_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_attendance_id_seq OWNED BY events_attendance.id;


--
-- Name: events_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_event (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    slug character varying(40),
    date timestamp with time zone,
    description character varying(512),
    is_active boolean NOT NULL,
    name character varying(256),
    event_type character varying(128),
    location_id integer NOT NULL,
    image character varying(100),
    extended_description text,
    points integer,
    CONSTRAINT events_event_points_check CHECK ((points >= 0))
);


ALTER TABLE events_event OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_event_id_seq OWNED BY events_event.id;


--
-- Name: events_eventlocation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_eventlocation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    address character varying(45),
    address2 character varying(45),
    city character varying(45),
    state character varying(45),
    zipcode character varying(10)
);


ALTER TABLE events_eventlocation OWNER TO postgres;

--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_eventlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_eventlocation_id_seq OWNER TO postgres;

--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_eventlocation_id_seq OWNED BY events_eventlocation.id;


--
-- Name: events_speaker; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_speaker (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(128),
    image character varying(100),
    description character varying(512),
    slug character varying(40),
    event_id integer NOT NULL
);


ALTER TABLE events_speaker OWNER TO postgres;

--
-- Name: events_speaker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_speaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_speaker_id_seq OWNER TO postgres;

--
-- Name: events_speaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_speaker_id_seq OWNED BY events_speaker.id;


--
-- Name: events_userprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_userprofile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    avatar character varying(100),
    bio text,
    user_type character varying(1024) NOT NULL,
    user_id integer NOT NULL,
    points integer,
    year character varying(56) NOT NULL,
    dues_paid boolean NOT NULL,
    CONSTRAINT events_userprofile_points_check CHECK ((points >= 0))
);


ALTER TABLE events_userprofile OWNER TO postgres;

--
-- Name: events_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_userprofile_id_seq OWNER TO postgres;

--
-- Name: events_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_userprofile_id_seq OWNED BY events_userprofile.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE wagtailcore_collection OWNER TO postgres;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_collection_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_collection_id_seq OWNED BY wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE wagtailcore_collectionviewrestriction OWNER TO postgres;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE wagtailcore_collectionviewrestriction_groups OWNER TO postgres;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_collectionviewrestriction_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_collectionviewrestriction_id_seq OWNED BY wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE wagtailcore_groupcollectionpermission OWNER TO postgres;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_groupcollectionpermission_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_groupcollectionpermission_id_seq OWNED BY wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailcore_grouppagepermission OWNER TO postgres;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_grouppagepermission_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE wagtailcore_page OWNER TO postgres;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_page_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE wagtailcore_pagerevision OWNER TO postgres;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pagerevision_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE wagtailcore_pageviewrestriction OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE wagtailcore_pageviewrestriction_groups OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pageviewrestriction_groups_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq OWNED BY wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pageviewrestriction_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE wagtailcore_site OWNER TO postgres;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_site_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL
);


ALTER TABLE wagtaildocs_document OWNER TO postgres;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtaildocs_document_id_seq OWNER TO postgres;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE wagtailembeds_embed OWNER TO postgres;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailembeds_embed_id_seq OWNER TO postgres;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailforms_formsubmission OWNER TO postgres;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailforms_formsubmission_id_seq OWNER TO postgres;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE wagtailimages_image OWNER TO postgres;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_image_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    image_id integer NOT NULL,
    filter_spec character varying(255) NOT NULL
);


ALTER TABLE wagtailimages_rendition OWNER TO postgres;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_rendition_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE wagtailredirects_redirect OWNER TO postgres;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailredirects_redirect_id_seq OWNER TO postgres;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE wagtailsearch_editorspick OWNER TO postgres;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_editorspick_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE wagtailsearch_query OWNER TO postgres;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_query_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE wagtailsearch_querydailyhits OWNER TO postgres;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_querydailyhits_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL
);


ALTER TABLE wagtailusers_userprofile OWNER TO postgres;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailusers_userprofile_id_seq OWNER TO postgres;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_alumni ALTER COLUMN id SET DEFAULT nextval('core_alumni_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_sponsor ALTER COLUMN id SET DEFAULT nextval('core_sponsor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_announcement ALTER COLUMN id SET DEFAULT nextval('events_announcement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_attendance ALTER COLUMN id SET DEFAULT nextval('events_attendance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_event ALTER COLUMN id SET DEFAULT nextval('events_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_eventlocation ALTER COLUMN id SET DEFAULT nextval('events_eventlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_speaker ALTER COLUMN id SET DEFAULT nextval('events_speaker_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_userprofile ALTER COLUMN id SET DEFAULT nextval('events_userprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	aleccunningham96@gmail.com	f	f	1
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 1, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	1	3
5	1	4
6	2	2
7	2	3
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can access Wagtail admin	2	access_admin
2	Can add document	3	add_document
3	Can change document	3	change_document
4	Can delete document	3	delete_document
5	Can add image	4	add_image
6	Can change image	4	change_image
7	Can delete image	4	delete_image
8	Can add group	5	add_group
9	Can change group	5	change_group
10	Can delete group	5	delete_group
11	Can add user	6	add_user
12	Can change user	6	change_user
13	Can delete user	6	delete_user
14	Can add permission	7	add_permission
15	Can change permission	7	change_permission
16	Can delete permission	7	delete_permission
17	Can add content type	8	add_contenttype
18	Can change content type	8	change_contenttype
19	Can delete content type	8	delete_contenttype
20	Can add session	9	add_session
21	Can change session	9	change_session
22	Can delete session	9	delete_session
23	Can add site	10	add_site
24	Can change site	10	change_site
25	Can delete site	10	delete_site
26	Can add Token	11	add_token
27	Can change Token	11	change_token
28	Can delete Token	11	delete_token
29	Can add email confirmation	12	add_emailconfirmation
30	Can change email confirmation	12	change_emailconfirmation
31	Can delete email confirmation	12	delete_emailconfirmation
32	Can add email address	13	add_emailaddress
33	Can change email address	13	change_emailaddress
34	Can delete email address	13	delete_emailaddress
35	Can add Tag	14	add_tag
36	Can change Tag	14	change_tag
37	Can delete Tag	14	delete_tag
38	Can add Tagged Item	15	add_taggeditem
39	Can change Tagged Item	15	change_taggeditem
40	Can delete Tagged Item	15	delete_taggeditem
41	Can add log entry	16	add_logentry
42	Can change log entry	16	change_logentry
43	Can delete log entry	16	delete_logentry
44	Can add form submission	17	add_formsubmission
45	Can change form submission	17	change_formsubmission
46	Can delete form submission	17	delete_formsubmission
47	Can add redirect	18	add_redirect
48	Can change redirect	18	change_redirect
49	Can delete redirect	18	delete_redirect
50	Can add embed	19	add_embed
51	Can change embed	19	change_embed
52	Can delete embed	19	delete_embed
53	Can add user profile	20	add_userprofile
54	Can change user profile	20	change_userprofile
55	Can delete user profile	20	delete_userprofile
56	Can add rendition	21	add_rendition
57	Can change rendition	21	change_rendition
58	Can delete rendition	21	delete_rendition
59	Can add query	22	add_query
60	Can change query	22	change_query
61	Can delete query	22	delete_query
62	Can add Query Daily Hits	23	add_querydailyhits
63	Can change Query Daily Hits	23	change_querydailyhits
64	Can delete Query Daily Hits	23	delete_querydailyhits
65	Can add site	24	add_site
66	Can change site	24	change_site
67	Can delete site	24	delete_site
68	Can add group page permission	25	add_grouppagepermission
69	Can change group page permission	25	change_grouppagepermission
70	Can delete group page permission	25	delete_grouppagepermission
71	Can add collection view restriction	26	add_collectionviewrestriction
72	Can change collection view restriction	26	change_collectionviewrestriction
73	Can delete collection view restriction	26	delete_collectionviewrestriction
74	Can add page view restriction	27	add_pageviewrestriction
75	Can change page view restriction	27	change_pageviewrestriction
76	Can delete page view restriction	27	delete_pageviewrestriction
77	Can add group collection permission	28	add_groupcollectionpermission
78	Can change group collection permission	28	change_groupcollectionpermission
79	Can delete group collection permission	28	delete_groupcollectionpermission
80	Can add collection	29	add_collection
81	Can change collection	29	change_collection
82	Can delete collection	29	delete_collection
83	Can add page revision	30	add_pagerevision
84	Can change page revision	30	change_pagerevision
85	Can delete page revision	30	delete_pagerevision
86	Can add page	1	add_page
87	Can change page	1	change_page
88	Can delete page	1	delete_page
89	Can add attendance	31	add_attendance
90	Can change attendance	31	change_attendance
91	Can delete attendance	31	delete_attendance
95	Can add event	33	add_event
96	Can change event	33	change_event
97	Can delete event	33	delete_event
98	Can add event location	34	add_eventlocation
99	Can change event location	34	change_eventlocation
100	Can delete event location	34	delete_eventlocation
101	Can add user profile	35	add_userprofile
102	Can change user profile	35	change_userprofile
103	Can delete user profile	35	delete_userprofile
104	Can add social application token	36	add_socialtoken
105	Can change social application token	36	change_socialtoken
106	Can delete social application token	36	delete_socialtoken
107	Can add social application	37	add_socialapp
108	Can change social application	37	change_socialapp
109	Can delete social application	37	delete_socialapp
110	Can add social account	38	add_socialaccount
111	Can change social account	38	change_socialaccount
112	Can delete social account	38	delete_socialaccount
113	Can add speaker	39	add_speaker
114	Can change speaker	39	change_speaker
115	Can delete speaker	39	delete_speaker
116	Can add sponsor	40	add_sponsor
117	Can change sponsor	40	change_sponsor
118	Can delete sponsor	40	delete_sponsor
119	Can add announcement	41	add_announcement
120	Can change announcement	41	change_announcement
121	Can delete announcement	41	delete_announcement
122	Can add blog page	42	add_blogpage
123	Can change blog page	42	change_blogpage
124	Can delete blog page	42	delete_blogpage
125	Can add blog index page	43	add_blogindexpage
126	Can change blog index page	43	change_blogindexpage
127	Can delete blog index page	43	delete_blogindexpage
128	Can add alumni	44	add_alumni
129	Can change alumni	44	change_alumni
130	Can delete alumni	44	delete_alumni
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 130, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	argon2$argon2i$v=19$m=512,t=2,p=2$SFFoWWY1ZUFJaUFp$chc7tImnMxtS9wWnJcGc+A	\N	f	Emily				f	t	2017-08-09 00:30:37.431999+00
5	argon2$argon2i$v=19$m=512,t=2,p=2$M3lGcDhRN0psM3U0$05uwGIuB5JA4EF5x90adkg	\N	f	Tristan				f	t	2017-08-09 00:30:47.5403+00
6	argon2$argon2i$v=19$m=512,t=2,p=2$cEhuOVd6VUhKakU5$u5q5oFSHJ5M+jF+Gn4L8Iw	\N	f	Julie				f	t	2017-08-09 00:30:55.889404+00
7	argon2$argon2i$v=19$m=512,t=2,p=2$ZXRRYWFjeHFCbTlY$WLwueXLOr68NwrNUKLkijw	\N	f	Griffin				f	t	2017-08-09 00:31:07.190034+00
8	argon2$argon2i$v=19$m=512,t=2,p=2$Um9pbUxBanpKSFlu$2m2fa1R4ysUhYDUZhG/xrw	\N	f	Bobby				f	t	2017-08-09 00:31:14.825061+00
9	argon2$argon2i$v=19$m=512,t=2,p=2$NkRQMlhKUGVxcFdy$AmTHFbeBSFIzvAL8ZJC3gA	\N	f	Krissy				f	t	2017-08-09 00:31:31.763093+00
10	argon2$argon2i$v=19$m=512,t=2,p=2$YkN0YjluY0VBY3Fm$WvG0/dpmVLd2JcWYwraLZA	\N	f	Mark				f	t	2017-08-09 00:31:39.608588+00
11	argon2$argon2i$v=19$m=512,t=2,p=2$ODJLSFBheHM4VUU5$JmNzFPtMv2kFdknjeAtmlg	\N	f	Brandon				f	t	2017-08-09 00:31:49.42378+00
12	argon2$argon2i$v=19$m=512,t=2,p=2$TmZHZDc4UEpKMVZ4$6rYagfsSAXQ8E7bWfUtfcw	\N	f	Jackson				f	t	2017-08-09 00:31:56.956118+00
13	argon2$argon2i$v=19$m=512,t=2,p=2$S05OZDZ3NWxKcHZY$xWQa/eC2aYbl2FKg/YdECA	\N	f	Mike				f	t	2017-08-09 00:32:06.57426+00
3	argon2$argon2i$v=19$m=512,t=2,p=2$dWRsS283TWwyR3dS$ZzY+3sRtaL+2BH9fGoDAIg	2017-08-13 17:47:13.429243+00	f	Freddy				f	t	2017-08-09 00:30:26.113854+00
14	argon2$argon2i$v=19$m=512,t=2,p=2$ZkgzOXpySklscWZG$E+OomWgvRsksaIihz4mOXA	\N	f	abby.kalsto	Abby	Kalsto	akalsto2@gmail.com	t	t	2017-08-20 18:09:13+00
15	argon2$argon2i$v=19$m=512,t=2,p=2$TXZUaTJlZThqUVNZ$MYZdHI2NNV/8iEJJc9e4mg	\N	f	austin.montbriand	Austin	Montbriand	austinmonty1827@gmail.com	t	t	2017-08-20 18:09:57+00
16	argon2$argon2i$v=19$m=512,t=2,p=2$ZU1vSVE5TUN5R2p5$l7yOZr8WDXbKn3LF7KluYw	\N	f	holt.erikson	Holt	Erikson	holterikson@gmail.com	t	t	2017-08-20 18:12:26+00
17	argon2$argon2i$v=19$m=512,t=2,p=2$VlJ3WDViRVZzNEN6$g1fZr3SUacXkxS3847To5A	\N	f	brandon.blunk	Brandon	Blunk	blunk.brandon@illinois.edu	t	t	2017-08-20 18:13:03+00
1	argon2$argon2i$v=19$m=512,t=2,p=2$OGFJSlNWdGVuUURK$2hFfCO/Wenc0K4SUco7F7Q	2017-08-20 23:36:53.363428+00	t	alec.cunningham	Alec	Cunningham	aleccunningham96@gmail.com	t	t	2017-08-08 23:54:56+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 17, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: blog_blogindexpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogindexpage (page_ptr_id, intro) FROM stdin;
3	
\.


--
-- Data for Name: blog_blogpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogpage (page_ptr_id, date, intro, body) FROM stdin;
4	2017-08-20	sidfj	<p>sdafasdf</p>
\.


--
-- Data for Name: core_alumni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_alumni (id, created, modified, name, image, description, slug, extended_description) FROM stdin;
1	2017-08-20 17:53:05.53415+00	2017-08-20 17:53:05.534211+00	German Montero		Manager, New Buisness	german-montero	Teams at The Madison Square Garden Company
2	2017-08-20 17:53:40.03745+00	2017-08-20 17:53:40.03752+00	Justin Acton		Assistant  Ticket Manager	justin-acton	DIA Ticket Office
3	2017-08-20 17:54:10.364586+00	2017-08-20 17:54:10.364622+00	Julie Krueger		Coach Supports Specialist	julie-krueger	At Hudi
4	2017-08-20 17:54:48.301638+00	2017-08-20 17:54:48.301801+00	Phil Bedella		Vice President and General Manager		At Comcast Sportsnet Chicago
\.


--
-- Name: core_alumni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_alumni_id_seq', 4, true);


--
-- Data for Name: core_sponsor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_sponsor (id, created, modified, name, image, description, slug, extended_description) FROM stdin;
\.


--
-- Name: core_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_sponsor_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-08-08 23:57:18.208945+00	1	1285 West Victoria Street	1	[{"added": {}}]	34	1
2	2017-08-08 23:57:26.421528+00	2	1234 Main Street	1	[{"added": {}}]	34	1
3	2017-08-08 23:58:32.434308+00	3	324 University St.	1	[{"added": {}}]	34	1
4	2017-08-08 23:58:54.883802+00	4	366 N. VanNortwick	1	[{"added": {}}]	34	1
5	2017-08-09 00:15:01.464089+00	1	Fall Semester Meeting	1	[{"added": {}}, {"added": {"name": "attendance", "object": "alec"}}]	33	1
6	2017-08-09 00:28:48.450759+00	2	freddy	1	[{"added": {}}]	6	1
7	2017-08-09 00:29:48.625468+00	2	freddy	3		6	1
8	2017-08-09 00:30:26.17438+00	3	Freddy	1	[{"added": {}}]	6	1
9	2017-08-09 00:30:37.559502+00	4	Emily	1	[{"added": {}}]	6	1
10	2017-08-09 00:30:47.645574+00	5	Tristan	1	[{"added": {}}]	6	1
11	2017-08-09 00:30:55.945556+00	6	Julie	1	[{"added": {}}]	6	1
12	2017-08-09 00:31:07.245272+00	7	Griffin	1	[{"added": {}}]	6	1
13	2017-08-09 00:31:14.892143+00	8	Bobby	1	[{"added": {}}]	6	1
14	2017-08-09 00:31:31.815672+00	9	Krissy	1	[{"added": {}}]	6	1
15	2017-08-09 00:31:39.747485+00	10	Mark	1	[{"added": {}}]	6	1
16	2017-08-09 00:31:49.489386+00	11	Brandon	1	[{"added": {}}]	6	1
17	2017-08-09 00:31:57.018773+00	12	Jackson	1	[{"added": {}}]	6	1
18	2017-08-09 00:32:06.629358+00	13	Mike	1	[{"added": {}}]	6	1
19	2017-08-09 00:33:01.410711+00	1	Fall Semester Meeting	2	[{"added": {"name": "attendance", "object": "Bobby"}}, {"added": {"name": "attendance", "object": "Brandon"}}, {"added": {"name": "attendance", "object": "Emily"}}, {"added": {"name": "attendance", "object": "Freddy"}}, {"added": {"name": "attendance", "object": "Jackson"}}, {"added": {"name": "attendance", "object": "Mike"}}]	33	1
20	2017-08-09 00:34:29.460276+00	2	Chicago trip	1	[{"added": {}}, {"added": {"name": "attendance", "object": "Freddy"}}, {"added": {"name": "attendance", "object": "Krissy"}}, {"added": {"name": "attendance", "object": "Bobby"}}, {"added": {"name": "attendance", "object": "Jackson"}}, {"added": {"name": "attendance", "object": "Emily"}}]	33	1
21	2017-08-09 00:34:44.188092+00	1	Fall Semester Meeting	2	[{"changed": {"name": "attendance", "object": "Bobby", "fields": ["status"]}}, {"changed": {"name": "attendance", "object": "Brandon", "fields": ["status"]}}, {"changed": {"name": "attendance", "object": "Emily", "fields": ["status"]}}, {"changed": {"name": "attendance", "object": "Freddy", "fields": ["status"]}}, {"changed": {"name": "attendance", "object": "Jackson", "fields": ["status"]}}, {"changed": {"name": "attendance", "object": "Mike", "fields": ["status"]}}]	33	1
22	2017-08-09 00:36:50.58921+00	3	Christmas	1	[{"added": {}}, {"added": {"object": "Mark", "name": "attendance"}}, {"added": {"object": "Emily", "name": "attendance"}}, {"added": {"object": "Krissy", "name": "attendance"}}, {"added": {"object": "alec", "name": "attendance"}}, {"added": {"object": "Mike", "name": "attendance"}}, {"added": {"object": "Tristan", "name": "attendance"}}]	33	1
23	2017-08-09 00:37:45.090694+00	4	Official meeting	1	[{"added": {}}, {"added": {"object": "Tristan", "name": "attendance"}}, {"added": {"object": "Jackson", "name": "attendance"}}, {"added": {"object": "Krissy", "name": "attendance"}}, {"added": {"object": "alec", "name": "attendance"}}, {"added": {"object": "Bobby", "name": "attendance"}}, {"added": {"object": "Mark", "name": "attendance"}}]	33	1
24	2017-08-10 00:08:15.922819+00	13	alec	1	[{"added": {}}]	35	1
25	2017-08-12 20:57:43.732035+00	2	Chicago trip	2	[{"changed": {"fields": ["extended_description"]}}]	33	1
26	2017-08-12 20:57:58.03046+00	3	Christmas	2	[{"changed": {"fields": ["extended_description"]}}]	33	1
27	2017-08-12 20:58:04.358529+00	1	Fall Semester Meeting	2	[{"changed": {"fields": ["extended_description"]}}]	33	1
28	2017-08-12 20:58:11.301533+00	4	Official meeting	2	[{"changed": {"fields": ["extended_description"]}}]	33	1
29	2017-08-12 21:55:37.162056+00	8	adfs	3		34	1
30	2017-08-12 21:55:37.172935+00	7	asdf	3		34	1
31	2017-08-12 21:55:37.181578+00	6	sdf	3		34	1
32	2017-08-12 21:55:37.189683+00	5	Form	3		34	1
33	2017-08-12 22:04:26.240103+00	13	alec	2	[{"changed": {"fields": ["avatar"]}}]	35	1
34	2017-08-12 22:26:35.930937+00	13	alec	2	[{"changed": {"fields": ["avatar"]}}]	35	1
35	2017-08-13 04:19:44.900544+00	2	Chicago trip	2	[{"changed": {"fields": ["points"]}}]	33	1
36	2017-08-13 04:19:52.915822+00	3	Christmas	2	[{"changed": {"fields": ["points"]}}]	33	1
37	2017-08-13 04:20:01.69714+00	1	Fall Semester Meeting	2	[{"changed": {"fields": ["points"]}}]	33	1
38	2017-08-13 04:20:09.299+00	4	Official meeting	2	[{"changed": {"fields": ["points"]}}]	33	1
39	2017-08-14 02:59:34.251864+00	13	alec	2	[{"changed": {"fields": ["points"]}}]	35	1
40	2017-08-14 02:59:40.456561+00	12	Mike	2	[{"changed": {"fields": ["points"]}}]	35	1
41	2017-08-14 02:59:46.769406+00	11	Jackson	2	[{"changed": {"fields": ["points"]}}]	35	1
42	2017-08-14 02:59:54.703904+00	10	Brandon	2	[{"changed": {"fields": ["points"]}}]	35	1
43	2017-08-14 03:00:00.858476+00	9	Mark	2	[{"changed": {"fields": ["points"]}}]	35	1
44	2017-08-14 03:00:01.261382+00	9	Mark	2	[]	35	1
45	2017-08-14 03:00:08.781528+00	8	Krissy	2	[{"changed": {"fields": ["points"]}}]	35	1
46	2017-08-14 03:00:28.836994+00	7	Bobby	2	[{"changed": {"fields": ["points"]}}]	35	1
47	2017-08-14 03:00:35.800602+00	6	Griffin	2	[{"changed": {"fields": ["points"]}}]	35	1
48	2017-08-14 03:00:42.175225+00	5	Julie	2	[{"changed": {"fields": ["points"]}}]	35	1
49	2017-08-14 03:00:49.696524+00	4	Tristan	2	[{"changed": {"fields": ["points"]}}]	35	1
50	2017-08-14 03:00:55.836946+00	3	Emily	2	[{"changed": {"fields": ["points"]}}]	35	1
51	2017-08-14 03:01:02.227554+00	2	Freddy	2	[{"changed": {"fields": ["points"]}}]	35	1
52	2017-08-20 01:02:37.153695+00	9	Wrigley Field	1	[{"added": {}}]	34	1
53	2017-08-20 01:03:08.154171+00	5	Chicago Cubs Game	1	[{"added": {}}, {"added": {"name": "attendance", "object": "Tristan"}}]	33	1
54	2017-08-20 01:04:14.135785+00	10	Soldier Field	1	[{"added": {}}]	34	1
55	2017-08-20 01:04:48.135051+00	6	Chicago Bears Game	1	[{"added": {}}, {"added": {"name": "attendance", "object": "Tristan"}}]	33	1
56	2017-08-20 01:05:55.823456+00	11	United Center	1	[{"added": {}}]	34	1
57	2017-08-20 01:06:25.076064+00	7	Chicago Bulls and Chicago Blackhawks	1	[{"added": {}}]	33	1
58	2017-08-20 01:08:27.430551+00	12	Guaranteed  Rate Field	1	[{"added": {}}]	34	1
59	2017-08-20 01:08:36.35745+00	8	Chicago White Sox	1	[{"added": {}}, {"added": {"name": "attendance", "object": "Tristan"}}]	33	1
60	2017-08-20 01:10:46.378085+00	13	Bankers Life Fieldhouse	1	[{"added": {}}]	34	1
61	2017-08-20 01:11:03.103795+00	9	Indiana Pacers	1	[{"added": {}}, {"added": {"name": "attendance", "object": "Tristan"}}]	33	1
62	2017-08-20 01:11:17.658458+00	2	Chicago trip	3		33	1
63	2017-08-20 01:13:47.779512+00	14	SPEAKER_LOCATION	1	[{"added": {}}]	34	1
64	2017-08-20 01:14:06.300971+00	10	SPEAKER_EVENT	1	[{"added": {}}]	33	1
65	2017-08-20 01:14:09.341374+00	1	Colin Faulkner	1	[{"added": {}}]	39	1
66	2017-08-20 17:35:24.90414+00	15	Huff Hall	1	[{"added": {}}]	34	1
67	2017-08-20 17:36:34.07022+00	11	Fall 2017 Info Night	1	[{"added": {}}]	33	1
68	2017-08-20 17:38:15.254808+00	16	Sapora Symposium	1	[{"added": {}}]	34	1
69	2017-08-20 17:38:38.710002+00	12	Sapora  Symposium Day One	1	[{"added": {}}]	33	1
70	2017-08-20 17:39:03.869951+00	13	Sapora  Symposium Day Two	1	[{"added": {}}]	33	1
71	2017-08-20 17:40:04.053518+00	17	State Farm Center	1	[{"added": {}}]	34	1
72	2017-08-20 17:40:13.025842+00	14	DIA Day Trip - Exploring Illinois Athletics	1	[{"added": {}}]	33	1
73	2017-08-20 17:41:30.974483+00	15	Indiana Pacers Trip	1	[{"added": {}}]	33	1
74	2017-08-20 17:43:58.268353+00	18	NCAA Headquarters	1	[{"added": {}}]	34	1
75	2017-08-20 17:44:07.895742+00	16	NCAA Headquarters Trip	1	[{"added": {}}]	33	1
76	2017-08-20 17:44:38.542012+00	3	Christmas	3		33	1
77	2017-08-20 17:44:38.55401+00	1	Fall Semester Meeting	3		33	1
78	2017-08-20 17:44:38.565002+00	4	Official meeting	3		33	1
79	2017-08-20 17:45:41.29386+00	19	Huff Hall	1	[{"added": {}}]	34	1
80	2017-08-20 17:45:41.549339+00	20	Huff Hall	1	[{"added": {}}]	34	1
81	2017-08-20 17:46:25.331137+00	17	Skype Speaker Dave Chase	1	[{"added": {}}]	33	1
82	2017-08-20 17:47:23.258442+00	18	Speaker Alex Roux	1	[{"added": {}}]	33	1
83	2017-08-20 17:48:04.584728+00	20	Huff Hall Room 2001	2	[{"changed": {"fields": ["address", "address2"]}}]	34	1
84	2017-08-20 17:49:17.695143+00	19	Speaker Brady Bruhn	1	[{"added": {}}]	33	1
85	2017-08-20 17:49:57.584346+00	2	Alex Roux	1	[{"added": {}}]	39	1
86	2017-08-20 17:50:41.422841+00	3	Brady Bruhn	1	[{"added": {}}]	39	1
87	2017-08-20 17:50:47.416103+00	1	Colin Faulkner	2	[]	39	1
88	2017-08-20 17:51:05.302332+00	2	Alex Roux	2	[{"changed": {"fields": ["slug"]}}]	39	1
89	2017-08-20 17:51:54.855546+00	19	Huff Hall	3		34	1
90	2017-08-20 17:51:54.865607+00	4	366 N. VanNortwick	3		34	1
91	2017-08-20 17:51:54.876182+00	3	324 University St.	3		34	1
92	2017-08-20 17:51:54.887568+00	2	1234 Main Street	3		34	1
93	2017-08-20 17:51:54.900255+00	1	1285 West Victoria Street	3		34	1
94	2017-08-20 17:53:05.550345+00	1	German Montero	1	[{"added": {}}]	44	1
95	2017-08-20 17:53:40.054637+00	2	Justin Acton	1	[{"added": {}}]	44	1
96	2017-08-20 17:54:10.389339+00	3	Julie Krueger	1	[{"added": {}}]	44	1
97	2017-08-20 17:54:48.313837+00	4	Phil Bedella	1	[{"added": {}}]	44	1
98	2017-08-20 18:00:47.200117+00	10	SPEAKER_EVENT	3		33	1
99	2017-08-20 18:01:10.902689+00	19	Speaker Brady Bruhn	2	[{"added": {"name": "attendance", "object": "Bobby"}}, {"added": {"name": "attendance", "object": "Jackson"}}, {"added": {"name": "attendance", "object": "Mark"}}, {"added": {"name": "attendance", "object": "Tristan"}}]	33	1
100	2017-08-20 18:01:34.870765+00	18	Speaker Alex Roux	2	[{"added": {"name": "attendance", "object": "alec"}}, {"added": {"name": "attendance", "object": "Krissy"}}, {"added": {"name": "attendance", "object": "Brandon"}}, {"added": {"name": "attendance", "object": "Griffin"}}, {"added": {"name": "attendance", "object": "Tristan"}}]	33	1
101	2017-08-20 18:01:55.337096+00	17	Skype Speaker Dave Chase	2	[{"added": {"name": "attendance", "object": "alec"}}, {"added": {"name": "attendance", "object": "Mark"}}, {"added": {"name": "attendance", "object": "Emily"}}, {"added": {"name": "attendance", "object": "Freddy"}}, {"added": {"name": "attendance", "object": "Brandon"}}]	33	1
102	2017-08-20 18:09:13.215641+00	14	Abby	1	[{"added": {}}]	6	1
103	2017-08-20 18:09:36.323785+00	14	Abby	2	[{"changed": {"fields": ["first_name", "last_name", "is_staff"]}}]	6	1
104	2017-08-20 18:09:57.608179+00	15	Austin	1	[{"added": {}}]	6	1
105	2017-08-20 18:10:09.260297+00	15	Austin	2	[{"changed": {"fields": ["first_name", "last_name", "is_staff"]}}]	6	1
106	2017-08-20 18:10:37.807979+00	15	Austin	2	[{"changed": {"fields": ["email"]}}]	6	1
107	2017-08-20 18:10:59.796427+00	1	Alec	2	[{"changed": {"fields": ["username", "first_name", "last_name"]}}]	6	1
108	2017-08-20 18:11:30.511485+00	14	abby.kalsto	2	[{"changed": {"fields": ["username", "email"]}}]	6	1
109	2017-08-20 18:11:40.874065+00	1	alec.cunningham	2	[{"changed": {"fields": ["username"]}}]	6	1
110	2017-08-20 18:11:52.452732+00	15	austin.montbriand	2	[{"changed": {"fields": ["username"]}}]	6	1
111	2017-08-20 18:12:26.401444+00	16	holt.erikson	1	[{"added": {}}]	6	1
112	2017-08-20 18:12:44.197409+00	16	holt.erikson	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff"]}}]	6	1
113	2017-08-20 18:13:03.146868+00	17	brandon.blunk	1	[{"added": {}}]	6	1
114	2017-08-20 18:13:23.932962+00	17	brandon.blunk	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff"]}}]	6	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 114, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailadmin	admin
3	wagtaildocs	document
4	wagtailimages	image
5	auth	group
6	auth	user
7	auth	permission
8	contenttypes	contenttype
9	sessions	session
10	sites	site
11	authtoken	token
12	account	emailconfirmation
13	account	emailaddress
14	taggit	tag
15	taggit	taggeditem
16	admin	logentry
17	wagtailforms	formsubmission
18	wagtailredirects	redirect
19	wagtailembeds	embed
20	wagtailusers	userprofile
21	wagtailimages	rendition
22	wagtailsearch	query
23	wagtailsearch	querydailyhits
24	wagtailcore	site
25	wagtailcore	grouppagepermission
26	wagtailcore	collectionviewrestriction
27	wagtailcore	pageviewrestriction
28	wagtailcore	groupcollectionpermission
29	wagtailcore	collection
30	wagtailcore	pagerevision
31	events	attendance
33	events	event
34	events	eventlocation
35	events	userprofile
36	socialaccount	socialtoken
37	socialaccount	socialapp
38	socialaccount	socialaccount
39	events	speaker
40	core	sponsor
41	events	announcement
42	blog	blogpage
43	blog	blogindexpage
44	core	alumni
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 44, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-08-08 23:53:56.114563+00
2	auth	0001_initial	2017-08-08 23:53:56.216959+00
3	account	0001_initial	2017-08-08 23:53:56.275847+00
4	account	0002_email_max_length	2017-08-08 23:53:56.301562+00
5	admin	0001_initial	2017-08-08 23:53:56.335952+00
6	admin	0002_logentry_remove_auto_add	2017-08-08 23:53:56.365404+00
7	api	0001_initial	2017-08-08 23:53:56.386156+00
8	api	0002_delete_snippet	2017-08-08 23:53:56.40027+00
9	contenttypes	0002_remove_content_type_name	2017-08-08 23:53:56.446192+00
10	auth	0002_alter_permission_name_max_length	2017-08-08 23:53:56.469733+00
11	auth	0003_alter_user_email_max_length	2017-08-08 23:53:56.491603+00
12	auth	0004_alter_user_username_opts	2017-08-08 23:53:56.514034+00
13	auth	0005_alter_user_last_login_null	2017-08-08 23:53:56.534893+00
14	auth	0006_require_contenttypes_0002	2017-08-08 23:53:56.539365+00
15	auth	0007_alter_validators_add_error_messages	2017-08-08 23:53:56.558973+00
16	auth	0008_alter_user_username_max_length	2017-08-08 23:53:56.583262+00
17	authtoken	0001_initial	2017-08-08 23:53:56.616561+00
18	authtoken	0002_auto_20160226_1747	2017-08-08 23:53:56.698044+00
19	events	0001_initial	2017-08-08 23:53:56.839919+00
20	events	0002_auto_20170805_1711	2017-08-08 23:53:56.934525+00
21	events	0003_auto_20170806_0519	2017-08-08 23:53:56.986682+00
22	sessions	0001_initial	2017-08-08 23:53:57.009221+00
23	sites	0001_initial	2017-08-08 23:53:57.022948+00
24	sites	0002_alter_domain_unique	2017-08-08 23:53:57.039318+00
25	taggit	0001_initial	2017-08-08 23:53:57.105038+00
26	taggit	0002_auto_20150616_2121	2017-08-08 23:53:57.136183+00
27	wagtailcore	0001_initial	2017-08-08 23:53:57.571156+00
28	wagtailcore	0002_initial_data	2017-08-08 23:53:57.575028+00
29	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2017-08-08 23:53:57.578151+00
30	wagtailcore	0004_page_locked	2017-08-08 23:53:57.581321+00
31	wagtailcore	0005_add_page_lock_permission_to_moderators	2017-08-08 23:53:57.584555+00
32	wagtailcore	0006_add_lock_page_permission	2017-08-08 23:53:57.587599+00
33	wagtailcore	0007_page_latest_revision_created_at	2017-08-08 23:53:57.591418+00
34	wagtailcore	0008_populate_latest_revision_created_at	2017-08-08 23:53:57.594645+00
35	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2017-08-08 23:53:57.597843+00
36	wagtailcore	0010_change_page_owner_to_null_on_delete	2017-08-08 23:53:57.600937+00
37	wagtailcore	0011_page_first_published_at	2017-08-08 23:53:57.604216+00
38	wagtailcore	0012_extend_page_slug_field	2017-08-08 23:53:57.607291+00
39	wagtailcore	0013_update_golive_expire_help_text	2017-08-08 23:53:57.610344+00
40	wagtailcore	0014_add_verbose_name	2017-08-08 23:53:57.613391+00
41	wagtailcore	0015_add_more_verbose_names	2017-08-08 23:53:57.616072+00
42	wagtailcore	0016_change_page_url_path_to_text_field	2017-08-08 23:53:57.618717+00
43	wagtailcore	0017_change_edit_page_permission_description	2017-08-08 23:53:57.653808+00
44	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2017-08-08 23:53:57.695833+00
45	wagtailcore	0019_verbose_names_cleanup	2017-08-08 23:53:57.832177+00
46	wagtailcore	0020_add_index_on_page_first_published_at	2017-08-08 23:53:57.869477+00
47	wagtailcore	0021_capitalizeverbose	2017-08-08 23:53:58.705533+00
48	wagtailcore	0022_add_site_name	2017-08-08 23:53:58.736772+00
49	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2017-08-08 23:53:58.792912+00
50	wagtailcore	0024_collection	2017-08-08 23:53:58.817+00
51	wagtailcore	0025_collection_initial_data	2017-08-08 23:53:58.828847+00
52	wagtailcore	0026_group_collection_permission	2017-08-08 23:53:58.922444+00
53	wagtailadmin	0001_create_admin_access_permissions	2017-08-08 23:53:58.951422+00
54	wagtailcore	0027_fix_collection_path_collation	2017-08-08 23:53:58.965456+00
55	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2017-08-08 23:53:59.024099+00
56	wagtailcore	0028_merge	2017-08-08 23:53:59.028786+00
57	wagtailcore	0029_unicode_slugfield_dj19	2017-08-08 23:53:59.067085+00
58	wagtailcore	0030_index_on_pagerevision_created_at	2017-08-08 23:53:59.108553+00
59	wagtailcore	0031_add_page_view_restriction_types	2017-08-08 23:53:59.218238+00
60	wagtailcore	0032_add_bulk_delete_page_permission	2017-08-08 23:53:59.263297+00
61	wagtailcore	0033_remove_golive_expiry_help_text	2017-08-08 23:53:59.422131+00
62	wagtailcore	0034_page_live_revision	2017-08-08 23:53:59.477673+00
63	wagtailcore	0035_page_last_published_at	2017-08-08 23:53:59.522807+00
64	wagtailcore	0036_populate_page_last_published_at	2017-08-08 23:53:59.536948+00
65	wagtailcore	0037_set_page_owner_editable	2017-08-08 23:53:59.592904+00
66	wagtailcore	0038_make_first_published_at_editable	2017-08-08 23:53:59.629629+00
67	wagtailcore	0039_collectionviewrestriction	2017-08-08 23:53:59.765952+00
68	wagtaildocs	0001_initial	2017-08-08 23:53:59.826338+00
69	wagtaildocs	0002_initial_data	2017-08-08 23:53:59.859025+00
70	wagtaildocs	0003_add_verbose_names	2017-08-08 23:53:59.974863+00
71	wagtaildocs	0004_capitalizeverbose	2017-08-08 23:54:00.171783+00
72	wagtaildocs	0005_document_collection	2017-08-08 23:54:00.229724+00
73	wagtaildocs	0006_copy_document_permissions_to_collections	2017-08-08 23:54:00.252387+00
74	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2017-08-08 23:54:00.306974+00
75	wagtaildocs	0007_merge	2017-08-08 23:54:00.311556+00
76	wagtailembeds	0001_initial	2017-08-08 23:54:00.342152+00
77	wagtailembeds	0002_add_verbose_names	2017-08-08 23:54:00.358844+00
78	wagtailembeds	0003_capitalizeverbose	2017-08-08 23:54:00.373625+00
79	wagtailforms	0001_initial	2017-08-08 23:54:00.437185+00
80	wagtailforms	0002_add_verbose_names	2017-08-08 23:54:00.522381+00
81	wagtailforms	0003_capitalizeverbose	2017-08-08 23:54:00.707625+00
82	wagtailimages	0001_initial	2017-08-08 23:54:00.858908+00
83	wagtailimages	0002_initial_data	2017-08-08 23:54:00.891076+00
84	wagtailimages	0003_fix_focal_point_fields	2017-08-08 23:54:01.043553+00
85	wagtailimages	0004_make_focal_point_key_not_nullable	2017-08-08 23:54:01.092421+00
86	wagtailimages	0005_make_filter_spec_unique	2017-08-08 23:54:01.152494+00
87	wagtailimages	0006_add_verbose_names	2017-08-08 23:54:01.353772+00
88	wagtailimages	0007_image_file_size	2017-08-08 23:54:01.40082+00
89	wagtailimages	0008_image_created_at_index	2017-08-08 23:54:01.453957+00
90	wagtailimages	0009_capitalizeverbose	2017-08-08 23:54:01.822342+00
91	wagtailimages	0010_change_on_delete_behaviour	2017-08-08 23:54:01.888743+00
92	wagtailimages	0011_image_collection	2017-08-08 23:54:01.947102+00
93	wagtailimages	0012_copy_image_permissions_to_collections	2017-08-08 23:54:01.97264+00
94	wagtailimages	0013_make_rendition_upload_callable	2017-08-08 23:54:02.019229+00
95	wagtailimages	0014_add_filter_spec_field	2017-08-08 23:54:02.135836+00
96	wagtailimages	0015_fill_filter_spec_field	2017-08-08 23:54:02.145465+00
97	wagtailimages	0016_deprecate_rendition_filter_relation	2017-08-08 23:54:02.283924+00
98	wagtailimages	0017_reduce_focal_point_key_max_length	2017-08-08 23:54:02.343303+00
99	wagtailimages	0018_remove_rendition_filter	2017-08-08 23:54:02.412493+00
100	wagtailimages	0019_delete_filter	2017-08-08 23:54:02.424598+00
101	wagtailredirects	0001_initial	2017-08-08 23:54:02.497563+00
102	wagtailredirects	0002_add_verbose_names	2017-08-08 23:54:02.604193+00
103	wagtailredirects	0003_make_site_field_editable	2017-08-08 23:54:02.782393+00
104	wagtailredirects	0004_set_unique_on_path_and_site	2017-08-08 23:54:02.883469+00
105	wagtailredirects	0005_capitalizeverbose	2017-08-08 23:54:03.11764+00
106	wagtailsearch	0001_initial	2017-08-08 23:54:03.255503+00
107	wagtailsearch	0002_add_verbose_names	2017-08-08 23:54:03.429136+00
108	wagtailsearch	0003_remove_editors_pick	2017-08-08 23:54:03.472819+00
109	wagtailusers	0001_initial	2017-08-08 23:54:03.528349+00
110	wagtailusers	0002_add_verbose_name_on_userprofile	2017-08-08 23:54:03.767533+00
111	wagtailusers	0003_add_verbose_names	2017-08-08 23:54:03.818221+00
112	wagtailusers	0004_capitalizeverbose	2017-08-08 23:54:03.968869+00
113	wagtailusers	0005_make_related_name_wagtail_specific	2017-08-08 23:54:04.03331+00
114	wagtailusers	0006_userprofile_prefered_language	2017-08-08 23:54:04.09106+00
115	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2017-08-08 23:54:04.099427+00
116	events	0004_auto_20170809_0006	2017-08-09 00:06:55.857571+00
117	events	0005_remove_event_points	2017-08-09 00:11:23.059084+00
118	events	0006_auto_20170809_0022	2017-08-09 00:22:55.78509+00
119	events	0007_auto_20170809_0028	2017-08-09 00:28:09.596654+00
120	events	0008_auto_20170809_0035	2017-08-09 00:35:24.701597+00
121	events	0009_event_extended_description	2017-08-09 02:04:50.488183+00
122	socialaccount	0001_initial	2017-08-12 19:48:25.994541+00
123	socialaccount	0002_token_max_lengths	2017-08-12 19:48:26.159121+00
124	socialaccount	0003_extra_data_default_dict	2017-08-12 19:48:26.220089+00
125	core	0001_initial	2017-08-13 04:02:04.646381+00
126	events	0010_speaker	2017-08-13 04:02:04.730757+00
127	events	0011_auto_20170813_0418	2017-08-13 04:18:02.989528+00
128	events	0012_auto_20170813_0418	2017-08-13 04:18:33.827754+00
129	events	0013_announcement	2017-08-13 17:45:57.141985+00
130	events	0014_userprofile_year	2017-08-13 22:25:04.521431+00
131	blog	0001_initial	2017-08-16 15:42:06.397309+00
132	blog	0002_blogpage	2017-08-16 15:42:06.469871+00
133	blog	0003_blogpagegalleryimage	2017-08-16 15:42:06.561192+00
134	blog	0004_auto_20170808_1917	2017-08-16 15:42:06.723501+00
135	core	0002_auto_20170820_0118	2017-08-20 01:18:12.64174+00
136	events	0015_auto_20170820_2320	2017-08-20 23:20:15.151787+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 136, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
acfxzpcc23g3j044p7702q8a1igukah5	ZTkyMTA4Yzk5NDI2MDY5ZjZhZmZmZjA3YzI5MTQ1ZGUzNTU4ZDc2MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlODYzNjg1YjlhNzQ0NWU2MzYwNGYwZjcyODQ2NjM4YzJlMWRhODMzIn0=	2017-08-24 02:56:56.433942+00
khyskuzctap12cpnf5sgvs1gvqowvvmh	NjJiNzIwYzZhNGMxZjNiYjdjZjg4YTc3YjE0MTM1MDk1MzA2MzIyOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTg2MzY4NWI5YTc0NDVlNjM2MDRmMGY3Mjg0NjYzOGMyZTFkYTgzMyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-08-27 04:07:57.353697+00
vpgivfm5brfllhe178fl7u3ct3g3zdxs	ODg0NzA1NWU2ODUxZGUwNDUxZmQ4MDlhZmI0ZjYxMTNiOTcyYjM2Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImU4NjM2ODViOWE3NDQ1ZTYzNjA0ZjBmNzI4NDY2MzhjMmUxZGE4MzMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIn0=	2017-08-31 22:52:51.624328+00
scnvd2psc5fgwelg0qy5frn0fhcgmlvn	NzIwYzY5Y2ZkMjQ2YzY2ZjllZTFhNTgxYjViNGMzODU4NDUxZWE5Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlODYzNjg1YjlhNzQ0NWU2MzYwNGYwZjcyODQ2NjM4YzJlMWRhODMzIn0=	2017-09-03 18:47:40.953486+00
dygswi1q7cng6wxy6kjczsl5d9dvk4qf	MTJlNjI0Mjk5NmM3OGI2MjlmMjJkNzQ4OTM5MWNlMGU1NGE0ZWFkZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTg2MzY4NWI5YTc0NDVlNjM2MDRmMGY3Mjg0NjYzOGMyZTFkYTgzMyJ9	2017-09-03 23:36:53.373507+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: events_announcement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_announcement (id, created, modified, title, text, slug) FROM stdin;
\.


--
-- Name: events_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_announcement_id_seq', 1, false);


--
-- Data for Name: events_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_attendance (id, event_id, user_id, is_owner, attending) FROM stdin;
25	5	5	f	t
26	6	5	f	t
27	8	5	f	t
28	9	5	f	t
29	19	8	f	t
30	19	12	f	t
31	19	10	f	t
32	19	5	f	t
33	18	1	f	t
34	18	9	f	t
35	18	11	f	t
36	18	7	f	t
37	18	5	t	t
38	17	1	f	t
39	17	10	f	t
40	17	4	f	t
41	17	3	f	t
42	17	11	f	t
\.


--
-- Name: events_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_attendance_id_seq', 42, true);


--
-- Data for Name: events_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_event (id, created, modified, slug, date, description, is_active, name, event_type, location_id, image, extended_description, points) FROM stdin;
19	2017-08-20 17:49:17.680912+00	2017-08-20 18:01:10.86543+00	speaker-brady-bruhn	2017-11-14 18:15:00+00	Ticket Manager at St. Louis Cardinals	t	Speaker Brady Bruhn	event	20			\N
18	2017-08-20 17:47:23.251574+00	2017-08-20 18:01:34.829827+00	speaker-alex-roux	2017-09-28 12:00:00+00	Big Ten Network	t	Speaker Alex Roux	event	20			\N
5	2017-08-20 01:03:08.134529+00	2017-08-20 01:03:08.134613+00	chicago-cubs-game	2016-09-15 12:00:00+00		t	Chicago Cubs Game	event	9		Our members got the unique opportunity to sit on the third baseline during batting practice and talk to some of the Cubs front office staff. Following our discussion, we stayed and enjoyed the game. \r\n\r\nhttps://www.facebook.com/pg/IllinoisSBA/videos/?ref=page_internal	\N
6	2017-08-20 01:04:48.119916+00	2017-08-20 01:04:48.119958+00	chicago-bears-game	2017-04-11 12:00:00+00		t	Chicago Bears Game	event	10		SBA traveled to Soldier Field for a tour of the stadium and a chat with Bears employees. The Bears gave us an in depth tour of the stadium, including a look inside the locker rooms, a trip down onto the field and a peek into some of the top notch suites. Our panel discussion included around 11 Bears full time employees across several departments.	\N
9	2017-08-20 01:11:03.083327+00	2017-08-20 01:11:03.083369+00	indiana-pacers	2016-02-13 12:00:00+00		t	Indiana Pacers	\N	13			\N
17	2017-08-20 17:46:25.32111+00	2017-08-20 18:01:55.23328+00	skype-speaker-dave-chase	2017-09-19 18:00:00+00		t	Skype Speaker Dave Chase	event	20			\N
7	2017-08-20 01:06:25.061352+00	2017-08-20 01:06:25.061389+00	chicago-bulls-and-chicago-blackhawks	2016-12-20 12:00:00+00		t	Chicago Bulls and Chicago Blackhawks	event	11		We had the opportunity to visit the United Center and hear from several executives from the Chicago Bulls and Chicago Blackhawks front offices, as well as some of the United Center staff. During lunch, we were able to meet and network with some of the Illinois alumni that work for both of the organizations. We ended the day with a tour of the stadium and an inside look into what goes on behind the scenes on gamedays.\r\n\r\nhttps://www.facebook.com/pg/IllinoisSBA/videos/?ref=page_internal	\N
8	2017-08-20 01:08:36.343578+00	2017-08-20 01:08:36.343614+00	chicago-white-sox	2017-04-25 12:00:00+00		t	Chicago White Sox	event	12			\N
11	2017-08-20 17:36:34.062798+00	2017-08-20 17:36:34.062837+00	fall-2017-info-night	2017-09-05 18:15:00+00		t	Fall 2017 Info Night	meeting	15		Fall info night	\N
12	2017-08-20 17:38:38.693933+00	2017-08-20 17:38:38.694261+00	sapora-symposium-day-one	2017-09-21 12:00:00+00	Sign up for 1 Credit Hour Class	t	Sapora  Symposium Day One	\N	16			\N
13	2017-08-20 17:39:03.85314+00	2017-08-20 17:39:03.853196+00	sapora-symposium-day-two	\N		t	Sapora  Symposium Day Two	event	16			\N
14	2017-08-20 17:40:13.012726+00	2017-08-20 17:40:13.012763+00	dia-day-trip-exploring-illinois-athletic	2017-09-03 09:00:00+00		t	DIA Day Trip - Exploring Illinois Athletics	\N	17			\N
15	2017-08-20 17:41:30.96297+00	2017-08-20 17:41:30.963025+00	indiana-pacers-trip	2017-11-07 13:00:00+00	ISBC and SBA Members learn from Pacers Executives from 1pm-11pm	t	Indiana Pacers Trip	event	13			\N
16	2017-08-20 17:44:07.8758+00	2017-08-20 17:44:07.875838+00	ncaa-headquarters-trip	2017-12-04 08:00:00+00	8:00am-4:00pm	t	NCAA Headquarters Trip	event	18			\N
\.


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_event_id_seq', 19, true);


--
-- Data for Name: events_eventlocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_eventlocation (id, created, modified, address, address2, city, state, zipcode) FROM stdin;
9	2017-08-20 01:02:37.140606+00	2017-08-20 01:02:37.140667+00	Wrigley Field		Chicago	IL	
10	2017-08-20 01:04:14.126838+00	2017-08-20 01:04:14.126893+00	Soldier Field	1410 Museum Campus Dr	Chicago	IL	60605
11	2017-08-20 01:05:55.816079+00	2017-08-20 01:05:55.816138+00	United Center	1901 W Madison St	Chicago	IL	60612
12	2017-08-20 01:08:27.422166+00	2017-08-20 01:08:27.422203+00	Guaranteed  Rate Field	333 W 35th St	Chicago	IL	60616
13	2017-08-20 01:10:46.370009+00	2017-08-20 01:10:46.370044+00	Bankers Life Fieldhouse	125 S Pennsylvania St	Indianapolis	IN	46204
14	2017-08-20 01:13:47.772749+00	2017-08-20 01:13:47.772802+00	SPEAKER_LOCATION		SPEAKER_LOCATION	SL	
15	2017-08-20 17:35:24.882295+00	2017-08-20 17:35:24.882334+00	Huff Hall	Room 2001			
16	2017-08-20 17:38:15.246169+00	2017-08-20 17:38:15.246218+00	Sapora Symposium				
17	2017-08-20 17:40:04.046579+00	2017-08-20 17:40:04.046616+00	State Farm Center				
18	2017-08-20 17:43:58.234698+00	2017-08-20 17:43:58.234752+00	NCAA Headquarters	700 W. Washington Street	Indianapolis	IN	46206
20	2017-08-20 17:45:41.536657+00	2017-08-20 17:48:04.574964+00	Huff Hall Room 2001				
\.


--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_eventlocation_id_seq', 20, true);


--
-- Data for Name: events_speaker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_speaker (id, created, modified, name, image, description, slug, event_id) FROM stdin;
3	2017-08-20 17:50:41.415327+00	2017-08-20 17:50:41.415398+00	Brady Bruhn		Ticket Manager at St. Louis Cardinals	brady-bruhn	19
2	2017-08-20 17:49:57.576889+00	2017-08-20 17:51:05.294308+00	Alex Roux		Social Media Coordinator at Big Ten Network	alex-roux	18
\.


--
-- Name: events_speaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_speaker_id_seq', 3, true);


--
-- Data for Name: events_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_userprofile (id, created, modified, avatar, bio, user_type, user_id, points, year, dues_paid) FROM stdin;
13	2017-08-10 00:08:15.912908+00	2017-08-14 02:59:34.242976+00	core/static/users/1/profile.png	my names alec	user	1	35	FR	f
12	2017-08-09 00:32:06.610683+00	2017-08-14 02:59:40.45079+00			user	13	20	FR	f
11	2017-08-09 00:31:57.000048+00	2017-08-14 02:59:46.760984+00			user	12	63	FR	f
10	2017-08-09 00:31:49.470278+00	2017-08-14 02:59:54.692732+00			user	11	54	FR	f
9	2017-08-09 00:31:39.699392+00	2017-08-14 03:00:01.249431+00			user	10	11	FR	f
8	2017-08-09 00:31:31.798878+00	2017-08-14 03:00:08.769618+00			user	9	75	FR	f
7	2017-08-09 00:31:14.874042+00	2017-08-14 03:00:28.830807+00			user	8	9	FR	f
6	2017-08-09 00:31:07.226238+00	2017-08-14 03:00:35.79394+00			user	7	33	FR	f
5	2017-08-09 00:30:55.92683+00	2017-08-14 03:00:42.16845+00			user	6	25	FR	f
4	2017-08-09 00:30:47.618282+00	2017-08-14 03:00:49.68168+00			user	5	76	FR	f
3	2017-08-09 00:30:37.515115+00	2017-08-14 03:00:55.822476+00			user	4	9	FR	f
2	2017-08-09 00:30:26.154782+00	2017-08-14 03:01:02.22157+00			user	3	54	FR	f
14	2017-08-20 18:09:13.167582+00	2017-08-20 18:09:13.167619+00		\N	user	14	\N	FR	f
15	2017-08-20 18:09:57.578031+00	2017-08-20 18:09:57.578069+00		\N	user	15	\N	FR	f
16	2017-08-20 18:12:26.351803+00	2017-08-20 18:12:26.351898+00		\N	user	16	\N	FR	f
17	2017-08-20 18:13:03.125221+00	2017-08-20 18:13:03.125259+00		\N	user	17	\N	FR	f
\.


--
-- Name: events_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_userprofile_id_seq', 17, true);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_collection_id_seq', 1, true);


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	2
2	1	2	2
3	1	1	3
4	1	2	3
5	1	1	5
6	1	2	5
7	1	1	6
8	1	2	6
\.


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at) FROM stdin;
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N
2	00010001	2	1	Welcome to your new Wagtail site!	home	t	f	/home/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N
3	000100010001	3	1	ISBA Blog	blog	t	f	/home/blog/		f		\N	\N	f	43	1	f	2017-08-20 18:32:19.059213+00	2017-08-20 18:29:25.125389+00	3	2017-08-20 18:32:19.30769+00
4	0001000100010001	4	0	This is an announcement blog	announcement-blog	t	f	/home/blog/announcement-blog/		f		\N	\N	f	42	1	f	2017-08-20 18:30:28.367366+00	2017-08-20 18:30:28.52708+00	2	2017-08-20 18:30:28.52708+00
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 4, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
2	f	2017-08-20 18:30:28.367366+00	{"date": "2017-08-20", "slug": "announcement-blog", "intro": "sidfj", "has_unpublished_changes": false, "path": "0001000100010001", "first_published_at": null, "live_revision": null, "go_live_at": null, "search_description": "", "expire_at": null, "depth": 4, "expired": false, "body": "<p>sdafasdf</p>", "content_type": 42, "show_in_menus": false, "locked": false, "numchild": 0, "last_published_at": null, "url_path": "/home/isba-blog/announcement-blog/", "seo_title": "", "latest_revision_created_at": null, "pk": 4, "owner": 1, "title": "This is an announcement blog", "live": true}	\N	4	1
1	f	2017-08-20 18:29:24.968919+00	{"slug": "isba-blog", "intro": "", "has_unpublished_changes": false, "path": "000100010001", "first_published_at": null, "live_revision": null, "go_live_at": null, "search_description": "", "expire_at": null, "depth": 3, "expired": false, "content_type": 43, "show_in_menus": false, "locked": false, "numchild": 0, "last_published_at": null, "url_path": "/home/isba-blog/", "seo_title": "", "latest_revision_created_at": null, "pk": 3, "owner": 1, "title": "ISBA Blog", "live": true}	\N	3	1
3	f	2017-08-20 18:32:19.059213+00	{"slug": "blog", "intro": "", "has_unpublished_changes": false, "path": "000100010001", "first_published_at": "2017-08-20T18:29:25.125Z", "live_revision": 1, "go_live_at": null, "search_description": "", "expire_at": null, "depth": 3, "expired": false, "content_type": 43, "show_in_menus": false, "locked": false, "numchild": 1, "last_published_at": "2017-08-20T18:29:25.125Z", "url_path": "/home/isba-blog/", "seo_title": "", "latest_revision_created_at": "2017-08-20T18:29:24.968Z", "pk": 3, "owner": 1, "title": "ISBA Blog", "live": true}	\N	3	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 3, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
1	localhost	80	t	2	\N
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 1, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id) FROM stdin;
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 1, false);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, image_id, filter_spec) FROM stdin;
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 1, false);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language) FROM stdin;
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: blog_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: core_alumni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_alumni
    ADD CONSTRAINT core_alumni_pkey PRIMARY KEY (id);


--
-- Name: core_alumni_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_alumni
    ADD CONSTRAINT core_alumni_slug_key UNIQUE (slug);


--
-- Name: core_sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_sponsor
    ADD CONSTRAINT core_sponsor_pkey PRIMARY KEY (id);


--
-- Name: core_sponsor_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_sponsor
    ADD CONSTRAINT core_sponsor_slug_key UNIQUE (slug);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: events_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_announcement
    ADD CONSTRAINT events_announcement_pkey PRIMARY KEY (id);


--
-- Name: events_announcement_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_announcement
    ADD CONSTRAINT events_announcement_slug_key UNIQUE (slug);


--
-- Name: events_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_attendance
    ADD CONSTRAINT events_attendance_pkey PRIMARY KEY (id);


--
-- Name: events_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_pkey PRIMARY KEY (id);


--
-- Name: events_event_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_slug_key UNIQUE (slug);


--
-- Name: events_eventlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_eventlocation
    ADD CONSTRAINT events_eventlocation_pkey PRIMARY KEY (id);


--
-- Name: events_speaker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_speaker
    ADD CONSTRAINT events_speaker_pkey PRIMARY KEY (id);


--
-- Name: events_speaker_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_speaker
    ADD CONSTRAINT events_speaker_slug_key UNIQUE (slug);


--
-- Name: events_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_userprofile
    ADD CONSTRAINT events_userprofile_pkey PRIMARY KEY (id);


--
-- Name: events_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_userprofile
    ADD CONSTRAINT events_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_provider_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken_app_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collecti_collectionviewrestriction_id_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestriction_id_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX account_emailaddress_e8701ad4 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX account_emailconfirmation_6f1edeac ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: core_alumni_slug_44d5872a_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_alumni_slug_44d5872a_like ON core_alumni USING btree (slug varchar_pattern_ops);


--
-- Name: core_sponsor_slug_315c78cf_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_sponsor_slug_315c78cf_like ON core_sponsor USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: events_announcement_slug_57b2bdd5_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_announcement_slug_57b2bdd5_like ON events_announcement USING btree (slug varchar_pattern_ops);


--
-- Name: events_attendance_4437cfac; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_attendance_4437cfac ON events_attendance USING btree (event_id);


--
-- Name: events_attendance_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_attendance_e8701ad4 ON events_attendance USING btree (user_id);


--
-- Name: events_event_e274a5da; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_event_e274a5da ON events_event USING btree (location_id);


--
-- Name: events_event_slug_b44b2c04_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_event_slug_b44b2c04_like ON events_event USING btree (slug varchar_pattern_ops);


--
-- Name: events_speaker_4437cfac; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_speaker_4437cfac ON events_speaker USING btree (event_id);


--
-- Name: events_speaker_slug_d5a352ee_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_speaker_slug_d5a352ee_like ON events_speaker USING btree (slug varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_196cc965_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id_196cc965_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionviewrestriction_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_collectionviewrestriction_0a1a4dd8 ON wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_0e939a4f ON wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_19f356fa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_19f356fa ON wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_groupcollectionpermission_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_0a1a4dd8 ON wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_0e939a4f ON wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_8373b171 ON wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_47e527a3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_47e527a3 ON wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637_uniq ON wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b_uniq ON wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq ON wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_0e939a4f ON wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_9bdbac54; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_9bdbac54 ON wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtaildocs_document_0a1a4dd8 ON wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_0a1a4dd8 ON wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4_uniq ON wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_58c64917; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_58c64917 ON wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: D6153c3498c9836c76562dfe1e22f279; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT "D6153c3498c9836c76562dfe1e22f279" FOREIGN KEY (pageviewrestriction_id) REFERENCES wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_attendance_event_id_7d028551_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_attendance
    ADD CONSTRAINT events_attendance_event_id_7d028551_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_attendance_user_id_fabb08e1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_attendance
    ADD CONSTRAINT events_attendance_user_id_fabb08e1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_location_id_2fb4171f_fk_events_eventlocation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_location_id_2fb4171f_fk_events_eventlocation_id FOREIGN KEY (location_id) REFERENCES events_eventlocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_speaker_event_id_5d094b57_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_speaker
    ADD CONSTRAINT events_speaker_event_id_5d094b57_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_userprofile_user_id_2fd91d02_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_userprofile
    ADD CONSTRAINT events_userprofile_user_id_2fd91d02_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fe4676fd2a60628be3eef16b10c3757b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT fe4676fd2a60628be3eef16b10c3757b FOREIGN KEY (collectionviewrestriction_id) REFERENCES wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtai_live_revision_id_930bd822_fk_wagtailcore_pagerevision_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtai_live_revision_id_930bd822_fk_wagtailcore_pagerevision_id FOREIGN KEY (live_revision_id) REFERENCES wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore__content_type_id_c28424df_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_c28424df_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collection_id_761908ec_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collection_id_761908ec_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewre_group_id_1823f2a3_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewre_group_id_1823f2a3_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestrict_group_id_6460f223_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestrict_group_id_6460f223_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

