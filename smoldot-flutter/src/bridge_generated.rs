#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.4.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::rust2dart::IntoIntoDart;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

// Section: wire functions

fn wire_init_logger_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "init_logger",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || move |task_callback| init_logger(task_callback.stream_sink::<_, LogEntry>()),
    )
}
fn wire_init_light_client_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "init_light_client",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| init_light_client(),
    )
}
fn wire_start_chain_sync_impl(
    port_: MessagePort,
    chain_name: impl Wire2Api<String> + UnwindSafe,
    chain_spec: impl Wire2Api<String> + UnwindSafe,
    database: impl Wire2Api<String> + UnwindSafe,
    relay_chain: impl Wire2Api<Option<String>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "start_chain_sync",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_chain_name = chain_name.wire2api();
            let api_chain_spec = chain_spec.wire2api();
            let api_database = database.wire2api();
            let api_relay_chain = relay_chain.wire2api();
            move |task_callback| {
                start_chain_sync(
                    api_chain_name,
                    api_chain_spec,
                    api_database,
                    api_relay_chain,
                )
            }
        },
    )
}
fn wire_stop_chain_sync_impl(port_: MessagePort, chain_name: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "stop_chain_sync",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_chain_name = chain_name.wire2api();
            move |task_callback| stop_chain_sync(api_chain_name)
        },
    )
}
fn wire_send_json_rpc_request_impl(
    port_: MessagePort,
    chain_name: impl Wire2Api<String> + UnwindSafe,
    req: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "send_json_rpc_request",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_chain_name = chain_name.wire2api();
            let api_req = req.wire2api();
            move |task_callback| send_json_rpc_request(api_chain_name, api_req)
        },
    )
}
fn wire_listen_json_rpc_responses_impl(
    port_: MessagePort,
    chain_name: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "listen_json_rpc_responses",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            let api_chain_name = chain_name.wire2api();
            move |task_callback| {
                listen_json_rpc_responses(api_chain_name, task_callback.stream_sink::<_, String>())
            }
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for LogEntry {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.time_millis.into_into_dart().into_dart(),
            self.level.into_into_dart().into_dart(),
            self.tag.into_into_dart().into_dart(),
            self.msg.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for LogEntry {}
impl rust2dart::IntoIntoDart<LogEntry> for LogEntry {
    fn into_into_dart(self) -> Self {
        self
    }
}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
