Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE40312779
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Feb 2021 22:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhBGVLl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Feb 2021 16:11:41 -0500
Received: from vulcan.kevinlocke.name ([107.191.43.88]:45740 "EHLO
        vulcan.kevinlocke.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBGVLk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Feb 2021 16:11:40 -0500
X-Greylist: delayed 584 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Feb 2021 16:11:40 EST
Received: from kevinlocke.name (host-69-145-60-23.bln-mt.client.bresnan.net [69.145.60.23])
        (Authenticated sender: kevin@kevinlocke.name)
        by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 414FB2037D4F;
        Sun,  7 Feb 2021 21:01:07 +0000 (UTC)
Received: by kevinlocke.name (Postfix, from userid 1000)
        id 2398113054E8; Sun,  7 Feb 2021 14:01:06 -0700 (MST)
Date:   Sun, 7 Feb 2021 14:01:06 -0700
From:   Kevin Locke <kevin@kevinlocke.name>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-rtc@vger.kernel.org
Subject: [v5.11-rc6 Regression] RTC_RD_TIME EINVAL after RTC_WKALM_SET
Message-ID: <YCBVEp77/1BFL9E0@kevinlocke.name>
Mail-Followup-To: Kevin Locke <kevin@kevinlocke.name>,
        Thomas Gleixner <tglx@linutronix.de>, linux-rtc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On a ThinkPad T430 (2342-CTO) using rtc_cmos, on v5.11-rc6 (and torvalds
master, 825b5991a46e), ioctl(RTC_RD_TIME) returns EINVAL after a wake
alarm is set using ioctl(RTC_WKALM_SET), as observed using rtcwake(8):

# rtcwake --mode no --seconds 100
rtcwake: wakeup using /dev/rtc0 at Sun Feb  7 12:50:28 2021
# rtcwake --mode no --seconds 100
rtcwake: read rtc time failed: Invalid argument

Any subsequent non-trivial invocations of rtcwake fail with the same
error.  Relevant portion of strace(1):

openat(AT_FDCWD, "/dev/rtc0", O_RDONLY|O_CLOEXEC) = 3
ioctl(3, RTC_RD_TIME, 0x7ffd823c3020)   = -1 EINVAL (Invalid argument)

This also causes a WARNING in dmesg:

------------[ cut here ]------------
WARNING: CPU: 3 PID: 2545 at drivers/rtc/rtc-mc146818-lib.c:25 mc146818_get_time+0x1c8/0x220
Modules linked in: xt_CHECKSUM bridge stp llc blowfish_generic blowfish_x86_64 blowfish_common des_generic des3_ede_x86_64 libdes cast5_avx_x86_64 cast5_generic cast_common cbc aes_generic lrw gf128mul hid_generic usbhid hid ip6t_REJECT nf_reject_ipv6 nft_chain_nat ecb camellia_generic xt_MASQUERADE nf_nat nft_counter camellia_aesni_avx_x86_64 camellia_x86_64 ipt_REJECT nf_reject_ipv4 xt_tcpudp intel_rapl_msr twofish_generic xt_owner twofish_avx_x86_64 intel_rapl_common twofish_x86_64_3way xt_conntrack nf_conntrack twofish_x86_64 nf_defrag_ipv6 twofish_common nf_defrag_ipv4 nft_compat nf_tables libcrc32c x86_pkg_temp_thermal nfnetlink intel_powerclamp snd_hda_codec_realtek snd_hda_codec_generic coretemp binfmt_misc kvm_intel serpent_avx_x86_64 kvm snd_hda_intel snd_intel_dspcfg irqbypass soundwire_intel serpent_sse2_x86_64 serpent_generic soundwire_generic_allocation crc32_pclmul xts ghash_clmulni_intel snd_soc_core nls_ascii snd_compress at24 rapl mei_wdt algif_skcipher
 nls_cp437 vfat fat intel_cstate wmi_bmof essiv authenc i915 af_alg soundwire_cadence iwldvm snd_hda_codec intel_uncore mac80211 snd_hda_core drm_kms_helper snd_hwdep pcspkr libarc4 sdhci_pci xhci_pci cec iwlwifi sr_mod cqhci i2c_i801 soundwire_bus cdrom joydev iTCO_wdt efi_pstore intel_pmc_bxt i2c_smbus i2c_algo_bit e1000e iTCO_vendor_support fb_sys_fops ehci_pci mei_me tpm_tis xhci_hcd sdhci snd_pcm ehci_hcd syscopyarea sg ptp cfg80211 pps_core mmc_core snd_timer sysfillrect thinkpad_acpi watchdog sysimgblt mei tpm_tis_core usbcore nvram wmi ledtrig_audio tpm snd soundcore rfkill battery rng_core ac video button drm loop fuse configfs efivarfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 dm_crypt dm_mod sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_pclmul crct10dif_common crc32c_intel ahci libahci psmouse libata aesni_intel glue_helper libaes crypto_simd evdev cryptd scsi_mod serio_raw
CPU: 3 PID: 2545 Comm: rtcwake Not tainted 5.11.0-rc6 #53
Hardware name: LENOVO 2342CTO/2342CTO, BIOS G1ETC2WW (2.82 ) 08/07/2019
RIP: 0010:mc146818_get_time+0x1c8/0x220
Code: 89 6b 10 5b 5d 41 5c 41 5d 41 5e c3 48 89 ee 48 c7 c7 90 4e 94 ae e8 d7 f5 23 00 bf 58 89 41 00 e8 3d 13 e8 ff e9 4b fe ff ff <0f> 0b 48 c7 c7 90 4e 94 ae 48 89 ee e8 b7 f5 23 00 48 c7 03 ff ff
RSP: 0018:ffff8cb30017cf08 EFLAGS: 00010002
RAX: 0000000000000087 RBX: ffff8cb30017cf3c RCX: 00000000000369e9
RDX: 0000000000000001 RSI: ffff891b44018800 RDI: 000000000000000d
RBP: 0000000000000046 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8cb30017cfbc R14: 0000000000000008 R15: ffff891b40183c00
FS:  00007f475135a580(0000) GS:ffff891c562c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff2a6f2084 CR3: 0000000108058001 CR4: 00000000001706e0
Call Trace:
 <IRQ>
 hpet_rtc_interrupt+0x255/0x320
 __handle_irq_event_percpu+0x3d/0x150
 handle_irq_event+0x49/0xb0
 handle_edge_irq+0x82/0x220
 asm_call_irq_on_stack+0x12/0x20
 </IRQ>
 common_interrupt+0xb0/0x130
 asm_common_interrupt+0x1e/0x40
RIP: 0010:cmos_set_alarm+0x123/0x1f0
Code: f6 0f 85 b3 00 00 00 e8 6b 8a a4 ff 85 c0 74 09 80 3d b8 70 83 01 00 74 2b 80 3b 00 75 3c c6 05 52 21 74 01 00 fb 48 8d 7b 04 <e8> b8 a4 ff ff 48 89 45 20 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41
RSP: 0018:ffff8cb301d27ce0 EFLAGS: 00000246
RAX: 0000000000000001 RBX: ffff8cb301d27de0 RCX: 0000000000000046
RDX: ffff8cb300044000 RSI: 0000000000000022 RDI: ffff8cb301d27de4
RBP: ffffffffaea39d80 R08: 000000000000001f R09: fffffff186b1bfb7
R10: 00000000000b4014 R11: 0000000000000005 R12: 0000000000000010
R13: 0000000000000031 R14: 0000000000000055 R15: 0000000000000007
 __rtc_set_alarm+0xc7/0x160
 rtc_timer_enqueue+0x191/0x220
 ? rtc_set_alarm+0x139/0x170
 rtc_set_alarm+0x139/0x170
 rtc_dev_ioctl+0x222/0x480
 ? ptrace_do_notify+0x82/0xb0
 __x64_sys_ioctl+0x83/0xb0
 do_syscall_64+0x33/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f4751288cc7
Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007fff2a6b9e48 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f4751288cc7
RDX: 00007fff2a6b9e80 RSI: 000000004028700f RDI: 0000000000000003
RBP: 00007fff2a6b9ef0 R08: 0000000000000007 R09: 0000000000000640
R10: 00007fff2a6b9e70 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000003 R14: 0000565364fc104b R15: 00007fff2a6b9e80
---[ end trace f1d78761a9f207bf ]---

In case it is relevant, the only other reference to rtc in dmesg is:

rtc_cmos 00:02: RTC can wake from S4
rtc_cmos 00:02: registered as rtc0
rtc_cmos 00:02: setting system clock to 2021-02-07T10:34:06 UTC (1612694046)
rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs

I bisected the regression to:

211e5db19d15a721b2953ea54b8f26c2963720eb ("rtc: mc146818: Detect and handle broken RTCs")

Reverting this commit (on v5.11-rc6) avoids the issue on my system.
Let me know if there's anything else I can do to assist.

Thanks,
Kevin
