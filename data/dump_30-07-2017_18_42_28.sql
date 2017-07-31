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
-- Name: events_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_event (
    id integer NOT NULL,
    date timestamp with time zone,
    description character varying(512),
    is_active boolean NOT NULL,
    name character varying(256),
    points integer NOT NULL,
    eventtype character varying(128) NOT NULL,
    creator_id integer NOT NULL,
    location_id integer NOT NULL
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
-- Name: events_guest; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events_guest (
    id integer NOT NULL,
    rsvp boolean NOT NULL,
    event_id integer NOT NULL,
    member_id integer NOT NULL
);


ALTER TABLE events_guest OWNER TO postgres;

--
-- Name: events_guest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_guest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_guest_id_seq OWNER TO postgres;

--
-- Name: events_guest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_guest_id_seq OWNED BY events_guest.id;


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

ALTER TABLE ONLY events_event ALTER COLUMN id SET DEFAULT nextval('events_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_eventlocation ALTER COLUMN id SET DEFAULT nextval('events_eventlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_guest ALTER COLUMN id SET DEFAULT nextval('events_guest_id_seq'::regclass);


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
26	Can add Tag	11	add_tag
27	Can change Tag	11	change_tag
28	Can delete Tag	11	delete_tag
29	Can add Tagged Item	12	add_taggeditem
30	Can change Tagged Item	12	change_taggeditem
31	Can delete Tagged Item	12	delete_taggeditem
32	Can add log entry	13	add_logentry
33	Can change log entry	13	change_logentry
34	Can delete log entry	13	delete_logentry
35	Can add form submission	14	add_formsubmission
36	Can change form submission	14	change_formsubmission
37	Can delete form submission	14	delete_formsubmission
38	Can add redirect	15	add_redirect
39	Can change redirect	15	change_redirect
40	Can delete redirect	15	delete_redirect
41	Can add embed	16	add_embed
42	Can change embed	16	change_embed
43	Can delete embed	16	delete_embed
44	Can add user profile	17	add_userprofile
45	Can change user profile	17	change_userprofile
46	Can delete user profile	17	delete_userprofile
47	Can add rendition	18	add_rendition
48	Can change rendition	18	change_rendition
49	Can delete rendition	18	delete_rendition
50	Can add query	19	add_query
51	Can change query	19	change_query
52	Can delete query	19	delete_query
53	Can add Query Daily Hits	20	add_querydailyhits
54	Can change Query Daily Hits	20	change_querydailyhits
55	Can delete Query Daily Hits	20	delete_querydailyhits
56	Can add collection	21	add_collection
57	Can change collection	21	change_collection
58	Can delete collection	21	delete_collection
59	Can add group collection permission	22	add_groupcollectionpermission
60	Can change group collection permission	22	change_groupcollectionpermission
61	Can delete group collection permission	22	delete_groupcollectionpermission
62	Can add page view restriction	23	add_pageviewrestriction
63	Can change page view restriction	23	change_pageviewrestriction
64	Can delete page view restriction	23	delete_pageviewrestriction
65	Can add collection view restriction	24	add_collectionviewrestriction
66	Can change collection view restriction	24	change_collectionviewrestriction
67	Can delete collection view restriction	24	delete_collectionviewrestriction
68	Can add page	1	add_page
69	Can change page	1	change_page
70	Can delete page	1	delete_page
71	Can add site	25	add_site
72	Can change site	25	change_site
73	Can delete site	25	delete_site
74	Can add page revision	26	add_pagerevision
75	Can change page revision	26	change_pagerevision
76	Can delete page revision	26	delete_pagerevision
77	Can add group page permission	27	add_grouppagepermission
78	Can change group page permission	27	change_grouppagepermission
79	Can delete group page permission	27	delete_grouppagepermission
80	Can add event location	28	add_eventlocation
81	Can change event location	28	change_eventlocation
82	Can delete event location	28	delete_eventlocation
83	Can add guest	29	add_guest
84	Can change guest	29	change_guest
85	Can delete guest	29	delete_guest
86	Can add event	30	add_event
87	Can change event	30	change_event
88	Can delete event	30	delete_event
89	Can add member	31	add_member
90	Can change member	31	change_member
91	Can delete member	31	delete_member
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 91, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	argon2$argon2i$v=19$m=512,t=2,p=2$S20wWmY3MEFoNzh1$5JAO65UnZ4ppsvmiWc5NcQ	2017-07-30 21:37:16.816288+00	t	alec				t	t	2017-07-30 21:37:11.301272+00
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

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


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
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


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
11	taggit	tag
12	taggit	taggeditem
13	admin	logentry
14	wagtailforms	formsubmission
15	wagtailredirects	redirect
16	wagtailembeds	embed
17	wagtailusers	userprofile
18	wagtailimages	rendition
19	wagtailsearch	query
20	wagtailsearch	querydailyhits
21	wagtailcore	collection
22	wagtailcore	groupcollectionpermission
23	wagtailcore	pageviewrestriction
24	wagtailcore	collectionviewrestriction
25	wagtailcore	site
26	wagtailcore	pagerevision
27	wagtailcore	grouppagepermission
28	events	eventlocation
29	events	guest
30	events	event
31	ispa_app	member
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 31, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-07-30 21:36:14.988806+00
2	auth	0001_initial	2017-07-30 21:36:15.101446+00
3	admin	0001_initial	2017-07-30 21:36:15.14651+00
4	admin	0002_logentry_remove_auto_add	2017-07-30 21:36:15.172769+00
5	contenttypes	0002_remove_content_type_name	2017-07-30 21:36:15.226969+00
6	auth	0002_alter_permission_name_max_length	2017-07-30 21:36:15.251119+00
7	auth	0003_alter_user_email_max_length	2017-07-30 21:36:15.270065+00
8	auth	0004_alter_user_username_opts	2017-07-30 21:36:15.292958+00
9	auth	0005_alter_user_last_login_null	2017-07-30 21:36:15.31053+00
10	auth	0006_require_contenttypes_0002	2017-07-30 21:36:15.313765+00
11	auth	0007_alter_validators_add_error_messages	2017-07-30 21:36:15.328557+00
12	auth	0008_alter_user_username_max_length	2017-07-30 21:36:15.351002+00
13	events	0001_initial	2017-07-30 21:36:15.444698+00
14	sessions	0001_initial	2017-07-30 21:36:15.45865+00
15	sites	0001_initial	2017-07-30 21:36:15.46884+00
16	sites	0002_alter_domain_unique	2017-07-30 21:36:15.481985+00
17	taggit	0001_initial	2017-07-30 21:36:15.522895+00
18	taggit	0002_auto_20150616_2121	2017-07-30 21:36:15.544424+00
19	wagtailcore	0001_initial	2017-07-30 21:36:15.791178+00
20	wagtailcore	0002_initial_data	2017-07-30 21:36:15.793343+00
21	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2017-07-30 21:36:15.795757+00
22	wagtailcore	0004_page_locked	2017-07-30 21:36:15.797912+00
23	wagtailcore	0005_add_page_lock_permission_to_moderators	2017-07-30 21:36:15.800099+00
24	wagtailcore	0006_add_lock_page_permission	2017-07-30 21:36:15.802295+00
25	wagtailcore	0007_page_latest_revision_created_at	2017-07-30 21:36:15.804434+00
26	wagtailcore	0008_populate_latest_revision_created_at	2017-07-30 21:36:15.806573+00
27	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2017-07-30 21:36:15.808761+00
28	wagtailcore	0010_change_page_owner_to_null_on_delete	2017-07-30 21:36:15.810947+00
29	wagtailcore	0011_page_first_published_at	2017-07-30 21:36:15.813475+00
30	wagtailcore	0012_extend_page_slug_field	2017-07-30 21:36:15.815473+00
31	wagtailcore	0013_update_golive_expire_help_text	2017-07-30 21:36:15.817653+00
32	wagtailcore	0014_add_verbose_name	2017-07-30 21:36:15.820122+00
33	wagtailcore	0015_add_more_verbose_names	2017-07-30 21:36:15.822222+00
34	wagtailcore	0016_change_page_url_path_to_text_field	2017-07-30 21:36:15.824395+00
35	wagtailcore	0017_change_edit_page_permission_description	2017-07-30 21:36:15.843908+00
36	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2017-07-30 21:36:15.868017+00
37	wagtailcore	0019_verbose_names_cleanup	2017-07-30 21:36:15.961631+00
38	wagtailcore	0020_add_index_on_page_first_published_at	2017-07-30 21:36:15.987229+00
39	wagtailcore	0021_capitalizeverbose	2017-07-30 21:36:16.683683+00
40	wagtailcore	0022_add_site_name	2017-07-30 21:36:16.714656+00
41	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2017-07-30 21:36:16.762883+00
42	wagtailcore	0024_collection	2017-07-30 21:36:16.788252+00
43	wagtailcore	0025_collection_initial_data	2017-07-30 21:36:16.800789+00
44	wagtailcore	0026_group_collection_permission	2017-07-30 21:36:16.87135+00
45	wagtailadmin	0001_create_admin_access_permissions	2017-07-30 21:36:16.8914+00
46	wagtailcore	0027_fix_collection_path_collation	2017-07-30 21:36:16.913092+00
47	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2017-07-30 21:36:16.962187+00
48	wagtailcore	0028_merge	2017-07-30 21:36:16.966353+00
49	wagtailcore	0029_unicode_slugfield_dj19	2017-07-30 21:36:17.000888+00
50	wagtailcore	0030_index_on_pagerevision_created_at	2017-07-30 21:36:17.033321+00
51	wagtailcore	0031_add_page_view_restriction_types	2017-07-30 21:36:17.1918+00
52	wagtailcore	0032_add_bulk_delete_page_permission	2017-07-30 21:36:17.217928+00
53	wagtailcore	0033_remove_golive_expiry_help_text	2017-07-30 21:36:17.269717+00
54	wagtailcore	0034_page_live_revision	2017-07-30 21:36:17.305535+00
55	wagtailcore	0035_page_last_published_at	2017-07-30 21:36:17.334598+00
56	wagtailcore	0036_populate_page_last_published_at	2017-07-30 21:36:17.343289+00
57	wagtailcore	0037_set_page_owner_editable	2017-07-30 21:36:17.383471+00
58	wagtailcore	0038_make_first_published_at_editable	2017-07-30 21:36:17.413166+00
59	wagtailcore	0039_collectionviewrestriction	2017-07-30 21:36:17.518871+00
60	wagtaildocs	0001_initial	2017-07-30 21:36:17.551539+00
61	wagtaildocs	0002_initial_data	2017-07-30 21:36:17.576324+00
62	wagtaildocs	0003_add_verbose_names	2017-07-30 21:36:17.665581+00
63	wagtaildocs	0004_capitalizeverbose	2017-07-30 21:36:17.814659+00
64	wagtaildocs	0005_document_collection	2017-07-30 21:36:17.856855+00
65	wagtaildocs	0006_copy_document_permissions_to_collections	2017-07-30 21:36:17.873951+00
66	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2017-07-30 21:36:17.91622+00
67	wagtaildocs	0007_merge	2017-07-30 21:36:17.919402+00
68	wagtailembeds	0001_initial	2017-07-30 21:36:17.944348+00
69	wagtailembeds	0002_add_verbose_names	2017-07-30 21:36:17.950901+00
70	wagtailembeds	0003_capitalizeverbose	2017-07-30 21:36:17.95681+00
71	wagtailforms	0001_initial	2017-07-30 21:36:17.997155+00
72	wagtailforms	0002_add_verbose_names	2017-07-30 21:36:18.119934+00
73	wagtailforms	0003_capitalizeverbose	2017-07-30 21:36:18.18492+00
74	wagtailimages	0001_initial	2017-07-30 21:36:18.315218+00
75	wagtailimages	0002_initial_data	2017-07-30 21:36:18.33689+00
76	wagtailimages	0003_fix_focal_point_fields	2017-07-30 21:36:18.47623+00
77	wagtailimages	0004_make_focal_point_key_not_nullable	2017-07-30 21:36:18.514994+00
78	wagtailimages	0005_make_filter_spec_unique	2017-07-30 21:36:18.560195+00
79	wagtailimages	0006_add_verbose_names	2017-07-30 21:36:18.686664+00
80	wagtailimages	0007_image_file_size	2017-07-30 21:36:18.721351+00
81	wagtailimages	0008_image_created_at_index	2017-07-30 21:36:18.762611+00
82	wagtailimages	0009_capitalizeverbose	2017-07-30 21:36:19.055234+00
83	wagtailimages	0010_change_on_delete_behaviour	2017-07-30 21:36:19.109552+00
84	wagtailimages	0011_image_collection	2017-07-30 21:36:19.154439+00
85	wagtailimages	0012_copy_image_permissions_to_collections	2017-07-30 21:36:19.172611+00
86	wagtailimages	0013_make_rendition_upload_callable	2017-07-30 21:36:19.210028+00
87	wagtailimages	0014_add_filter_spec_field	2017-07-30 21:36:19.308178+00
88	wagtailimages	0015_fill_filter_spec_field	2017-07-30 21:36:19.318404+00
89	wagtailimages	0016_deprecate_rendition_filter_relation	2017-07-30 21:36:19.466993+00
90	wagtailimages	0017_reduce_focal_point_key_max_length	2017-07-30 21:36:19.510822+00
91	wagtailimages	0018_remove_rendition_filter	2017-07-30 21:36:19.5605+00
92	wagtailimages	0019_delete_filter	2017-07-30 21:36:19.57195+00
93	wagtailredirects	0001_initial	2017-07-30 21:36:19.622572+00
94	wagtailredirects	0002_add_verbose_names	2017-07-30 21:36:19.710398+00
95	wagtailredirects	0003_make_site_field_editable	2017-07-30 21:36:19.753552+00
96	wagtailredirects	0004_set_unique_on_path_and_site	2017-07-30 21:36:19.827421+00
97	wagtailredirects	0005_capitalizeverbose	2017-07-30 21:36:20.108389+00
98	wagtailsearch	0001_initial	2017-07-30 21:36:20.220922+00
99	wagtailsearch	0002_add_verbose_names	2017-07-30 21:36:20.352726+00
100	wagtailsearch	0003_remove_editors_pick	2017-07-30 21:36:20.397116+00
101	wagtailusers	0001_initial	2017-07-30 21:36:20.439971+00
102	wagtailusers	0002_add_verbose_name_on_userprofile	2017-07-30 21:36:20.534124+00
103	wagtailusers	0003_add_verbose_names	2017-07-30 21:36:20.574917+00
104	wagtailusers	0004_capitalizeverbose	2017-07-30 21:36:20.768417+00
105	wagtailusers	0005_make_related_name_wagtail_specific	2017-07-30 21:36:20.820946+00
106	wagtailusers	0006_userprofile_prefered_language	2017-07-30 21:36:20.868685+00
107	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2017-07-30 21:36:20.877895+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 107, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
lly1rn0ol6zibk1ngcltadt9p2ucx0nd	ODIyZjU4ZTdlYzQzOTdkODFiM2Q0Mzc3ZDFkN2U3ZGZkMDlmNTJiZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNGI0NTEzZGRiZGNjMWI2OTUzZGQ1MTIxMDdlYTIzNGMzZDJkZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-13 21:37:16.832251+00
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
-- Data for Name: events_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_event (id, date, description, is_active, name, points, eventtype, creator_id, location_id) FROM stdin;
\.


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_event_id_seq', 1, false);


--
-- Data for Name: events_eventlocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_eventlocation (id, address, address2, city, state, zipcode) FROM stdin;
\.


--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_eventlocation_id_seq', 1, false);


--
-- Data for Name: events_guest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events_guest (id, rsvp, event_id, member_id) FROM stdin;
\.


--
-- Name: events_guest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_guest_id_seq', 1, false);


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
2	00010001	2	0	Welcome to your new Wagtail site!	home	t	f	/home/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 2, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 1, false);


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
-- Name: events_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_pkey PRIMARY KEY (id);


--
-- Name: events_eventlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_eventlocation
    ADD CONSTRAINT events_eventlocation_pkey PRIMARY KEY (id);


--
-- Name: events_guest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events_guest
    ADD CONSTRAINT events_guest_pkey PRIMARY KEY (id);


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
-- Name: events_event_3700153c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_event_3700153c ON events_event USING btree (creator_id);


--
-- Name: events_event_e274a5da; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_event_e274a5da ON events_event USING btree (location_id);


--
-- Name: events_guest_4437cfac; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_guest_4437cfac ON events_guest USING btree (event_id);


--
-- Name: events_guest_b5c3e75b; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_guest_b5c3e75b ON events_guest USING btree (member_id);


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
-- Name: events_event_creator_id_13bb3d46_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_creator_id_13bb3d46_fk_auth_user_id FOREIGN KEY (creator_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_location_id_2fb4171f_fk_events_eventlocation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_location_id_2fb4171f_fk_events_eventlocation_id FOREIGN KEY (location_id) REFERENCES events_eventlocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_guest_event_id_d207f765_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_guest
    ADD CONSTRAINT events_guest_event_id_d207f765_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_guest_member_id_9dfbcbd4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events_guest
    ADD CONSTRAINT events_guest_member_id_9dfbcbd4_fk_auth_user_id FOREIGN KEY (member_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fe4676fd2a60628be3eef16b10c3757b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT fe4676fd2a60628be3eef16b10c3757b FOREIGN KEY (collectionviewrestriction_id) REFERENCES wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


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

