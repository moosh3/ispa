--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


--
-- Name: blog_blogpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogpage (
    page_ptr_id integer NOT NULL,
    date date NOT NULL,
    intro character varying(250) NOT NULL,
    body text NOT NULL
);


--
-- Name: core_alumni; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: core_alumni_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_alumni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: core_alumni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_alumni_id_seq OWNED BY core_alumni.id;


--
-- Name: core_sponsor; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: core_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE core_sponsor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: core_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE core_sponsor_id_seq OWNED BY core_sponsor.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: events_announcement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_announcement (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(128),
    text text,
    slug character varying(40)
);


--
-- Name: events_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_announcement_id_seq OWNED BY events_announcement.id;


--
-- Name: events_attendance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_attendance (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL,
    is_owner boolean NOT NULL,
    attending boolean NOT NULL
);


--
-- Name: events_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_attendance_id_seq OWNED BY events_attendance.id;


--
-- Name: events_event; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_event_id_seq OWNED BY events_event.id;


--
-- Name: events_event_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_event_messages (
    id integer NOT NULL,
    event_id integer NOT NULL,
    message_id integer NOT NULL
);


--
-- Name: events_event_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_event_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_event_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_event_messages_id_seq OWNED BY events_event_messages.id;


--
-- Name: events_eventlocation; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_eventlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_eventlocation_id_seq OWNED BY events_eventlocation.id;


--
-- Name: events_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_message (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    text character varying(1028),
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: events_message_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_message_id_seq OWNED BY events_message.id;


--
-- Name: events_speaker; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: events_speaker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_speaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_speaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_speaker_id_seq OWNED BY events_speaker.id;


--
-- Name: events_userprofile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_userprofile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    avatar character varying(100),
    bio text,
    user_id integer NOT NULL,
    points integer,
    year character varying(56) NOT NULL,
    dues_paid boolean NOT NULL,
    phone_number character varying(12),
    tshirt character varying(56) NOT NULL,
    first_name character varying(128),
    last_name character varying(128),
    CONSTRAINT events_userprofile_points_check CHECK ((points >= 0))
);


--
-- Name: events_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_userprofile_id_seq OWNED BY events_userprofile.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_collection_id_seq OWNED BY wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_collectionviewrestriction_id_seq OWNED BY wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_groupcollectionpermission_id_seq OWNED BY wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq OWNED BY wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL
);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL
);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_alumni id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_alumni ALTER COLUMN id SET DEFAULT nextval('core_alumni_id_seq'::regclass);


