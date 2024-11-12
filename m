Return-Path: <linux-rtc+bounces-2542-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 696059C65B7
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 01:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53011B305BB
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 22:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA6721B451;
	Tue, 12 Nov 2024 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V0uZacY1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E0421B456;
	Tue, 12 Nov 2024 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731451907; cv=none; b=ENFvvQR6RzxH0zN25iuHqw07cSffuaHLYka6sFHHvXSwyIoUcdkSb7DUJ7Ig7JF1LK+/aCjBih6xkZdaWwBOJ7DjpmimwIHekf7+H1PqBcy2mxFiqx1YITlrFTVSYFpAaSovrjK5kG8+Q5u/3xGdkxgbl6E0eBvmvWDcI3O8Ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731451907; c=relaxed/simple;
	bh=Qf//qHMMC/BVTezY34IsO0tua7dapMSDHo78QuHseL8=;
	h=To:Cc:Message-ID:In-Reply-To:References:From:Subject:Date; b=jCVq6NhBFJlFAMvMmpJY/pk7xz/vgrMv5B1BbB+I/Oa5K3RdQtv0/+BYEMXQDpuhxC9/yL+7VjLr5rE3dUFn4bbVzkluaESMNONgPPAED9Fjn8VcgXtDeqoBW287KJ9U4SxOeInPx9rUvSGuY4oDGub8GGmHEawOq9yRNNojLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V0uZacY1; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B56F725401B2;
	Tue, 12 Nov 2024 17:51:43 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 12 Nov 2024 17:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731451903; x=
	1731538303; bh=++vWAo60DDLzofCSTo+x/z+Tm/0PcF32HjJFTLd89g0=; b=V
	0uZacY1a7Zno69G2mOeJXjOHr6ppY/h+D196alzI/tNJaE4wsgqs0J5DzBZP9GeP
	6ZSCjYSAmiSDj7kp9yMT4KMIgu1vTgDn6pmAa/SzGr6EJ0oejhSw+EewILXtDbJS
	rsekYH7aiFn01d52GK30uYz1L09STbsAN2Pt/sOqWQOWFarE/35qPTyRqK5YHlh/
	Kef573+UGBlSgUZGXZ8zNo5vY4HjlSAIiuUOh0An24SVNx7g2NF/rT9d3cDk9jR+
	cXlbRnVCZrZvHGvsVpPf/ylIBS1hdPrR1g/hNSbuoaXx7sBmJFYSgUQVqCQp0hOo
	E8rhpxIhTtTc+0CLHciLA==
X-ME-Sender: <xms:_9szZ-JKLkIyY-IK7GgWwn7EafOmY5wz0lfx1vD9mcRRAoO9v-ysSg>
    <xme:_9szZ2IKSxEubTBePKoTRU1KAO92LAxYipapqS8RyN-WFvQcW7h1SrdwOPkGgQmyl
    tiJ5Lh3Ayc0UbzWsI0>
X-ME-Received: <xmr:_9szZ-vP_02LdsSXUB6mOWMARWRLxuvpThb-k4XFR7Ft3pBmSqZH211SjGseoO9IgJSm1Q1Q1FcSbTpEcPR-2B7E57dyfYG5bqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefvvefkjghfhffuffestddtredttddttdenucfhrhho
    mhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    eqnecuggftrfgrthhtvghrnhepvefggfdthffhfeevuedugfdtuefgfeettdevkeeigefg
    udelteeggeeuheegffffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrtheslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdp
    rhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthhtoheplh
    hinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_9szZzYVQMaHL1hV_-1VVMTbAiPS1pEiquOJuSCkLdUK7ydFOVNXiw>
    <xmx:_9szZ1ZQY5qFjC70-XRmjApLtXgMGCJBp4MZfsOXuRdvr1B1SduMIA>
    <xmx:_9szZ_AUpRrgtlAVkhopXLFKstSPZiXxC1TRtfxK4ZHdwbR_ttNPSA>
    <xmx:_9szZ7Yb94hbzvK4qRAXPx94F9hpWeSP2MidWSlSrZqEKhQac1nzeQ>
    <xmx:_9szZ4xg53C7S4aaxqjFN578nyB-lP2wlacHdj_GZ_tbn-rssw67taEb>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 17:51:40 -0500 (EST)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    linux-kernel@vger.kernel.org
