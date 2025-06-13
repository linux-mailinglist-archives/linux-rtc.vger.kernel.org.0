Return-Path: <linux-rtc+bounces-4295-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F95AD831A
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Jun 2025 08:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B543B3C5F
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Jun 2025 06:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC09B24C076;
	Fri, 13 Jun 2025 06:18:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393D12F4311;
	Fri, 13 Jun 2025 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749795481; cv=none; b=itsA9xUWcPZgcfimXVyPfYTym/ibN+admw+8/Zx6gJpQCdc5t/jXzkHFaU4CnNhblwFxrEJqd56REUCyxQS6NcH5v52pi2/vupPjsu/qkG+WErKmgY+1OBfVxu0hADuNW1HP8qxDUP3wpbiDidT4jFxaQEYhOrHZw4jGq3fcuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749795481; c=relaxed/simple;
	bh=oheDI8JC5+WeFWutQu/7h3O+eZxBZBLDyqEHka06knw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hC0ms0H9mzVSZoCtzTLTFP0ADJwa4j2YG+j22M2iJGZFpsP3rRAhc8lY3w4tLh5uNaPk/n7IqgETPxe6MLFh9z5IcdErWuAra60bVcbovWvZPtcMiOSA0oC4FTJgJ88KLstPVUPW9xKx9YNz9A8pJ3mzBVUWvSWtv6otIIZivbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8Bx63GOwktoVIoVAQ--.51785S3;
	Fri, 13 Jun 2025 14:17:50 +0800 (CST)
Received: from ubuntu.. (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowMCx_caLwktoyM0YAQ--.14897S2;
	Fri, 13 Jun 2025 14:17:47 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	lixuefeng@loongson.cn,
	chenhuacai@loongson.cn,
	gaojuxin@loongson.cn
Subject: [PATCH v2] rtc: efi: Defer driver initialization to prioritize more capable RTCs
Date: Fri, 13 Jun 2025 14:17:47 +0800
Message-ID: <20250613061747.4117470-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx_caLwktoyM0YAQ--.14897S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEMEmhLWGoGWQABsR
X-Coremail-Antispam: 1Uk129KBj93XoWxWF1xGr4DGF4rJrW3XFWrZwc_yoW5XFyUpa
	y3AFy5KF10kayaga97JrsrCFy5u3Z3J340gr1xGw1Svwn8Arnrtrs3JFWjv3WUGrWxG3Wa
	yw1YvF13uF4DCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
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
Changes in v2:
- Fixed a section mismatch warning reported by the kernel test robot.
  The efi_rtc_probe function was previously marked __init, which
  caused a conflict when efi_rtc_driver (in .data) directly
  referenced it after its initialization was deferred. Removed the
  __init attribute from efi_rtc_probe to resolve this.
---
 drivers/rtc/rtc-efi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index fa8bf82df948..c941f52ea3fe 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -254,7 +254,7 @@ static const struct rtc_class_ops efi_rtc_ops = {
 	.proc		= efi_procfs,
 };
 
-static int __init efi_rtc_probe(struct platform_device *dev)
+static int efi_rtc_probe(struct platform_device *dev)
 {
 	struct rtc_device *rtc;
 	efi_time_t eft;
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