--
-- Name: core_sponsor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_sponsor ALTER COLUMN id SET DEFAULT nextval('core_sponsor_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: events_announcement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_announcement ALTER COLUMN id SET DEFAULT nextval('events_announcement_id_seq'::regclass);


--
-- Name: events_attendance id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_attendance ALTER COLUMN id SET DEFAULT nextval('events_attendance_id_seq'::regclass);


--
-- Name: events_event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event ALTER COLUMN id SET DEFAULT nextval('events_event_id_seq'::regclass);


--
-- Name: events_event_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event_messages ALTER COLUMN id SET DEFAULT nextval('events_event_messages_id_seq'::regclass);


--
-- Name: events_eventlocation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventlocation ALTER COLUMN id SET DEFAULT nextval('events_eventlocation_id_seq'::regclass);


--
-- Name: events_message id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_message ALTER COLUMN id SET DEFAULT nextval('events_message_id_seq'::regclass);


--
-- Name: events_speaker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_speaker ALTER COLUMN id SET DEFAULT nextval('events_speaker_id_seq'::regclass);


--
-- Name: events_userprofile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_userprofile ALTER COLUMN id SET DEFAULT nextval('events_userprofile_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagerevision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_editorspick id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: wagtailsearch_query id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: wagtailsearch_querydailyhits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
2	aleccunningham96@gmail.com	f	t	7
6	cualopi2@illinois.edu	f	t	14
8	ajb4@illinois.edu	f	t	16
11	asbach.joey@gmail.com	f	t	19
12	Kriw@gmIL.XPOM	f	t	20
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 12, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	61
2	1	62
3	1	63
4	2	61
5	2	62
6	2	63
7	1	64
8	2	64
9	1	65
10	1	66
11	1	67
12	2	65
13	2	66
14	2	67
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add email confirmation	7	add_emailconfirmation
20	Can change email confirmation	7	change_emailconfirmation
21	Can delete email confirmation	7	delete_emailconfirmation
22	Can add email address	8	add_emailaddress
23	Can change email address	8	change_emailaddress
24	Can delete email address	8	delete_emailaddress
25	Can add social application token	9	add_socialtoken
26	Can change social application token	9	change_socialtoken
27	Can delete social application token	9	delete_socialtoken
28	Can add social application	10	add_socialapp
29	Can change social application	10	change_socialapp
30	Can delete social application	10	delete_socialapp
31	Can add social account	11	add_socialaccount
32	Can change social account	11	change_socialaccount
33	Can delete social account	11	delete_socialaccount
34	Can add log entry	12	add_logentry
35	Can change log entry	12	change_logentry
36	Can delete log entry	12	delete_logentry
37	Can add announcement	13	add_announcement
38	Can change announcement	13	change_announcement
39	Can delete announcement	13	delete_announcement
40	Can add event location	14	add_eventlocation
41	Can change event location	14	change_eventlocation
42	Can delete event location	14	delete_eventlocation
43	Can add attendance	15	add_attendance
44	Can change attendance	15	change_attendance
45	Can delete attendance	15	delete_attendance
46	Can add speaker	16	add_speaker
47	Can change speaker	16	change_speaker
48	Can delete speaker	16	delete_speaker
49	Can add user profile	17	add_userprofile
50	Can change user profile	17	change_userprofile
51	Can delete user profile	17	delete_userprofile
52	Can add event	18	add_event
53	Can change event	18	change_event
54	Can delete event	18	delete_event
55	Can add alumni	19	add_alumni
56	Can change alumni	19	change_alumni
57	Can delete alumni	19	delete_alumni
58	Can add sponsor	20	add_sponsor
59	Can change sponsor	20	change_sponsor
60	Can delete sponsor	20	delete_sponsor
61	Can add image	22	add_image
62	Can change image	22	change_image
63	Can delete image	22	delete_image
64	Can access Wagtail admin	23	access_admin
65	Can add document	24	add_document
66	Can change document	24	change_document
67	Can delete document	24	delete_document
68	Can add Tagged Item	25	add_taggeditem
69	Can change Tagged Item	25	change_taggeditem
70	Can delete Tagged Item	25	delete_taggeditem
71	Can add Tag	26	add_tag
72	Can change Tag	26	change_tag
73	Can delete Tag	26	delete_tag
74	Can add form submission	27	add_formsubmission
75	Can change form submission	27	change_formsubmission
76	Can delete form submission	27	delete_formsubmission
77	Can add redirect	28	add_redirect
78	Can change redirect	28	change_redirect
79	Can delete redirect	28	delete_redirect
80	Can add embed	29	add_embed
81	Can change embed	29	change_embed
82	Can delete embed	29	delete_embed
83	Can add user profile	30	add_userprofile
84	Can change user profile	30	change_userprofile
85	Can delete user profile	30	delete_userprofile
86	Can add rendition	31	add_rendition
87	Can change rendition	31	change_rendition
88	Can delete rendition	31	delete_rendition
89	Can add query	32	add_query
90	Can change query	32	change_query
91	Can delete query	32	delete_query
92	Can add Query Daily Hits	33	add_querydailyhits
93	Can change Query Daily Hits	33	change_querydailyhits
94	Can delete Query Daily Hits	33	delete_querydailyhits
95	Can add page view restriction	34	add_pageviewrestriction
96	Can change page view restriction	34	change_pageviewrestriction
97	Can delete page view restriction	34	delete_pageviewrestriction
98	Can add group page permission	35	add_grouppagepermission
99	Can change group page permission	35	change_grouppagepermission
100	Can delete group page permission	35	delete_grouppagepermission
101	Can add collection view restriction	36	add_collectionviewrestriction
102	Can change collection view restriction	36	change_collectionviewrestriction
103	Can delete collection view restriction	36	delete_collectionviewrestriction
104	Can add site	37	add_site
105	Can change site	37	change_site
106	Can delete site	37	delete_site
107	Can add collection	38	add_collection
108	Can change collection	38	change_collection
109	Can delete collection	38	delete_collection
110	Can add group collection permission	39	add_groupcollectionpermission
111	Can change group collection permission	39	change_groupcollectionpermission
112	Can delete group collection permission	39	delete_groupcollectionpermission
113	Can add page	21	add_page
114	Can change page	21	change_page
115	Can delete page	21	delete_page
116	Can add page revision	40	add_pagerevision
117	Can change page revision	40	change_pagerevision
118	Can delete page revision	40	delete_pagerevision
119	Can add blog index page	41	add_blogindexpage
120	Can change blog index page	41	change_blogindexpage
121	Can delete blog index page	41	delete_blogindexpage
122	Can add blog page	42	add_blogpage
123	Can change blog page	42	change_blogpage
124	Can delete blog page	42	delete_blogpage
125	Can add message	43	add_message
126	Can change message	43	change_message
127	Can delete message	43	delete_message
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 127, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	argon2$argon2i$v=19$m=512,t=2,p=2$a3Q3UXY3RnlRdXZt$39i/lTk6c6pNcv4/Tq2jUg	2017-08-27 05:41:21.514154+00	t	root				t	t	2017-08-24 21:51:38.952439+00
20	argon2$argon2i$v=19$m=512,t=2,p=2$cWszWUVkeDZyUXZU$+spAPahoRzWRR8R/ve+OFw	2017-08-27 05:45:25.148456+00	f	KARIE			Kriw@gmIL.XPOM	f	t	2017-08-27 05:45:25.121286+00
3	argon2$argon2i$v=19$m=512,t=2,p=2$eElBem1scUdNc29V$vBS4kxfb5rL3TjrjHTmhlw	2017-08-24 22:08:37+00	f	abby.kalsto	Abby Kalsto			t	t	2017-08-24 22:08:37+00
16	argon2$argon2i$v=19$m=512,t=2,p=2$eUs1ZGNoVVZySGs4$36HC/zWs24THjo32r3IVDg	2017-08-25 18:24:24+00	f	anthony.bellanca	Anthony	Bellanac	ajb4@illinois.edu	f	t	2017-08-25 18:24:24+00
5	argon2$argon2i$v=19$m=512,t=2,p=2$d1h0d1lMelhTUTNN$iq3wTVEszosr5JXeZ/CyFA	2017-08-24 22:09:31+00	f	austin.montbriand	Austin	Montbriand		t	t	2017-08-24 22:09:31+00
19	argon2$argon2i$v=19$m=512,t=2,p=2$WlJKU05qdGNVb0JH$GJByLWYwAyx3kpZO/IqCjQ	2017-08-25 20:07:26+00	f	joey.asbach	Joey	Asbach	asbach.joey@gmail.com	f	t	2017-08-25 20:07:26+00
4	argon2$argon2i$v=19$m=512,t=2,p=2$bjh3RWJObW03Z2s1$3gUmfI0vfJymgrMXhjXjTQ	2017-08-24 22:09:00+00	t	teagan.vogel	Teagan	Vogel		t	t	2017-08-24 22:09:00+00
2	argon2$argon2i$v=19$m=512,t=2,p=2$SEJhVDg2SXZKWDBS$b9OdsOUdFt4PNF55pZoKAw	2017-08-24 23:19:50+00	t	tristan.nelson	Tristan	Nelson		t	t	2017-08-24 22:07:36+00
14	argon2$argon2i$v=19$m=512,t=2,p=2$UWNaaEhOV0tGYmIz$uH+NCvLSsrBLVTSeOcbXYg	2017-08-25 17:46:36.591771+00	f	ncualoping			cualopi2@illinois.edu	f	t	2017-08-25 17:46:36.564244+00
7	argon2$argon2i$v=19$m=512,t=2,p=2$Vk0zSzVmT2djV3lj$Z78/zGUmb/iHLIdMa7QIKA	2017-08-28 00:47:55.082275+00	t	alec.cunningham	Alec	Cunningham	aleccunningham96@gmail.com	t	t	2017-08-25 15:33:54+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	4	1
2	4	2
3	2	1
4	2	2
5	5	1
6	5	2
7	3	1
8	3	2
9	7	1
10	7	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 10, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 20, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	1
2	2	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
21	2	21
22	2	22
23	2	23
24	2	24
25	2	25
26	2	26
27	2	27
28	2	28
29	2	29
30	2	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	2	38
39	2	39
40	2	40
41	2	41
42	2	42
43	2	43
44	2	44
45	2	45
46	2	46
47	2	47
48	2	48
49	2	49
50	2	50
51	2	51
52	2	52
53	2	53
54	2	54
55	2	55
56	2	56
57	2	57
58	2	58
59	2	59
60	2	60
61	2	61
62	2	62
63	2	63
64	2	64
65	2	65
66	2	66
67	2	67
68	2	68
69	2	69
70	2	70
71	2	71
72	2	72
73	2	73
74	2	74
75	2	75
76	2	76
77	2	77
78	2	78
79	2	79
80	2	80
81	2	81
82	2	82
83	2	83
84	2	84
85	2	85
86	2	86
87	2	87
88	2	88
89	2	89
90	2	90
91	2	91
92	2	92
93	2	93
94	2	94
95	2	95
96	2	96
97	2	97
98	2	98
99	2	99
100	2	100
101	2	101
102	2	102
103	2	103
104	2	104
105	2	105
106	2	106
107	2	107
108	2	108
109	2	109
110	2	110
111	2	111
112	2	112
113	2	113
114	2	114
115	2	115
116	2	116
117	2	117
118	2	118
119	2	119
120	2	120
121	2	121
122	2	122
123	2	123
124	2	124
125	4	1
126	4	2
127	4	3
128	4	4
129	4	5
130	4	6
131	4	7
132	4	8
133	4	9
134	4	10
135	4	11
136	4	12
137	4	13
138	4	14
139	4	15
140	4	16
141	4	17
142	4	18
143	4	19
144	4	20
145	4	21
146	4	22
147	4	23
148	4	24
149	4	25
150	4	26
151	4	27
152	4	28
153	4	29
154	4	30
155	4	31
156	4	32
157	4	33
158	4	34
159	4	35
160	4	36
161	4	37
162	4	38
163	4	39
164	4	40
165	4	41
166	4	42
167	4	43
168	4	44
169	4	45
170	4	46
171	4	47
172	4	48
173	4	49
174	4	50
175	4	51
176	4	52
177	4	53
178	4	54
179	4	55
180	4	56
181	4	57
182	4	58
183	4	59
184	4	60
185	4	61
186	4	62
187	4	63
188	4	64
189	4	65
190	4	66
191	4	67
192	4	68
193	4	69
194	4	70
195	4	71
196	4	72
197	4	73
198	4	74
199	4	75
200	4	76
201	4	77
202	4	78
203	4	79
204	4	80
205	4	81
206	4	82
207	4	83
208	4	84
209	4	85
210	4	86
211	4	87
212	4	88
213	4	89
214	4	90
215	4	91
216	4	92
217	4	93
218	4	94
219	4	95
220	4	96
221	4	97
222	4	98
223	4	99
224	4	100
225	4	101
226	4	102
227	4	103
228	4	104
229	4	105
230	4	106
231	4	107
232	4	108
233	4	109
234	4	110
235	4	111
236	4	112
237	4	113
238	4	114
239	4	115
240	4	116
241	4	117
242	4	118
243	4	119
244	4	120
245	4	121
246	4	122
247	4	123
248	4	124
249	5	1
250	5	2
251	5	3
252	5	4
253	5	5
254	5	6
255	5	7
256	5	8
257	5	9
258	5	10
259	5	11
260	5	12
261	5	13
262	5	14
263	5	15
264	5	16
265	5	17
266	5	18
267	5	19
268	5	20
269	5	21
270	5	22
271	5	23
272	5	24
273	5	25
274	5	26
275	5	27
276	5	28
277	5	29
278	5	30
279	5	31
280	5	32
281	5	33
282	5	34
283	5	35
284	5	36
285	5	37
286	5	38
287	5	39
288	5	40
289	5	41
290	5	42
291	5	43
292	5	44
293	5	45
294	5	46
295	5	47
296	5	48
297	5	49
298	5	50
299	5	51
300	5	52
301	5	53
302	5	54
303	5	55
304	5	56
305	5	57
306	5	58
307	5	59
308	5	60
309	5	61
310	5	62
311	5	63
312	5	64
313	5	65
314	5	66
315	5	67
316	5	68
317	5	69
318	5	70
319	5	71
320	5	72
321	5	73
322	5	74
323	5	75
324	5	76
325	5	77
326	5	78
327	5	79
328	5	80
329	5	81
330	5	82
331	5	83
332	5	84
333	5	85
334	5	86
335	5	87
336	5	88
337	5	89
338	5	90
339	5	91
340	5	92
341	5	93
342	5	94
343	5	95
344	5	96
345	5	97
346	5	98
347	5	99
348	5	100
349	5	101
350	5	102
351	5	103
352	5	104
353	5	105
354	5	106
355	5	107
356	5	108
357	5	109
358	5	110
359	5	111
360	5	112
361	5	113
362	5	114
363	5	115
364	5	116
365	5	117
366	5	118
367	5	119
368	5	120
369	5	121
370	5	122
371	5	123
372	5	124
373	3	1
374	3	2
375	3	3
376	3	4
377	3	5
378	3	6
379	3	7
380	3	8
381	3	9
382	3	10
383	3	11
384	3	12
385	3	13
386	3	14
387	3	15
388	3	16
389	3	17
390	3	18
391	3	19
392	3	20
393	3	21
394	3	22
395	3	23
396	3	24
397	3	25
398	3	26
399	3	27
400	3	28
401	3	29
402	3	30
403	3	31
404	3	32
405	3	33
406	3	34
407	3	35
408	3	36
409	3	37
410	3	38
411	3	39
412	3	40
413	3	41
414	3	42
415	3	43
416	3	44
417	3	45
418	3	46
419	3	47
420	3	48
421	3	49
422	3	50
423	3	51
424	3	52
425	3	53
426	3	54
427	3	55
428	3	56
429	3	57
430	3	58
431	3	59
432	3	60
433	3	61
434	3	62
435	3	63
436	3	64
437	3	65
438	3	66
439	3	67
440	3	68
441	3	69
442	3	70
443	3	71
444	3	72
445	3	73
446	3	74
447	3	75
448	3	76
449	3	77
450	3	78
451	3	79
452	3	80
453	3	81
454	3	82
455	3	83
456	3	84
457	3	85
458	3	86
459	3	87
460	3	88
461	3	89
462	3	90
463	3	91
464	3	92
465	3	93
466	3	94
467	3	95
468	3	96
469	3	97
470	3	98
471	3	99
472	3	100
473	3	101
474	3	102
475	3	103
476	3	104
477	3	105
478	3	106
479	3	107
480	3	108
481	3	109
482	3	110
483	3	111
484	3	112
485	3	113
486	3	114
487	3	115
488	3	116
489	3	117
490	3	118
491	3	119
492	3	120
493	3	121
494	3	122
495	3	123
496	3	124
497	7	1
498	7	2
499	7	3
500	7	4
501	7	5
502	7	6
503	7	7
504	7	8
505	7	9
506	7	10
507	7	11
508	7	12
509	7	13
510	7	14
511	7	15
512	7	16
513	7	17
514	7	18
515	7	19
516	7	20
517	7	21
518	7	22
519	7	23
520	7	24
521	7	25
522	7	26
523	7	27
524	7	28
525	7	29
526	7	30
527	7	31
528	7	32
529	7	33
530	7	34
531	7	35
532	7	36
533	7	37
534	7	38
535	7	39
536	7	40
537	7	41
538	7	42
539	7	43
540	7	44
541	7	45
542	7	46
543	7	47
544	7	48
545	7	49
546	7	50
547	7	51
548	7	52
549	7	53
550	7	54
551	7	55
552	7	56
553	7	57
554	7	58
555	7	59
556	7	60
557	7	61
558	7	62
559	7	63
560	7	64
561	7	65
562	7	66
563	7	67
564	7	68
565	7	69
566	7	70
567	7	71
568	7	72
569	7	73
570	7	74
571	7	75
572	7	76
573	7	77
574	7	78
575	7	79
576	7	80
577	7	81
578	7	82
579	7	83
580	7	84
581	7	85
582	7	86
583	7	87
584	7	88
585	7	89
586	7	90
587	7	91
588	7	92
589	7	93
590	7	94
591	7	95
592	7	96
593	7	97
594	7	98
595	7	99
596	7	100
597	7	101
598	7	102
599	7	103
600	7	104
601	7	105
602	7	106
603	7	107
604	7	108
605	7	109
606	7	110
607	7	111
608	7	112
609	7	113
610	7	114
611	7	115
612	7	116
613	7	117
614	7	118
615	7	119
616	7	120
617	7	121
618	7	122
619	7	123
620	7	124
621	7	125
622	7	126
623	7	127
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 623, true);


--
-- Data for Name: blog_blogindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogindexpage (page_ptr_id, intro) FROM stdin;
5	<p>News, updates, and special announcements are posted here</p>
\.


--
-- Data for Name: blog_blogpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogpage (page_ptr_id, date, intro, body) FROM stdin;
6	2017-08-26	Welcome to ISBA's official website!	<p>Starting with the new school year, ISBA has relaunched their website in order to share information past and present, communicate with its members, track attendance, and easily pay your dues.</p><p>Get ready for the upcoming events for the new school year!</p>
\.


--
-- Data for Name: core_alumni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_alumni (id, created, modified, name, image, description, slug, extended_description) FROM stdin;
1	2017-08-24 23:06:53.203227+00	2017-08-24 23:06:53.203272+00	German  Montero		Manager, New Buisness	german-montero	Teams at The Madison Square Garden Company
2	2017-08-24 23:07:22.383842+00	2017-08-24 23:07:22.383892+00	Justin Acton		Assistant Ticket Manager		At the DIA Ticket Office
3	2017-08-24 23:08:27.864337+00	2017-08-24 23:08:27.864388+00	Julie Krueger		Coach Supports Specialist	julie-kruger	At Hudl
\.


--
-- Name: core_alumni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_alumni_id_seq', 3, true);


--
-- Data for Name: core_sponsor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY core_sponsor (id, created, modified, name, image, description, slug, extended_description) FROM stdin;
\.


--
-- Name: core_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('core_sponsor_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-08-24 21:53:40.202928+00	1	Huff Hall Room 2001	1	[{"added": {}}]	14	1
2	2017-08-24 21:53:52.256867+00	1	Fall 2017 Info Night	1	[{"added": {}}]	18	1
3	2017-08-24 21:55:44.691093+00	2	Skype Speaker Dave Chase	1	[{"added": {}}]	18	1
4	2017-08-24 21:56:31.109889+00	2	Sapora Symposium	1	[{"added": {}}]	14	1
5	2017-08-24 21:57:27.760181+00	3	Sapora Symposium Day 1	1	[{"added": {}}]	18	1
6	2017-08-24 21:58:11.005433+00	4	Sapora Symposium Day 2	1	[{"added": {}}]	18	1
7	2017-08-24 21:59:01.918616+00	3	N/A	1	[{"added": {}}]	14	1
8	2017-08-24 21:59:05.959309+00	5	Speaker Alex Roux	1	[{"added": {}}]	18	1
9	2017-08-24 22:00:38.506895+00	6	DIA Day Trip - Exploring Illinois Athletics	1	[{"added": {}}]	18	1
10	2017-08-24 22:02:36.477908+00	4	125 S Pennsylvania St	1	[{"added": {}}]	14	1
11	2017-08-24 22:02:43.505325+00	7	Indiana Pacers Trip	1	[{"added": {}}]	18	1
12	2017-08-24 22:03:35.685145+00	8	Speaker Brady Bruhn	1	[{"added": {}}]	18	1
13	2017-08-24 22:05:20.714634+00	5	NCAA Headquarters	1	[{"added": {}}]	14	1
14	2017-08-24 22:05:26.060043+00	9	NCAA Headquarters Trip	1	[{"added": {}}]	18	1
15	2017-08-24 22:55:55.976147+00	6	Wrigley Field	1	[{"added": {}}]	14	1
16	2017-08-24 22:56:50.466677+00	10	Chicago Cubs Game	1	[{"added": {}}]	18	1
17	2017-08-24 22:57:47.363824+00	7	Solder Field	1	[{"added": {}}]	14	1
18	2017-08-24 22:57:58.612589+00	11	Chicago Bears Game	1	[{"added": {}}]	18	1
19	2017-08-24 22:59:02.251475+00	8	United Center	1	[{"added": {}}]	14	1
20	2017-08-24 23:00:40.798523+00	12	Chicago Bulls and Blackhawks	1	[{"added": {}}]	18	1
21	2017-08-24 23:00:52.858426+00	11	Chicago Bears Game	2	[{"changed": {"fields": ["is_active"]}}]	18	1
22	2017-08-24 23:01:05.363941+00	10	Chicago Cubs Game	2	[{"changed": {"fields": ["is_active"]}}]	18	1
23	2017-08-24 23:02:13.519922+00	9	Guaranteed Rate Field	1	[{"added": {}}]	14	1
24	2017-08-24 23:02:43.914896+00	13	Chicago White Sox	1	[{"added": {}}]	18	1
25	2017-08-24 23:04:55.272609+00	14	N/A	1	[{"added": {}}]	18	1
26	2017-08-24 23:05:00.101715+00	1	Dino  Pollock	1	[{"added": {}}]	16	1
27	2017-08-24 23:05:34.329132+00	2	Ed Sherman	1	[{"added": {}}]	16	1
28	2017-08-24 23:06:53.205198+00	1	German  Montero	1	[{"added": {}}]	19	1
29	2017-08-24 23:07:22.385598+00	2	Justin Acton	1	[{"added": {}}]	19	1
30	2017-08-24 23:08:27.866366+00	3	Julie Krueger	1	[{"added": {}}]	19	1
31	2017-08-24 23:12:30.753934+00	10	Chicago Cubs Game	2	[{"changed": {"fields": ["extended_description"]}}]	18	1
32	2017-08-24 23:16:30.635245+00	2	tristan.nelson	2	[{"changed": {"fields": ["password"]}}]	1	1
33	2017-08-24 23:16:40.331989+00	2	tristan.nelson	2	[{"changed": {"fields": ["is_staff"]}}]	1	1
34	2017-08-24 23:16:50.8559+00	4	teagan.vogel	2	[{"changed": {"fields": ["is_staff"]}}]	1	1
35	2017-08-24 23:16:58.811128+00	5	austin.montbriand	2	[{"changed": {"fields": ["is_staff"]}}]	1	1
36	2017-08-24 23:17:05.576025+00	3	abby.kalsto	2	[{"changed": {"fields": ["is_staff"]}}]	1	1
37	2017-08-24 23:24:44.742726+00	2	tristan.nelson	2	[{"changed": {"fields": ["is_superuser"]}}]	1	1
38	2017-08-24 23:24:59.392332+00	4	teagan.vogel	2	[{"changed": {"fields": ["is_superuser"]}}]	1	1
39	2017-08-24 23:25:09.587452+00	2	tristan.nelson	2	[]	1	1
40	2017-08-24 23:26:03.98876+00	5	austin.montbriand	2	[]	1	1
41	2017-08-24 23:26:14.435893+00	3	abby.kalsto	2	[]	1	1
42	2017-08-25 15:49:16.91861+00	14	N/A	2	[{"changed": {"fields": ["slug"]}}]	18	1
43	2017-08-25 17:21:39.701405+00	7	alec.cunningham	2	[{"changed": {"fields": ["email"]}}]	1	1
44	2017-08-25 20:58:44.167742+00	8	alec.noemail	3		1	1
45	2017-08-25 20:58:44.173361+00	9	alec.withemail	3		1	1
46	2017-08-25 20:58:44.178231+00	18	alsfdj	3		1	1
47	2017-08-25 20:58:44.182718+00	17	laskdjf	3		1	1
48	2017-08-25 20:58:44.186644+00	6	Test.Test1	3		1	1
49	2017-08-25 20:58:44.190697+00	10	Test.Test2	3		1	1
50	2017-08-25 20:58:44.195079+00	11	test.user	3		1	1
51	2017-08-25 20:58:44.199071+00	12	tset.email	3		1	1
52	2017-08-26 22:47:37.877281+00	14	N/A	2	[{"changed": {"fields": ["date"]}}]	18	1
53	2017-08-26 22:55:13.983269+00	15	pay.dues	3		1	1
54	2017-08-26 22:55:13.98761+00	13	test.email	3		1	1
55	2017-08-27 02:15:40.662618+00	2	tristan.nelson	2	[{"changed": {"fields": ["avatar"]}}]	17	1
56	2017-08-27 02:15:49.658158+00	3	abby.kalsto	2	[{"changed": {"fields": ["avatar"]}}]	17	1
57	2017-08-27 02:16:01.483082+00	4	teagan.vogel	2	[{"changed": {"fields": ["avatar"]}}]	17	1
58	2017-08-27 02:16:09.777672+00	5	austin.montbriand	2	[{"changed": {"fields": ["avatar"]}}]	17	1
59	2017-08-27 20:43:35.471064+00	3	abby.kalsto	2	[{"changed": {"fields": ["first_name"]}}]	1	1
60	2017-08-27 20:44:17.382245+00	7	alec.cunningham	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "is_superuser", "last_login"]}}]	1	1
61	2017-08-27 20:44:37.100939+00	16	anthony.bellanca	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	1	1
62	2017-08-27 20:44:49.251823+00	5	austin.montbriand	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	1	1
63	2017-08-27 20:45:11.160482+00	19	joey.asbach	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	1	1
64	2017-08-27 20:45:26.204152+00	4	teagan.vogel	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	1	1
65	2017-08-27 20:45:38.013043+00	2	tristan.nelson	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	1	1
66	2017-08-27 23:36:34.089116+00	1	example text	1	[{"added": {}}]	43	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 66, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	user
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailconfirmation
8	account	emailaddress
9	socialaccount	socialtoken
10	socialaccount	socialapp
11	socialaccount	socialaccount
12	admin	logentry
13	events	announcement
14	events	eventlocation
15	events	attendance
16	events	speaker
17	events	userprofile
18	events	event
19	core	alumni
20	core	sponsor
21	wagtailcore	page
22	wagtailimages	image
23	wagtailadmin	admin
24	wagtaildocs	document
25	taggit	taggeditem
26	taggit	tag
27	wagtailforms	formsubmission
28	wagtailredirects	redirect
29	wagtailembeds	embed
30	wagtailusers	userprofile
31	wagtailimages	rendition
32	wagtailsearch	query
33	wagtailsearch	querydailyhits
34	wagtailcore	pageviewrestriction
35	wagtailcore	grouppagepermission
36	wagtailcore	collectionviewrestriction
37	wagtailcore	site
38	wagtailcore	collection
39	wagtailcore	groupcollectionpermission
40	wagtailcore	pagerevision
41	blog	blogindexpage
42	blog	blogpage
43	events	message
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 43, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-08-24 21:38:40.458691+00
2	auth	0001_initial	2017-08-24 21:38:40.576931+00
3	account	0001_initial	2017-08-24 21:38:40.643239+00
4	account	0002_email_max_length	2017-08-24 21:38:40.693319+00
5	admin	0001_initial	2017-08-24 21:38:40.758986+00
6	admin	0002_logentry_remove_auto_add	2017-08-24 21:38:40.78267+00
7	api	0001_initial	2017-08-24 21:38:40.799751+00
8	api	0002_delete_snippet	2017-08-24 21:38:40.816046+00
9	contenttypes	0002_remove_content_type_name	2017-08-24 21:38:40.869878+00
10	auth	0002_alter_permission_name_max_length	2017-08-24 21:38:40.894402+00
11	auth	0003_alter_user_email_max_length	2017-08-24 21:38:40.917739+00
12	auth	0004_alter_user_username_opts	2017-08-24 21:38:40.940786+00
13	auth	0005_alter_user_last_login_null	2017-08-24 21:38:41.018891+00
14	auth	0006_require_contenttypes_0002	2017-08-24 21:38:41.024887+00
15	auth	0007_alter_validators_add_error_messages	2017-08-24 21:38:41.044135+00
16	auth	0008_alter_user_username_max_length	2017-08-24 21:38:41.072407+00
17	core	0001_initial	2017-08-24 21:38:41.100955+00
18	core	0002_auto_20170820_0118	2017-08-24 21:38:41.128895+00
19	events	0001_initial	2017-08-24 21:38:41.339674+00
20	events	0002_auto_20170805_1711	2017-08-24 21:38:41.440601+00
21	events	0003_auto_20170806_0519	2017-08-24 21:38:41.491943+00
22	events	0004_auto_20170809_0006	2017-08-24 21:38:41.621093+00
23	events	0005_remove_event_points	2017-08-24 21:38:41.64901+00
24	events	0006_auto_20170809_0022	2017-08-24 21:38:41.734794+00
25	events	0007_auto_20170809_0028	2017-08-24 21:38:41.772482+00
26	events	0008_auto_20170809_0035	2017-08-24 21:38:41.837226+00
27	events	0009_event_extended_description	2017-08-24 21:38:41.872417+00
28	events	0010_speaker	2017-08-24 21:38:41.932585+00
29	events	0011_auto_20170813_0418	2017-08-24 21:38:42.035426+00
30	events	0012_auto_20170813_0418	2017-08-24 21:38:42.128136+00
31	events	0013_announcement	2017-08-24 21:38:42.154842+00
32	events	0014_userprofile_year	2017-08-24 21:38:42.208038+00
33	events	0015_auto_20170820_2320	2017-08-24 21:38:42.295111+00
34	sessions	0001_initial	2017-08-24 21:38:42.319853+00
35	sites	0001_initial	2017-08-24 21:38:42.334771+00
36	sites	0002_alter_domain_unique	2017-08-24 21:38:42.354183+00
37	socialaccount	0001_initial	2017-08-24 21:38:42.558823+00
38	socialaccount	0002_token_max_lengths	2017-08-24 21:38:42.845284+00
39	socialaccount	0003_extra_data_default_dict	2017-08-24 21:38:42.90227+00
40	taggit	0001_initial	2017-08-24 22:17:35.823328+00
41	wagtailimages	0001_initial	2017-08-24 22:17:35.994082+00
42	wagtailcore	0001_initial	2017-08-24 22:17:36.710982+00
43	wagtailcore	0002_initial_data	2017-08-24 22:17:36.716836+00
44	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2017-08-24 22:17:36.727089+00
45	wagtailcore	0004_page_locked	2017-08-24 22:17:36.732707+00
46	wagtailcore	0005_add_page_lock_permission_to_moderators	2017-08-24 22:17:36.73807+00
47	wagtailcore	0006_add_lock_page_permission	2017-08-24 22:17:36.743279+00
48	wagtailcore	0007_page_latest_revision_created_at	2017-08-24 22:17:36.748412+00
49	wagtailcore	0008_populate_latest_revision_created_at	2017-08-24 22:17:36.754335+00
50	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2017-08-24 22:17:36.760034+00
51	wagtailcore	0010_change_page_owner_to_null_on_delete	2017-08-24 22:17:36.766386+00
52	wagtailcore	0011_page_first_published_at	2017-08-24 22:17:36.772422+00
53	wagtailcore	0012_extend_page_slug_field	2017-08-24 22:17:36.7785+00
54	wagtailcore	0013_update_golive_expire_help_text	2017-08-24 22:17:36.783446+00
55	wagtailcore	0014_add_verbose_name	2017-08-24 22:17:36.788563+00
56	wagtailcore	0015_add_more_verbose_names	2017-08-24 22:17:36.79389+00
57	wagtailcore	0016_change_page_url_path_to_text_field	2017-08-24 22:17:36.798782+00
58	wagtailimages	0002_initial_data	2017-08-24 22:17:36.855598+00
59	wagtailimages	0003_fix_focal_point_fields	2017-08-24 22:17:37.1966+00
60	wagtailimages	0004_make_focal_point_key_not_nullable	2017-08-24 22:17:37.260945+00
61	wagtailimages	0005_make_filter_spec_unique	2017-08-24 22:17:37.33786+00
62	wagtailimages	0006_add_verbose_names	2017-08-24 22:17:37.566369+00
63	wagtailimages	0007_image_file_size	2017-08-24 22:17:37.625721+00
64	wagtailimages	0008_image_created_at_index	2017-08-24 22:17:37.681372+00
65	wagtailimages	0009_capitalizeverbose	2017-08-24 22:17:38.014266+00
66	wagtailimages	0010_change_on_delete_behaviour	2017-08-24 22:17:38.089064+00
67	wagtailcore	0017_change_edit_page_permission_description	2017-08-24 22:17:38.325995+00
68	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2017-08-24 22:17:38.375666+00
69	wagtailcore	0019_verbose_names_cleanup	2017-08-24 22:17:38.649679+00
70	wagtailcore	0020_add_index_on_page_first_published_at	2017-08-24 22:17:38.76372+00
71	wagtailcore	0021_capitalizeverbose	2017-08-24 22:17:40.701464+00
72	wagtailcore	0022_add_site_name	2017-08-24 22:17:40.765219+00
73	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2017-08-24 22:17:40.838374+00
74	wagtailcore	0024_collection	2017-08-24 22:17:40.862736+00
75	wagtailcore	0025_collection_initial_data	2017-08-24 22:17:40.875102+00
76	wagtailcore	0026_group_collection_permission	2017-08-24 22:17:41.22145+00
77	wagtailimages	0011_image_collection	2017-08-24 22:17:41.311985+00
78	wagtailimages	0012_copy_image_permissions_to_collections	2017-08-24 22:17:41.349027+00
79	wagtailimages	0013_make_rendition_upload_callable	2017-08-24 22:17:41.409295+00
80	wagtailimages	0014_add_filter_spec_field	2017-08-24 22:17:41.554828+00
81	wagtailimages	0015_fill_filter_spec_field	2017-08-24 22:17:41.565041+00
82	wagtailimages	0016_deprecate_rendition_filter_relation	2017-08-24 22:17:41.76837+00
83	wagtailimages	0017_reduce_focal_point_key_max_length	2017-08-24 22:17:41.844571+00
84	wagtailimages	0018_remove_rendition_filter	2017-08-24 22:17:41.931138+00
85	wagtailimages	0019_delete_filter	2017-08-24 22:17:41.947606+00
86	wagtailcore	0027_fix_collection_path_collation	2017-08-24 22:17:41.968438+00
87	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2017-08-24 22:17:42.051661+00
88	wagtailcore	0028_merge	2017-08-24 22:17:42.058705+00
89	wagtailcore	0029_unicode_slugfield_dj19	2017-08-24 22:17:42.20123+00
90	wagtailcore	0030_index_on_pagerevision_created_at	2017-08-24 22:17:42.273653+00
91	wagtailcore	0031_add_page_view_restriction_types	2017-08-24 22:17:42.483969+00
92	wagtailcore	0032_add_bulk_delete_page_permission	2017-08-24 22:17:42.548015+00
93	wagtailcore	0033_remove_golive_expiry_help_text	2017-08-24 22:17:42.99159+00
94	wagtailcore	0034_page_live_revision	2017-08-24 22:17:43.072995+00
95	wagtailcore	0035_page_last_published_at	2017-08-24 22:17:43.154477+00
96	wagtailcore	0036_populate_page_last_published_at	2017-08-24 22:17:43.174644+00
97	wagtailcore	0037_set_page_owner_editable	2017-08-24 22:17:43.26166+00
98	wagtailcore	0038_make_first_published_at_editable	2017-08-24 22:17:43.323469+00
99	wagtailcore	0039_collectionviewrestriction	2017-08-24 22:17:43.523094+00
100	blog	0001_initial	2017-08-24 22:17:43.624403+00
101	blog	0002_blogpage	2017-08-24 22:17:43.741621+00
102	blog	0003_blogpagegalleryimage	2017-08-24 22:17:43.839513+00
103	blog	0004_auto_20170808_1917	2017-08-24 22:17:44.043769+00
104	taggit	0002_auto_20150616_2121	2017-08-24 22:17:44.134692+00
105	wagtailadmin	0001_create_admin_access_permissions	2017-08-24 22:17:44.180037+00
106	wagtaildocs	0001_initial	2017-08-24 22:17:44.257928+00
107	wagtaildocs	0002_initial_data	2017-08-24 22:17:44.37159+00
108	wagtaildocs	0003_add_verbose_names	2017-08-24 22:17:44.816014+00
109	wagtaildocs	0004_capitalizeverbose	2017-08-24 22:17:45.190762+00
110	wagtaildocs	0005_document_collection	2017-08-24 22:17:45.283838+00
111	wagtaildocs	0006_copy_document_permissions_to_collections	2017-08-24 22:17:45.313963+00
112	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2017-08-24 22:17:45.385726+00
113	wagtaildocs	0007_merge	2017-08-24 22:17:45.391344+00
114	wagtailembeds	0001_initial	2017-08-24 22:17:45.429825+00
115	wagtailembeds	0002_add_verbose_names	2017-08-24 22:17:45.444463+00
116	wagtailembeds	0003_capitalizeverbose	2017-08-24 22:17:45.458634+00
117	wagtailforms	0001_initial	2017-08-24 22:17:45.521937+00
118	wagtailforms	0002_add_verbose_names	2017-08-24 22:17:45.630844+00
119	wagtailforms	0003_capitalizeverbose	2017-08-24 22:17:45.736851+00
120	wagtailredirects	0001_initial	2017-08-24 22:17:45.838251+00
121	wagtailredirects	0002_add_verbose_names	2017-08-24 22:17:46.210759+00
122	wagtailredirects	0003_make_site_field_editable	2017-08-24 22:17:46.293475+00
123	wagtailredirects	0004_set_unique_on_path_and_site	2017-08-24 22:17:46.438619+00
124	wagtailredirects	0005_capitalizeverbose	2017-08-24 22:17:46.804581+00
125	wagtailsearch	0001_initial	2017-08-24 22:17:46.981325+00
126	wagtailsearch	0002_add_verbose_names	2017-08-24 22:17:47.379333+00
127	wagtailsearch	0003_remove_editors_pick	2017-08-24 22:17:47.443908+00
128	wagtailusers	0001_initial	2017-08-24 22:17:47.511223+00
129	wagtailusers	0002_add_verbose_name_on_userprofile	2017-08-24 22:17:47.689381+00
130	wagtailusers	0003_add_verbose_names	2017-08-24 22:17:47.753553+00
131	wagtailusers	0004_capitalizeverbose	2017-08-24 22:17:47.956418+00
132	wagtailusers	0005_make_related_name_wagtail_specific	2017-08-24 22:17:48.042184+00
133	wagtailusers	0006_userprofile_prefered_language	2017-08-24 22:17:48.121782+00
134	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2017-08-24 22:17:48.133621+00
135	events	0016_auto_20170825_1550	2017-08-25 15:51:04.738115+00
136	events	0016_auto_20170826_2008	2017-08-26 21:58:35.575228+00
137	events	0017_auto_20170826_2111	2017-08-26 21:58:35.698934+00
138	events	0018_auto_20170826_2122	2017-08-26 21:58:35.780422+00
139	events	0019_userprofile_tshirt	2017-08-26 22:42:47.455079+00
140	events	0020_auto_20170827_0223	2017-08-27 02:26:56.531642+00
141	events	0021_auto_20170828_0041	2017-08-28 00:46:59.358964+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 141, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
awqqzzz3q3iauxoyuuc4cx5oamlfsxgc	Y2FhZWY1ODIzOTFmYmI4YmYxZjcyZjA3Mzc2MWMzMzdmMDVjZmZkZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NDUzMDYyNTYxZGQwMTI1N2Y5YjU5ZDAxMTUzYWIyY2ZlMzY5ZDQ0In0=	2017-09-07 22:25:30.492491+00
dl3kcek9o88bw163e93aslhze7yag8uc	NzEzMGE4ZDljOGVhY2VlYzE2YTkxZGYzNzczMmVlNmNiY2FjNWJmMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGUxNjU1MjFiYzAwYjliY2UyNTA1MmEyODI1YzE2ZWQ2NDM5NTM2In0=	2017-09-07 23:19:51.025175+00
i8d9rob7vmxylsoa7byzg9sgqasdejzf	Y2ViZGYxZmRkMzRjZmRiM2YyNDE0NWM3Yjg4YjA1YzdmMDZlZjkzYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI0ZTY5MGFkYjE3NWM3NDQ2NWVlMTU4Y2MzNmQwYTdiOGRkNDVjNGQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=	2017-09-10 22:44:14.222903+00
fc73r14d0qyrp9yi24onc3u8awyqhq5m	NDQ1MmVmZGI1OGZkZWYxZjE3ODY1MDQxNTZhOTViYjQ2Y2E5ZGExZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNGU2OTBhZGIxNzVjNzQ0NjVlZTE1OGNjMzZkMGE3YjhkZDQ1YzRkIn0=	2017-09-11 00:47:55.087883+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: events_announcement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_announcement (id, created, modified, title, text, slug) FROM stdin;
\.


