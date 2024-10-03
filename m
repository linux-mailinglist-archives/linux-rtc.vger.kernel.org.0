Return-Path: <linux-rtc+bounces-2093-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE098E8D3
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 05:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CE701C23DC6
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 03:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2943D288D1;
	Thu,  3 Oct 2024 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EILxwcW4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C6433A0;
	Thu,  3 Oct 2024 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727926082; cv=none; b=r9Gpg8TqUEKmxOqFkxHaO7DUjgFQ3LWwmaNWwdV7++uBufhjf0aC13APOxYL6PDu5jito+Ipi6SpSPDRti/tHdxXZyvcqqtgZlWZ0VeksijcUSZVDJTn79eyCOpZYhy4VV7ylRkj3MeZt1moPoAcVUOMua+aw6+vC9TKIrtEavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727926082; c=relaxed/simple;
	bh=czarx6UH1A45CYuxIfSlJVkhLNLHETn+68QDlpaQz/U=;
	h=To:Cc:Message-Id:In-Reply-To:References:From:Subject:Date; b=ttCJ/3IxlAnCi+TrrtPgahPPn7ODHj/NqnSOHkRXzHBp9jhjYrqOIMVCReS0o0YonCiKvjmYCXIKgPf0LuqvSA5aTE2wyFZlg5U5D7e7go4blvSy/peno/mlVODr33olqy+iYgUdz7E8w/cabai+5blwOUHdofme6Ph+7OuVK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EILxwcW4; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D278B1140226;
	Wed,  2 Oct 2024 23:27:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 02 Oct 2024 23:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727926078; x=
	1728012478; bh=w7qM2DDRQfQ8tCnmGl9Vw2JjIbzdVjsXvGRYulWXyfk=; b=E
	ILxwcW4fc3oaiwBStGiF21OxXLZ2tfdP+KzA1m8zWes+jc+zpalMhwelLfpHJL//
	x0Cq4N75iYd0m4GHxTrQZ0OdtJnfbkPQIW06ldK8PVweiJTaEoUa6YLTp+ligWaD
	lWeU+6pNG03V/ItdOXfHtsUG8tT/JDsJr1LFCM8AZVUkoL+opxgbIsoRJtfThATM
	PNga5DKf97xWuHj9VeAg3hj7dEmuvl8VbsAodhJsGwWjO2okaDvGmovHVfOvicKN
	6YeA7Zbkdvirl5MizMRSdzh4UecJRAAbzL2WUK7iwIw4sKy3C0VmpezUUqP9Aw95
	Vx2WZ45R4K2/T7vtPtIXQ==
X-ME-Sender: <xms:Pg_-ZvghE8F1n777XY-EW53wNd37MdbW0kL7fzzD0yx3-30d3zSgyw>
    <xme:Pg_-ZsBiQA7nxoejPU5HPiz7m1RmyNym8Y5rXZYJ2HoGcTY3kMka8YAn1AUtlq3kX
    8SSqYvyeFSELtYcdBA>