Message-ID: <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1731450735.git.fthain@linux-m68k.org>
References: <cover.1731450735.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v4 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform
 driver
Date: Wed, 13 Nov 2024 09:32:15 +1100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

Both mvme147 and mvme16x platforms have their own RTC driver
implementations that duplicate functionality provided by the rtc-m48t59
driver. Adopt the rtc-m48t59 driver and remove the other ones.

Tested-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This patch depends upon the m48t59 driver changes in the preceding patch.

Changed since v1:
 - Initialize yy_offset in struct m48t59_plat_data.

Changed Since v3:
 - Re-ordered defconfig symbols.
 - Added reviewed-by tag from arch maintainer.
---
 arch/m68k/configs/multi_defconfig   |   1 +
 arch/m68k/configs/mvme147_defconfig |   1 +
 arch/m68k/configs/mvme16x_defconfig |   1 +
 arch/m68k/include/asm/mvme147hw.h   |  19 +---
 arch/m68k/include/asm/mvme16xhw.h   |  18 +--
 arch/m68k/mvme147/config.c          |  55 ++++------
 arch/m68k/mvme16x/Makefile          |   2 +-
 arch/m68k/mvme16x/config.c          |  57 ++++------
 arch/m68k/mvme16x/rtc.c             | 165 ----------------------------
 9 files changed, 54 insertions(+), 265 deletions(-)
 delete mode 100644 arch/m68k/mvme16x/rtc.c

diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 6f5ca3f85ea1..b34936391707 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -503,6 +503,7 @@ CONFIG_UHID=m
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_NVMEM is not set
+CONFIG_RTC_DRV_M48T59=m
 CONFIG_RTC_DRV_MSM6242=m
 CONFIG_RTC_DRV_RP5C01=m
 CONFIG_RTC_DRV_GENERIC=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index d16b328c7136..0cf6d05b9013 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -391,6 +391,7 @@ CONFIG_UHID=m
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_NVMEM is not set
+CONFIG_RTC_DRV_M48T59=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 80f6c15a5ed5..a4f2169bcde8 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -392,6 +392,7 @@ CONFIG_UHID=m
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_NVMEM is not set
+CONFIG_RTC_DRV_M48T59=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
diff --git a/arch/m68k/include/asm/mvme147hw.h b/arch/m68k/include/asm/mvme147hw.h
index dbf88059e47a..6ad93bac06f9 100644
--- a/arch/m68k/include/asm/mvme147hw.h
+++ b/arch/m68k/include/asm/mvme147hw.h
@@ -4,24 +4,7 @@
 
 #include <asm/irq.h>
 