--
-- Name: events_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_announcement_id_seq', 1, false);


--
-- Data for Name: events_attendance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_attendance (id, event_id, user_id, is_owner, attending) FROM stdin;
\.


--
-- Name: events_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_attendance_id_seq', 1, false);


--
-- Data for Name: events_event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_event (id, created, modified, slug, date, description, is_active, name, event_type, location_id, image, extended_description, points) FROM stdin;
1	2017-08-24 21:53:52.252761+00	2017-08-24 21:53:52.252839+00	fall-2017-info-night	2017-09-05 18:15:00+00		t	Fall 2017 Info Night	meeting	1			\N
2	2017-08-24 21:55:44.68831+00	2017-08-24 21:55:44.68835+00	skype-speaker-dave-chase	2017-09-19 18:15:00+00	General Manager of the Schaumburg Boomers	t	Skype Speaker Dave Chase	meeting	1			\N
3	2017-08-24 21:57:27.757179+00	2017-08-24 21:57:27.757225+00	sapora-symposium-day-1	2017-09-21 12:00:00+00	Sign up for 1 Credit Hour Class	t	Sapora Symposium Day 1	event	2			\N
4	2017-08-24 21:58:11.001621+00	2017-08-24 21:58:11.001668+00	sapora-symposium-day-2	2017-09-22 12:00:00+00	Sign up for 1 Credit Hour Class	t	Sapora Symposium Day 2	event	2			\N
5	2017-08-24 21:59:05.95636+00	2017-08-24 21:59:05.956403+00	speaker-alex-roux	2017-09-28 12:00:00+00	Social Media Coordinator at Big Ten Network	t	Speaker Alex Roux	event	3			\N
6	2017-08-24 22:00:38.50325+00	2017-08-24 22:00:38.503307+00	dia-day-trip-exploring-illinois-athletic	2017-11-03 09:00:00+00		t	DIA Day Trip - Exploring Illinois Athletics	event	3			\N
7	2017-08-24 22:02:43.502703+00	2017-08-24 22:02:43.502742+00	indiana-pacers-trip	2017-11-07 13:00:00+00	ISBC and SBA Members learn from Pacers Executives	t	Indiana Pacers Trip	\N	4			\N
8	2017-08-24 22:03:35.68211+00	2017-08-24 22:03:35.68215+00	speaker-brady-bruhn	2017-11-14 18:15:00+00	Ticket Manager at  St. Louis Cardinals	t	Speaker Brady Bruhn	meeting	1			\N
9	2017-08-24 22:05:26.056717+00	2017-08-24 22:05:26.056784+00	ncaa-headquarters-trip	2017-12-04 08:00:00+00		t	NCAA Headquarters Trip	event	5			\N
12	2017-08-24 23:00:40.795846+00	2017-08-24 23:00:40.795899+00	chicago-bulls-and-blackhawks	2016-12-20 12:00:00+00		f	Chicago Bulls and Blackhawks	event	8		We had the opportunity to visit the United Center and hear from several executives from the Chicago Bulls and Chicago Blackhawks front offices, as well as some of the United Center staff. During lunch, we were able to meet and network with some of the Illinois alumni that work for both of the organizations. We ended the day with a tour of the stadium and an inside look into what goes on behind the scenes on gamedays.	\N
11	2017-08-24 22:57:58.609226+00	2017-08-24 23:00:52.854307+00	chicago-bears-game	\N		f	Chicago Bears Game	event	7		SBA traveled to Soldier Field for a tour of the stadium and a chat with Bears employees. The Bears gave us an in depth tour of the stadium, including a look inside the locker rooms, a trip down onto the field and a peek into some of the top notch suites. Our panel discussion included around 11 Bears full time employees across several departments.	\N
13	2017-08-24 23:02:43.912145+00	2017-08-24 23:02:43.912187+00	chicago-white-sox	2017-04-25 12:00:00+00		f	Chicago White Sox	event	9			\N
10	2017-08-24 22:56:50.462421+00	2017-08-24 23:12:30.748351+00	chicago-cubs-game	2016-09-15 12:00:00+00		f	Chicago Cubs Game	event	6		Our members got the unique opportunity to sit on the third baseline during batting practice and talk to some of the Cubs front office staff. Following our discussion, we stayed and enjoyed the game. https://www.youtube.com/watch?v=ENFamD6x0kw&t=1s	\N
14	2017-08-24 23:04:55.269522+00	2017-08-26 22:47:37.872816+00	na	2019-09-27 22:47:36+00		t	N/A	\N	3			\N
\.


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_event_id_seq', 14, true);


