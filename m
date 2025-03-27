Return-Path: <linux-rtc+bounces-3656-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F99A735DB
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Mar 2025 16:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF34169CD7
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Mar 2025 15:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0266126BFA;
	Thu, 27 Mar 2025 15:43:11 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED41991BF
	for <linux-rtc@vger.kernel.org>; Thu, 27 Mar 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090191; cv=none; b=ASIixicAcpgZQa8/ZhODlhvKdbe5pXgHI2KZX+KBjjuuGBC0lcB9Ni8zo/QHmrbMhT94XmbAyG1HItbprr2dkhuT0B7JPhXEZst+jZYNtUvcmjSboHd4vEHBbqLji0ieDFd/1W1HwrJz+Iknjpx+SS74VvK6JBVdgyunGDrse+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090191; c=relaxed/simple;
	bh=9MJdlM3coeZFkA6pFM6DJcyW5HfVOzFSWssH9fzHpeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alxx9pTM8x3fGU7YhtYRNKbspkxFApviK9q/ifW4UjANl8hS6VtOedpY2Bei70nx1FQFhwt00Gkc8dm/otL86ofkrjp0XTATDJWIuxBqE8uLhH1WKcyMzgai5JyJbqL4l3iUw6p+TIuD0COtjeR5nbIA5fw1l7iVor2goRgDb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZNnx23FXQz4x1Fr
	for <linux-rtc@vger.kernel.org>; Thu, 27 Mar 2025 16:43:02 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b1ef:107c:7814:6642])
	by laurent.telenet-ops.be with cmsmtp
	id Vriv2E0065Szt1p01rivvs; Thu, 27 Mar 2025 16:42:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1txpNe-0000000Fsi7-24Kr;
	Thu, 27 Mar 2025 16:42:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1txpNe-00000006DNN-4Ayq;
	Thu, 27 Mar 2025 16:42:55 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] rtc: Rename lib_test to rtc_lib_test
Date: Thu, 27 Mar 2025 16:42:53 +0100
Message-ID: <8edd0c09fe12d1225e2b830f8a55e7c830da078b.1743090053.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compiling the RTC library functions test as a module, the module
has the non-descriptive name "lib_test.ko".  Fix this by adding the
subsystem's name as a prefix.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/rtc/Makefile                       | 2 +-
 drivers/rtc/{lib_test.c => rtc_lib_test.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/rtc/{lib_test.c => rtc_lib_test.c} (100%)

diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068c758..c0ccbbfe2739c1aa 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -15,7 +15,7 @@ rtc-core-$(CONFIG_RTC_INTF_DEV)		+= dev.o
 rtc-core-$(CONFIG_RTC_INTF_PROC)	+= proc.o
 rtc-core-$(CONFIG_RTC_INTF_SYSFS)	+= sysfs.o
 
-obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= lib_test.o
+obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= rtc_lib_test.o
 
 # Keep the list ordered.
 
diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/rtc_lib_test.c
similarity index 100%
rename from drivers/rtc/lib_test.c
rename to drivers/rtc/rtc_lib_test.c
-- 
2.43.0


