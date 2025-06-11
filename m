Return-Path: <linux-rtc+bounces-4269-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E33AD4B62
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 232893A328C
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F23E227EB2;
	Wed, 11 Jun 2025 06:20:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845C6227E87;
	Wed, 11 Jun 2025 06:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622852; cv=none; b=tWsyO1rxgE1z2qa/xkNZayXiuaWZWR50zA+Cla58ssnfBLOuqbiHQ84Af0BRv/PLF5UjFWfypTn7Bfsv2W1sWXFgjVwCM/65P35Ji6T6hU45AR6q3cgMegUz1TkGp7TMdYoWCHSs9c+mqpUU95WQ+pfR7C0aQvdEB/4+sJIvYys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622852; c=relaxed/simple;
	bh=2zd2BHcJOc7cbE0glr3lO3tCYJ6nmQeJCp+M5fYAAnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYW0Z53V4LVf5TkZC97/2yCNbBp4Y84GXEGDufvwwdIXwHj3ttz3H5a08UhUZ2EdogTvz3b9CujIYIAV4t0KLU2U5moRbC1y3blPD2XJO+PoYMO0EVeb1MKtp09B87RGwYy6cEJUuLuk/2gJy0fY6gj5+zKNJYFCmaOpFLe8jhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8BxJHAuIEloq3QTAQ--.6932S3;
	Wed, 11 Jun 2025 14:20:30 +0800 (CST)
Received: from ubuntu.. (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowMCxrhsqIEloqYsVAQ--.15055S2;
	Wed, 11 Jun 2025 14:20:28 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	lixuefeng@loongson.cn,
	chenhuacai@loongson.cn,
	gaojuxin@loongson.cn
Subject: [PATCH] rtc: efi: Defer driver initialization to prioritize more capable RTCs
Date: Wed, 11 Jun 2025 14:20:25 +0800
Message-ID: <20250611062025.3243732-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxrhsqIEloqYsVAQ--.15055S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEKEmhItWoGogACsB
X-Coremail-Antispam: 1Uk129KBj93XoW7Kry5AFy7Cr1DuF1xWrWfWFX_yoW8uF4fpa
	y3AFyYkr1v9ay3uas7JrsrCFy5u3Z3G3y09r18Jw1Svwn8Ar1qkrs7tayYv3W7Jr4xG3Wa
	yw1YvF13uFs8CwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8bTm3UU
	UUU==

The EFI GetWakeupTime call, used by efi_read_alarm() to fetch RTC
wakeup alarm information, is specified to return EFI_UNSUPPORTED on
EFI firmware v1.10 and later. This effectively means that on most
modern systems, the efi-rtc driver cannot provide working RTC alarm
functionality.

If efi-rtc registers early during boot, it might become the primary
RTC device (e.g., /dev/rtc0). This can lead to a situation where the
system appears to have an RTC, but userspace utilities cannot set or
get RTC alarms, even if other RTC hardware (like rtc-cmos, which
typically supports alarms) is present but registers later.

To address this, change the efi-rtc driver initialization from
module_init() to late_initcall(). By deferring its initialization,
we give other, potentially more capable RTC drivers (such as rtc-cmos)
a better chance to register first and become the primary RTC.

This change increases the likelihood that systems with multiple RTC
sources will use the one with the most complete feature set (including
alarms) as the primary RTC. The efi-rtc driver can still serve as a
time source or a fallback RTC if no other RTC is available or preferred.

Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
 drivers/rtc/rtc-efi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index fa8bf82df948..f97a228510f4 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -286,9 +286,20 @@ static struct platform_driver efi_rtc_driver = {
 	.driver = {
 		.name = "rtc-efi",
 	},
+	.probe = efi_rtc_probe,
 };
 
-module_platform_driver_probe(efi_rtc_driver, efi_rtc_probe);
+static int __init efi_rtc_driver_init(void)
+{
+	return platform_driver_register(&efi_rtc_driver);
+}
+late_initcall(efi_rtc_driver_init);
+
+static void __exit efi_rtc_driver_exit(void)
+{
+	platform_driver_unregister(&efi_rtc_driver);
+}
+module_exit(efi_rtc_driver_exit);
 
 MODULE_AUTHOR("dann frazier <dannf@dannf.org>");
 MODULE_LICENSE("GPL");
-- 
2.43.0