--
-- Data for Name: events_event_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_event_messages (id, event_id, message_id) FROM stdin;
\.


--
-- Name: events_event_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_event_messages_id_seq', 1, false);


--
-- Data for Name: events_eventlocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventlocation (id, created, modified, address, address2, city, state, zipcode) FROM stdin;
1	2017-08-24 21:53:40.200241+00	2017-08-24 21:53:40.200285+00	Huff Hall Room 2001				
2	2017-08-24 21:56:31.107599+00	2017-08-24 21:56:31.107652+00	Sapora Symposium				
3	2017-08-24 21:59:01.916321+00	2017-08-24 21:59:01.916377+00	N/A				
4	2017-08-24 22:02:36.475552+00	2017-08-24 22:02:36.475605+00	125 S Pennsylvania St		Indianapolis	IN	46204
5	2017-08-24 22:05:20.712309+00	2017-08-24 22:05:20.712352+00	NCAA Headquarters	700 W. Washington Street	Indianapolic	Indiana	46206
6	2017-08-24 22:55:55.973795+00	2017-08-24 22:55:55.973854+00	Wrigley Field	1060 W Addison St	Chicago	IL	60613
7	2017-08-24 22:57:47.361595+00	2017-08-24 22:57:47.361644+00	Solder Field	1410 Museum Campus Dr	Chicago	IL	60605
8	2017-08-24 22:59:02.248221+00	2017-08-24 22:59:02.248261+00	United Center	1901 W Madison St	Chicago	IL	60612
9	2017-08-24 23:02:13.517493+00	2017-08-24 23:02:13.517552+00	Guaranteed Rate Field	333 W 35th St	Chicago	IL	60616
\.


