use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_init_logger(port_: i64) {
    wire_init_logger_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_init_light_client(port_: i64) {
    wire_init_light_client_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_start_chain_sync(
    port_: i64,
    chain_name: *mut wire_uint_8_list,
    chain_spec: *mut wire_uint_8_list,
    database: *mut wire_uint_8_list,
    relay_chain: *mut wire_uint_8_list,
) {
    wire_start_chain_sync_impl(port_, chain_name, chain_spec, database, relay_chain)
}

#[no_mangle]
pub extern "C" fn wire_stop_chain_sync(port_: i64, chain_name: *mut wire_uint_8_list) {
    wire_stop_chain_sync_impl(port_, chain_name)
}

#[no_mangle]
pub extern "C" fn wire_send_json_rpc_request(
    port_: i64,
    chain_name: *mut wire_uint_8_list,
    req: *mut wire_uint_8_list,
) {
    wire_send_json_rpc_request_impl(port_, chain_name, req)
}

#[no_mangle]
pub extern "C" fn wire_listen_json_rpc_responses(port_: i64, chain_name: *mut wire_uint_8_list) {
    wire_listen_json_rpc_responses_impl(port_, chain_name)
}

#[no_mangle]
pub extern "C" fn wire_solve__method__NposMiner(port_: i64, that: *mut wire_NposMiner) {
    wire_solve__method__NposMiner_impl(port_, that)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_npos_miner_0() -> *mut wire_NposMiner {
    support::new_leak_box_ptr(wire_NposMiner::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<NposMiner> for *mut wire_NposMiner {
    fn wire2api(self) -> NposMiner {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<NposMiner>::wire2api(*wrap).into()
    }
}
impl Wire2Api<NposMiner> for wire_NposMiner {
    fn wire2api(self) -> NposMiner {
        NposMiner {
            chain: self.chain.wire2api(),
            method: self.method.wire2api(),
            snapshot_bytes: self.snapshot_bytes.wire2api(),
            round: self.round.wire2api(),
            desired_targets: self.desired_targets.wire2api(),
            iterations: self.iterations.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}

// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_NposMiner {
    chain: *mut wire_uint_8_list,
    method: *mut wire_uint_8_list,
    snapshot_bytes: *mut wire_uint_8_list,
    round: u32,
    desired_targets: u32,
    iterations: usize,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_NposMiner {
    fn new_with_null_ptr() -> Self {
        Self {
            chain: core::ptr::null_mut(),
            method: core::ptr::null_mut(),
            snapshot_bytes: core::ptr::null_mut(),
            round: Default::default(),
            desired_targets: Default::default(),
            iterations: Default::default(),
        }
    }
}

impl Default for wire_NposMiner {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