-typedef struct {
-	unsigned char
-		ctrl,
-		bcd_sec,
-		bcd_min,
-		bcd_hr,
-		bcd_dow,
-		bcd_dom,
-		bcd_mth,
-		bcd_year;
-} MK48T02;
-
-#define RTC_WRITE	0x80
-#define RTC_READ	0x40
-#define RTC_STOP	0x20
-
-#define m147_rtc ((MK48T02 * volatile)0xfffe07f8)
-
+#define MVME147_RTC_BASE	0xfffe0000
 
 struct pcc_regs {
    volatile u_long	dma_tadr;
diff --git a/arch/m68k/include/asm/mvme16xhw.h b/arch/m68k/include/asm/mvme16xhw.h
index cc7f5ae1220f..ff1126a51fbe 100644
--- a/arch/m68k/include/asm/mvme16xhw.h
+++ b/arch/m68k/include/asm/mvme16xhw.h
@@ -24,23 +24,7 @@ typedef struct {
 
 #define mvmelp   ((*(volatile MVMElpPtr)(MVME_LPR_BASE)))
 
-typedef struct {
-	unsigned char
-		ctrl,
-		bcd_sec,
-		bcd_min,
-		bcd_hr,
-		bcd_dow,
-		bcd_dom,
-		bcd_mth,
-		bcd_year;
-} MK48T08_t, *MK48T08ptr_t;
-
-#define RTC_WRITE	0x80
-#define RTC_READ	0x40
-#define RTC_STOP	0x20
-
-#define MVME_RTC_BASE	0xfffc1ff8
+#define MVME_RTC_BASE	0xfffc0000
 
 #define MVME_I596_BASE	0xfff46000
 
diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index cc2fb0a83cf0..eccca04ceb7b 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -19,8 +19,9 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/major.h>
-#include <linux/rtc.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/rtc/m48t59.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-vme.h>
@@ -36,13 +37,9 @@
 
 static void mvme147_get_model(char *model);
 extern void mvme147_sched_init(void);
-extern int mvme147_hwclk (int, struct rtc_time *);
 extern void mvme147_reset (void);
 
 
-static int bcd2int (unsigned char b);
-
-
 int __init mvme147_parse_bootinfo(const struct bi_record *bi)
 {
 	uint16_t tag = be16_to_cpu(bi->tag);
@@ -80,7 +77,6 @@ void __init config_mvme147(void)
 {
 	mach_sched_init		= mvme147_sched_init;
 	mach_init_IRQ		= mvme147_init_IRQ;
-	mach_hwclk		= mvme147_hwclk;
 	mach_reset		= mvme147_reset;
 	mach_get_model		= mvme147_get_model;
 
@@ -89,6 +85,28 @@ void __init config_mvme147(void)
 		vme_brdtype = VME_TYPE_MVME147;
 }
 
+static struct resource m48t59_rsrc[] = {
+	DEFINE_RES_MEM(MVME147_RTC_BASE, 0x800),
+};
+
+static struct m48t59_plat_data m48t59_data = {
+	.type = M48T59RTC_TYPE_M48T02,
+	.yy_offset = 70,
+};
+
+static int __init mvme147_platform_init(void)
+{
+	if (!MACH_IS_MVME147)
+		return 0;
+
+	platform_device_register_resndata(NULL, "rtc-m48t59", -1,
+					  m48t59_rsrc, ARRAY_SIZE(m48t59_rsrc),
+					  &m48t59_data, sizeof(m48t59_data));
+	return 0;
+}
+
+arch_initcall(mvme147_platform_init);
+
 static u64 mvme147_read_clk(struct clocksource *cs);
 
 static struct clocksource mvme147_clk = {
@@ -162,31 +180,6 @@ static u64 mvme147_read_clk(struct clocksource *cs)
 	return ticks;
 }
 
-static int bcd2int (unsigned char b)
-{
-	return ((b>>4)*10 + (b&15));
-}
-
-int mvme147_hwclk(int op, struct rtc_time *t)
-{
-	if (!op) {
-		m147_rtc->ctrl = RTC_READ;
-		t->tm_year = bcd2int (m147_rtc->bcd_year);
-		t->tm_mon  = bcd2int(m147_rtc->bcd_mth) - 1;
-		t->tm_mday = bcd2int (m147_rtc->bcd_dom);
-		t->tm_hour = bcd2int (m147_rtc->bcd_hr);
-		t->tm_min  = bcd2int (m147_rtc->bcd_min);
-		t->tm_sec  = bcd2int (m147_rtc->bcd_sec);
-		m147_rtc->ctrl = 0;
-		if (t->tm_year < 70)
-			t->tm_year += 100;
-	} else {
-		/* FIXME Setting the time is not yet supported */
-		return -EOPNOTSUPP;
-	}
-	return 0;
-}
-
 static void scc_delay(void)
 {
 	__asm__ __volatile__ ("nop; nop;");
diff --git a/arch/m68k/mvme16x/Makefile b/arch/m68k/mvme16x/Makefile
index a8a368c2cbea..02f9e4ad8209 100644
--- a/arch/m68k/mvme16x/Makefile
+++ b/arch/m68k/mvme16x/Makefile
@@ -3,4 +3,4 @@
 # Makefile for Linux arch/m68k/mvme16x source directory
 #
 
-obj-y		:= config.o rtc.o
+obj-y		:= config.o
diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index d1fbd1704d65..99768fe8da73 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -21,9 +21,10 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/major.h>
-#include <linux/rtc.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc/m48t59.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-vme.h>
@@ -39,16 +40,10 @@
 
 extern t_bdid mvme_bdid;
 
-static MK48T08ptr_t volatile rtc = (MK48T08ptr_t)MVME_RTC_BASE;
-
 static void mvme16x_get_model(char *model);
 extern void mvme16x_sched_init(void);
-extern int mvme16x_hwclk (int, struct rtc_time *);
 extern void mvme16x_reset (void);
 
-int bcd2int (unsigned char b);
-
-
 unsigned short mvme16x_config;
 EXPORT_SYMBOL(mvme16x_config);
 
@@ -268,7 +263,6 @@ void __init config_mvme16x(void)
 
     mach_sched_init      = mvme16x_sched_init;
     mach_init_IRQ        = mvme16x_init_IRQ;
-    mach_hwclk           = mvme16x_hwclk;
     mach_reset		 = mvme16x_reset;
     mach_get_model       = mvme16x_get_model;
     mach_get_hardware_list = mvme16x_get_hardware_list;
@@ -312,6 +306,28 @@ void __init config_mvme16x(void)
     }
 }
 
+static struct resource m48t59_rsrc[] = {
+	DEFINE_RES_MEM(MVME_RTC_BASE, 0x2000),
+};
+
+static struct m48t59_plat_data m48t59_data = {
+	.type = M48T59RTC_TYPE_M48T08,
+	.yy_offset = 70,
+};
+
+static int __init mvme16x_platform_init(void)
+{
+	if (!MACH_IS_MVME16x)
+		return 0;
+
+	platform_device_register_resndata(NULL, "rtc-m48t59", -1,
+					  m48t59_rsrc, ARRAY_SIZE(m48t59_rsrc),
+					  &m48t59_data, sizeof(m48t59_data));
+	return 0;
+}
+
+arch_initcall(mvme16x_platform_init);
+
 static irqreturn_t mvme16x_abort_int (int irq, void *dev_id)
 {
 	unsigned long *new = (unsigned long *)vectors;
@@ -426,28 +442,3 @@ static u64 mvme16x_read_clk(struct clocksource *cs)
 
 	return ticks;
 }
-
-int bcd2int (unsigned char b)
-{
-	return ((b>>4)*10 + (b&15));
-}
-
-int mvme16x_hwclk(int op, struct rtc_time *t)
-{
-	if (!op) {
-		rtc->ctrl = RTC_READ;
-		t->tm_year = bcd2int (rtc->bcd_year);
-		t->tm_mon  = bcd2int(rtc->bcd_mth) - 1;
-		t->tm_mday = bcd2int (rtc->bcd_dom);
-		t->tm_hour = bcd2int (rtc->bcd_hr);
-		t->tm_min  = bcd2int (rtc->bcd_min);
-		t->tm_sec  = bcd2int (rtc->bcd_sec);
-		rtc->ctrl = 0;
-		if (t->tm_year < 70)
-			t->tm_year += 100;
-	} else {
-		/* FIXME Setting the time is not yet supported */
-		return -EOPNOTSUPP;
-	}
-	return 0;
-}
diff --git a/arch/m68k/mvme16x/rtc.c b/arch/m68k/mvme16x/rtc.c
deleted file mode 100644
index ccbaae1125e6..000000000000
--- a/arch/m68k/mvme16x/rtc.c
+++ /dev/null
@@ -1,165 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *	Real Time Clock interface for Linux on the MVME16x
- *
- * Based on the PC driver by Paul Gortmaker.
- */
-
-#define RTC_VERSION		"1.00"
-
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/miscdevice.h>
-#include <linux/ioport.h>
-#include <linux/capability.h>
-#include <linux/fcntl.h>
-#include <linux/init.h>
-#include <linux/poll.h>
-#include <linux/rtc.h>	/* For struct rtc_time and ioctls, etc */
-#include <linux/bcd.h>
-#include <asm/mvme16xhw.h>
-
-#include <asm/io.h>
-#include <linux/uaccess.h>
-#include <asm/setup.h>
-
-/*
- *	We sponge a minor off of the misc major. No need slurping
- *	up another valuable major dev number for this. If you add
- *	an ioctl, make sure you don't conflict with SPARC's RTC
- *	ioctls.
- */
-
-static const unsigned char days_in_mo[] =
-{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
-
-static atomic_t rtc_ready = ATOMIC_INIT(1);
-
-static long rtc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	volatile MK48T08ptr_t rtc = (MK48T08ptr_t)MVME_RTC_BASE;
-	unsigned long flags;
-	struct rtc_time wtime;
-	void __user *argp = (void __user *)arg;
-
-	switch (cmd) {
-	case RTC_RD_TIME:	/* Read the time/date from RTC	*/
-	{
-		local_irq_save(flags);
-		/* Ensure clock and real-time-mode-register are accessible */
-		rtc->ctrl = RTC_READ;
-		memset(&wtime, 0, sizeof(struct rtc_time));
-		wtime.tm_sec =  bcd2bin(rtc->bcd_sec);
-		wtime.tm_min =  bcd2bin(rtc->bcd_min);
-		wtime.tm_hour = bcd2bin(rtc->bcd_hr);
-		wtime.tm_mday =  bcd2bin(rtc->bcd_dom);
-		wtime.tm_mon =  bcd2bin(rtc->bcd_mth)-1;
-		wtime.tm_year = bcd2bin(rtc->bcd_year);
-		if (wtime.tm_year < 70)
-			wtime.tm_year += 100;
-		wtime.tm_wday = bcd2bin(rtc->bcd_dow)-1;
-		rtc->ctrl = 0;
-		local_irq_restore(flags);
-		return copy_to_user(argp, &wtime, sizeof wtime) ?
-								-EFAULT : 0;
-	}
-	case RTC_SET_TIME:	/* Set the RTC */
-	{
-		struct rtc_time rtc_tm;
-		unsigned char mon, day, hrs, min, sec, leap_yr;
-		unsigned int yrs;
-
-		if (!capable(CAP_SYS_ADMIN))
-			return -EACCES;
-
-		if (copy_from_user(&rtc_tm, argp, sizeof(struct rtc_time)))
-			return -EFAULT;
-
-		yrs = rtc_tm.tm_year;
-		if (yrs < 1900)
-			yrs += 1900;
-		mon = rtc_tm.tm_mon + 1;   /* tm_mon starts at zero */
-		day = rtc_tm.tm_mday;
-		hrs = rtc_tm.tm_hour;
-		min = rtc_tm.tm_min;
-		sec = rtc_tm.tm_sec;
-
-		leap_yr = ((!(yrs % 4) && (yrs % 100)) || !(yrs % 400));
-
-		if ((mon > 12) || (day == 0))
-			return -EINVAL;
-
-		if (day > (days_in_mo[mon] + ((mon == 2) && leap_yr)))
-			return -EINVAL;
-
-		if ((hrs >= 24) || (min >= 60) || (sec >= 60))
-			return -EINVAL;
-
-		if (yrs >= 2070)
-			return -EINVAL;
-
-		local_irq_save(flags);
-		rtc->ctrl     = RTC_WRITE;
-
-		rtc->bcd_sec  = bin2bcd(sec);
-		rtc->bcd_min  = bin2bcd(min);
-		rtc->bcd_hr   = bin2bcd(hrs);
-		rtc->bcd_dom  = bin2bcd(day);
-		rtc->bcd_mth  = bin2bcd(mon);
-		rtc->bcd_year = bin2bcd(yrs%100);
-
-		rtc->ctrl     = 0;
-		local_irq_restore(flags);
-		return 0;
-	}
-	default:
-		return -EINVAL;
-	}
-}
-
-/*
- * We enforce only one user at a time here with the open/close.
- */
-static int rtc_open(struct inode *inode, struct file *file)
-{
-	if( !atomic_dec_and_test(&rtc_ready) )
-	{
-		atomic_inc( &rtc_ready );
-		return -EBUSY;
-	}
-	return 0;
-}
-
-static int rtc_release(struct inode *inode, struct file *file)
-{
-	atomic_inc( &rtc_ready );
-	return 0;
-}
-
-/*
- *	The various file operations we support.
- */
-
-static const struct file_operations rtc_fops = {
-	.unlocked_ioctl	= rtc_ioctl,
-	.open		= rtc_open,
-	.release	= rtc_release,
-	.llseek		= noop_llseek,
-};
-
-static struct miscdevice rtc_dev=
-{
-	.minor =	RTC_MINOR,
-	.name =		"rtc",
-	.fops =		&rtc_fops
-};
-
-static int __init rtc_MK48T08_init(void)
-{
-	if (!MACH_IS_MVME16x)
-		return -ENODEV;
-
-	pr_info("MK48T08 Real Time Clock Driver v%s\n", RTC_VERSION);
-	return misc_register(&rtc_dev);
-}
-device_initcall(rtc_MK48T08_init);
-- 
2.44.2