--
-- Name: events_eventlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_eventlocation_id_seq', 9, true);


--
-- Data for Name: events_message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_message (id, created, modified, text, event_id, user_id) FROM stdin;
1	2017-08-27 23:36:34.086801+00	2017-08-27 23:36:34.086851+00	example text	1	7
\.


--
-- Name: events_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_message_id_seq', 1, true);


--
-- Data for Name: events_speaker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_speaker (id, created, modified, name, image, description, slug, event_id) FROM stdin;
1	2017-08-24 23:05:00.094496+00	2017-08-24 23:05:00.094552+00	Dino  Pollock		Pollock is a University of Illinois alum and completed both his Bachelor’s and Master’s degree at our University before completing his Law Degree at Valparaiso University. He is also a former Illini Football Player! Pollock is currently an Associate Director in the Office of the Committees on Infractions for the NCAA.	dino-pollock	14
2	2017-08-24 23:05:34.327049+00	2017-08-24 23:05:34.327092+00	Ed Sherman		Sherman has over 30 years of experience as a professional sports columnist and is currently an Adjunct Lecturer at Northwestern University and the University of Illinois!	ed-sherman	14
\.


--
-- Name: events_speaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_speaker_id_seq', 2, true);


--
-- Data for Name: events_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_userprofile (id, created, modified, avatar, bio, user_id, points, year, dues_paid, phone_number, tshirt, first_name, last_name) FROM stdin;
7	2017-08-25 15:33:54.571284+00	2017-08-25 15:33:54.571377+00		\N	7	\N	FR	f	user	M	\N	\N
14	2017-08-25 17:46:36.573465+00	2017-08-25 17:46:36.573502+00		\N	14	\N	FR	f	user	M	\N	\N
16	2017-08-25 18:24:24.603017+00	2017-08-25 18:24:24.60306+00		\N	16	\N	FR	f	user	M	\N	\N
19	2017-08-25 20:07:26.375419+00	2017-08-25 20:07:26.375478+00		\N	19	\N	FR	f	user	M	\N	\N
2	2017-08-24 22:07:36.519891+00	2017-08-27 02:15:40.65448+00	events/static/users/2/tristan.png		2	\N	FR	f	user	M	\N	\N
3	2017-08-24 22:08:37.370314+00	2017-08-27 02:15:49.655032+00	events/static/users/3/abby.jpg		3	\N	FR	f	user	M	\N	\N
4	2017-08-24 22:09:00.686915+00	2017-08-27 02:16:01.47968+00	events/static/users/4/teagan.jpg		4	\N	FR	f	user	M	\N	\N
5	2017-08-24 22:09:31.658883+00	2017-08-27 02:16:09.774216+00	events/static/users/5/austin.png		5	\N	FR	f	user	M	\N	\N
1	2017-08-24 21:51:38.982229+00	2017-08-27 05:43:40.178377+00		his is where kATIE WAS	1	\N	FR	f	user	M	\N	\N
20	2017-08-27 05:45:25.12886+00	2017-08-27 05:45:25.128884+00		\N	20	\N	FR	f	\N	M	\N	\N
\.