X-ME-Received: <xmr:Pg_-ZvHjgmrZLlc9rueW6-oQcFf39QnZXHZU9b2_xsmg2ibjHsLcBeLv7SgXS5quSLMneXWOBRUX5e1o5qVVlzqfEwP8YN-nB1E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvtddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepvfevkfgjfhfhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpeevgffgtdfhhfefveeuudfgtdeugfeftedtveekieeg
    gfduleetgeegueehgeffffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgt
    phhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurh
    gvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrthes
    lhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtg
    homhdprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthht
    oheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Pg_-ZsT_lFdUZ80RRG54Jt69woDwVnRSgP4j16WBRq-TqZtBbQzzDw>
    <xmx:Pg_-ZszCLiU2-BJ2nKWOnYFLArymfAIe9viCgAsFb7mv9OHYyQgM8Q>
    <xmx:Pg_-Zi7V4tRU7Z_WBqAsusdsM1pxNK0TS5UiXt6_nOGTrxi1evH2-A>
    <xmx:Pg_-ZhyqIU3BL0kSFdhE4ncydAj0icGxrjBs8zUES0XC5By7-MXqEg>
    <xmx:Pg_-Zjn17DsIcjkBWEaZSIig1HrKKs_fpI3eyCcpvpmA8ZZ51VbNA7zB>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 23:27:55 -0400 (EDT)
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    linux-kernel@vger.kernel.org
Message-Id: <ea8b5434cdbeb5992887ac44a7c33ec753c8801c.1727925802.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1727925802.git.fthain@linux-m68k.org>
References: <cover.1727925802.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
Date: Thu, 03 Oct 2024 13:23:22 +1000
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
---
 arch/m68k/configs/multi_defconfig   |   1 +
 arch/m68k/configs/mvme147_defconfig |   1 +
 arch/m68k/configs/mvme16x_defconfig |   1 +
 arch/m68k/include/asm/mvme147hw.h   |  19 +---
 arch/m68k/include/asm/mvme16xhw.h   |  18 +--
 arch/m68k/mvme147/config.c          |  54 ++++-----
 arch/m68k/mvme16x/Makefile          |   2 +-
 arch/m68k/mvme16x/config.c          |  56 ++++------
 arch/m68k/mvme16x/rtc.c             | 165 ----------------------------
 9 files changed, 52 insertions(+), 265 deletions(-)
 delete mode 100644 arch/m68k/mvme16x/rtc.c

diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 638df8442c98..617ac93298f3 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -506,6 +506,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MSM6242=m
 CONFIG_RTC_DRV_RP5C01=m
 CONFIG_RTC_DRV_GENERIC=m
+CONFIG_RTC_DRV_M48T59=m
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 2248db426081..4a0928b3b842 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -392,6 +392,7 @@ CONFIG_UHID=m
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_NVMEM is not set
 CONFIG_RTC_DRV_GENERIC=m
+CONFIG_RTC_DRV_M48T59=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 2975b66521f6..481fb2810f1e 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -393,6 +393,7 @@ CONFIG_UHID=m
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_NVMEM is not set
 CONFIG_RTC_DRV_GENERIC=m
+CONFIG_RTC_DRV_M48T59=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
 # CONFIG_IOMMU_SUPPORT is not set
diff --git a/arch/m68k/include/asm/mvme147hw.h b/arch/m68k/include/asm/mvme147hw.h
index e28eb1c0e0bf..2b147ab1d189 100644
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
index 8b5dc07f0811..e2560c6d10b4 100644
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
@@ -35,13 +36,9 @@
 
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
@@ -79,7 +76,6 @@ void __init config_mvme147(void)
 {
 	mach_sched_init		= mvme147_sched_init;
 	mach_init_IRQ		= mvme147_init_IRQ;
-	mach_hwclk		= mvme147_hwclk;
 	mach_reset		= mvme147_reset;
 	mach_get_model		= mvme147_get_model;
 
@@ -88,6 +84,27 @@ void __init config_mvme147(void)
 		vme_brdtype = VME_TYPE_MVME147;
 }
 
+static struct resource m48t59_rsrc[] = {
+	DEFINE_RES_MEM(MVME147_RTC_BASE, 0x800),
+};
+
+static struct m48t59_plat_data m48t59_data = {
+	.type = M48T59RTC_TYPE_M48T02,
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
@@ -160,28 +177,3 @@ static u64 mvme147_read_clk(struct clocksource *cs)
 
 	return ticks;
 }
-
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
index d1fbd1704d65..cca06f75b873 100644
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
@@ -312,6 +306,27 @@ void __init config_mvme16x(void)
     }
 }
 
+static struct resource m48t59_rsrc[] = {
+	DEFINE_RES_MEM(MVME_RTC_BASE, 0x2000),
+};
+
+static struct m48t59_plat_data m48t59_data = {
+	.type = M48T59RTC_TYPE_M48T08,
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
@@ -426,28 +441,3 @@ static u64 mvme16x_read_clk(struct clocksource *cs)
 
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
2.39.5