--
-- Name: events_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_userprofile_id_seq', 20, true);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: -
--

COPY socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_collection_id_seq', 1, true);


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	61
2	1	2	61
3	1	1	62
4	1	2	62
5	1	1	65
6	1	2	65
7	1	1	66
8	1	2	66
\.


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: -
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
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at) FROM stdin;
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	21	\N	f	\N	\N	\N	\N
5	00010001	2	1	ISBA Blog	isba-blog	t	f	/isba-blog/	Isba Blog	t	blog	\N	\N	f	41	1	f	2017-08-26 20:20:32.017283+00	2017-08-26 20:11:42.897625+00	5	2017-08-26 20:20:32.052998+00
6	000100010001	3	0	Hello, World	first-post	t	f	/isba-blog/first-post/		f		\N	\N	f	42	1	f	2017-08-26 22:37:35.365058+00	2017-08-26 20:33:09.782232+00	7	2017-08-26 22:37:35.40175+00
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 6, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
5	f	2017-08-26 20:20:32.017283+00	{"latest_revision_created_at": "2017-08-26T20:11:42.866Z", "pk": 5, "first_published_at": "2017-08-26T20:11:42.897Z", "live_revision": 4, "go_live_at": null, "title": "ISBA Blog", "numchild": 0, "slug": "isba-blog", "expire_at": null, "search_description": "blog", "expired": false, "depth": 2, "content_type": 41, "path": "00010001", "live": true, "show_in_menus": true, "intro": "<p>News, updates, and special announcements are posted here</p>", "owner": 1, "has_unpublished_changes": false, "locked": false, "seo_title": "Isba Blog", "last_published_at": "2017-08-26T20:11:42.897Z", "url_path": "/isba-blog/"}	\N	5	1
4	f	2017-08-26 20:11:42.866823+00	{"latest_revision_created_at": null, "pk": 5, "first_published_at": null, "live_revision": null, "go_live_at": null, "title": "ISBA Blog", "numchild": 0, "slug": "isba-blog", "expire_at": null, "search_description": "blog", "expired": false, "depth": 2, "content_type": 41, "path": "00010001", "live": true, "show_in_menus": true, "intro": "<p>News, updates, and special announcements are posted here</p>", "owner": 1, "has_unpublished_changes": false, "locked": false, "seo_title": "Isba Blog", "last_published_at": null, "url_path": "/isba-blog/"}	\N	5	1
7	f	2017-08-26 22:37:35.365058+00	{"expired": false, "owner": 1, "depth": 3, "body": "<p>Starting with the new school year, ISBA has relaunched their website in order to share information past and present, communicate with its members, track attendance, and easily pay your dues.</p><p>Get ready for the upcoming events for the new school year!</p>", "go_live_at": null, "latest_revision_created_at": "2017-08-26T20:33:09.750Z", "expire_at": null, "numchild": 0, "has_unpublished_changes": false, "url_path": "/isba-blog/first-post/", "title": "Hello, World", "seo_title": "", "pk": 6, "slug": "first-post", "show_in_menus": false, "live_revision": 6, "first_published_at": "2017-08-26T20:33:09.782Z", "last_published_at": "2017-08-26T20:33:09.782Z", "search_description": "", "locked": false, "live": true, "intro": "Welcome to ISBA's official website!", "content_type": 42, "date": "2017-08-26", "path": "000100010001"}	\N	6	1
6	f	2017-08-26 20:33:09.750336+00	{"latest_revision_created_at": null, "pk": 6, "first_published_at": null, "date": "2017-08-26", "live_revision": null, "body": "<p>I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life... He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful... the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. It's ironic he could save others from death, but not himself.</p>", "go_live_at": null, "title": "FIRST POST", "numchild": 0, "slug": "first-post", "expire_at": null, "search_description": "", "expired": false, "depth": 3, "content_type": 42, "path": "000100010001", "live": true, "show_in_menus": false, "intro": "just testing", "owner": 1, "has_unpublished_changes": false, "locked": false, "seo_title": "", "last_published_at": null, "url_path": "/isba-blog/first-post/"}	\N	6	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 7, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	illinoissba.org	80	f	5	Illinois Sports Business Association
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 2, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id) FROM stdin;
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 1, false);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, image_id, filter_spec) FROM stdin;
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 1, false);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language) FROM stdin;
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogindexpage blog_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogpage blog_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: core_alumni core_alumni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_alumni
    ADD CONSTRAINT core_alumni_pkey PRIMARY KEY (id);


--
-- Name: core_alumni core_alumni_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_alumni
    ADD CONSTRAINT core_alumni_slug_key UNIQUE (slug);


--
-- Name: core_sponsor core_sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_sponsor
    ADD CONSTRAINT core_sponsor_pkey PRIMARY KEY (id);


--
-- Name: core_sponsor core_sponsor_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY core_sponsor
    ADD CONSTRAINT core_sponsor_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: events_announcement events_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_announcement
    ADD CONSTRAINT events_announcement_pkey PRIMARY KEY (id);


--
-- Name: events_announcement events_announcement_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_announcement
    ADD CONSTRAINT events_announcement_slug_key UNIQUE (slug);


--
-- Name: events_attendance events_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_attendance
    ADD CONSTRAINT events_attendance_pkey PRIMARY KEY (id);


--
-- Name: events_event_messages events_event_messages_event_id_9db11bd2_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event_messages
    ADD CONSTRAINT events_event_messages_event_id_9db11bd2_uniq UNIQUE (event_id, message_id);


--
-- Name: events_event_messages events_event_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event_messages
    ADD CONSTRAINT events_event_messages_pkey PRIMARY KEY (id);


--
-- Name: events_event events_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_pkey PRIMARY KEY (id);


--
-- Name: events_event events_event_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_slug_key UNIQUE (slug);


--
-- Name: events_eventlocation events_eventlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventlocation
    ADD CONSTRAINT events_eventlocation_pkey PRIMARY KEY (id);


--
-- Name: events_message events_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_message
    ADD CONSTRAINT events_message_pkey PRIMARY KEY (id);


--
-- Name: events_speaker events_speaker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_speaker
    ADD CONSTRAINT events_speaker_pkey PRIMARY KEY (id);


--
-- Name: events_speaker events_speaker_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_speaker
    ADD CONSTRAINT events_speaker_slug_key UNIQUE (slug);


--
-- Name: events_userprofile events_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_userprofile
    ADD CONSTRAINT events_userprofile_pkey PRIMARY KEY (id);


--
-- Name: events_userprofile events_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_userprofile
    ADD CONSTRAINT events_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_collectionviewrestriction_id_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestriction_id_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collection wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_group_id_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site wagtailcore_site_hostname_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_url_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_image_id_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_old_path_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_query_id_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_e8701ad4 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_6f1edeac ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_alumni_slug_44d5872a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_alumni_slug_44d5872a_like ON core_alumni USING btree (slug varchar_pattern_ops);


--
-- Name: core_sponsor_slug_315c78cf_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX core_sponsor_slug_315c78cf_like ON core_sponsor USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: events_announcement_slug_57b2bdd5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_announcement_slug_57b2bdd5_like ON events_announcement USING btree (slug varchar_pattern_ops);


--
-- Name: events_attendance_4437cfac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_attendance_4437cfac ON events_attendance USING btree (event_id);


--
-- Name: events_attendance_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_attendance_e8701ad4 ON events_attendance USING btree (user_id);


--
-- Name: events_event_e274a5da; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_event_e274a5da ON events_event USING btree (location_id);


--
-- Name: events_event_messages_4437cfac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_event_messages_4437cfac ON events_event_messages USING btree (event_id);


--
-- Name: events_event_messages_4ccaa172; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_event_messages_4ccaa172 ON events_event_messages USING btree (message_id);


--
-- Name: events_event_slug_b44b2c04_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_event_slug_b44b2c04_like ON events_event USING btree (slug varchar_pattern_ops);


--
-- Name: events_message_c4ec30b7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_message_c4ec30b7 ON events_message USING btree (event_id);


--
-- Name: events_message_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_message_e8701ad4 ON events_message USING btree (user_id);


--
-- Name: events_speaker_4437cfac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_speaker_4437cfac ON events_speaker USING btree (event_id);


--
-- Name: events_speaker_slug_d5a352ee_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_speaker_slug_d5a352ee_like ON events_speaker USING btree (slug varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_196cc965_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_content_type_id_196cc965_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionviewrestriction_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_0a1a4dd8 ON wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_0e939a4f ON wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_19f356fa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_19f356fa ON wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_groupcollectionpermission_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_0a1a4dd8 ON wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_0e939a4f ON wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_8373b171 ON wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_47e527a3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_47e527a3 ON wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637_uniq ON wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b_uniq ON wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq ON wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_0e939a4f ON wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_9bdbac54; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_9bdbac54 ON wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtaildocs_document_0a1a4dd8 ON wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_0a1a4dd8 ON wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4_uniq ON wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_58c64917; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_58c64917 ON wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: wagtailcore_pageviewrestriction_groups D6153c3498c9836c76562dfe1e22f279; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT "D6153c3498c9836c76562dfe1e22f279" FOREIGN KEY (pageviewrestriction_id) REFERENCES wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpage blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpage blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_attendance events_attendance_event_id_7d028551_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_attendance
    ADD CONSTRAINT events_attendance_event_id_7d028551_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_attendance events_attendance_user_id_fabb08e1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_attendance
    ADD CONSTRAINT events_attendance_user_id_fabb08e1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event events_event_location_id_2fb4171f_fk_events_eventlocation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event
    ADD CONSTRAINT events_event_location_id_2fb4171f_fk_events_eventlocation_id FOREIGN KEY (location_id) REFERENCES events_eventlocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_messages events_event_messages_event_id_3f1420ce_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event_messages
    ADD CONSTRAINT events_event_messages_event_id_3f1420ce_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_messages events_event_messages_message_id_f8cff572_fk_events_message_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_event_messages
    ADD CONSTRAINT events_event_messages_message_id_f8cff572_fk_events_message_id FOREIGN KEY (message_id) REFERENCES events_message(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_message events_message_event_id_a7a9885b_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_message
    ADD CONSTRAINT events_message_event_id_a7a9885b_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_message events_message_user_id_0a94ca51_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_message
    ADD CONSTRAINT events_message_user_id_0a94ca51_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_speaker events_speaker_event_id_5d094b57_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_speaker
    ADD CONSTRAINT events_speaker_event_id_5d094b57_fk_events_event_id FOREIGN KEY (event_id) REFERENCES events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_userprofile events_userprofile_user_id_2fd91d02_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_userprofile
    ADD CONSTRAINT events_userprofile_user_id_2fd91d02_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups fe4676fd2a60628be3eef16b10c3757b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT fe4676fd2a60628be3eef16b10c3757b FOREIGN KEY (collectionviewrestriction_id) REFERENCES wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtai_live_revision_id_930bd822_fk_wagtailcore_pagerevision_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtai_live_revision_id_930bd822_fk_wagtailcore_pagerevision_id FOREIGN KEY (live_revision_id) REFERENCES wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore__content_type_id_c28424df_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_c28424df_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collection_id_761908ec_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collection_id_761908ec_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewre_group_id_1823f2a3_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewre_group_id_1823f2a3_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestrict_group_id_6460f223_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestrict_group_id_6460f223_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendition wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspick wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspick wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

