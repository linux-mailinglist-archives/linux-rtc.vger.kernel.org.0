Return-Path: <linux-rtc+bounces-3274-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F56A45F38
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2025 13:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 118D07ADFB5
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2025 12:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6012D221F3C;
	Wed, 26 Feb 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="USc2OQBm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC09221DA7;
	Wed, 26 Feb 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572827; cv=none; b=BiJ3iLuMd3svn5Qc0PoepcYlSo6sqtKS7EjZqH7Gpn8Ny15S34P7uVbT6pzSv2Frz8t5Scw5tjEk5KyLCZqOydwratvt7kU09gv7g+d508YLG5sWt4nMYdhD/YkmOfftDZHzr4t6kn8TO+laPcKSbetGEoQ/4D9TcSpHdsNqFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572827; c=relaxed/simple;
	bh=vMbVgXuk9HmZXPgEYqNY35eo3taAR49F2PRIL20ghAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxY9IP0Ye7bUcdbXeam9l6TBmgBxfly3RhraBP2cUqb35vXskU/f0YdDITPbFxol4t5XYZRwLe3dm29w5qpxcBez+/WcbWenc1Ws/6kiU0OJqm51eKIICOzGoTL1aPIiNrvxcuzMKnjcPlkwQH1Ug5iqdgphZHjeBDKx75blhK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=USc2OQBm; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eYvstlbF5OwC2qe4RHz/86oxp99siT+rbZMDS0NJQxM=; b=USc2OQBmgTrwv5C9Qjsqmeu/oH
	C3VRIVYodwtzQolezyBKdMXFtebBw34XZ5xGdvzdxkO/GWnCH2DKLxpKvorEQkU8wXqrRCqtv150y
	9beuOl8xsajF2YA67HgLfysBDXsIn4GWie2+3xhRZ9ZxeKP4vcXxk2ohJ+5DHnDSHpEaIGPByk8Wt
	oBvYZt8mn4m4/bEz8tB6IDuGxoutLhM+e97XsQTJ5m3Vnf0pLA7b34w1RAAj0EQ5xAj6wtzlZe0h0
	1M6u5I3yVEKxDLI36mZMTvRkHYa4lysBYktSpOuny5xrglfFiOFQCjr9ecFa4N2RRMpmjsDRSQooZ
	G6Wk5ahQ==;
Received: from [179.125.94.240] (helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tnGV7-000xB7-10; Wed, 26 Feb 2025 13:27:03 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 26 Feb 2025 09:26:28 -0300
Subject: [PATCH 2/2] m68k: rtc: dp8570a: make it a proper RTC class driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-m68k-rtc-v1-2-404641ec62e6@igalia.com>
References: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com>
In-Reply-To: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
X-Mailer: b4 0.14.2

In the past, each rtc implementation had to rewrite the same ioctls in
order to be compatible. But since 2006, a common RTC interface has been
introduced. Use it for the last user of RTC_MINOR.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 arch/m68k/bvme6000/rtc.c | 91 ++++++++----------------------------------------
 1 file changed, 15 insertions(+), 76 deletions(-)

diff --git a/arch/m68k/bvme6000/rtc.c b/arch/m68k/bvme6000/rtc.c
index a84996bd1491da3c1d9bd8dae7e1a92805c735e0..7e7b40863e5eb3423c53b44c2d63c8806e7a1bbe 100644
--- a/arch/m68k/bvme6000/rtc.c
+++ b/arch/m68k/bvme6000/rtc.c
@@ -16,7 +16,8 @@
 #include <linux/init.h>
 #include <linux/poll.h>
 #include <linux/module.h>
-#include <linux/rtc.h>	/* For struct rtc_time and ioctls, etc */
+#include <linux/rtc.h>	/* For struct rtc_time and etc */
+#include <linux/platform_device.h>
 #include <linux/bcd.h>
 #include <asm/bvme6000hw.h>
 
@@ -24,19 +25,10 @@
 #include <linux/uaccess.h>
 #include <asm/setup.h>
 
-/*
- *	We sponge a minor off of the misc major. No need slurping
- *	up another valuable major dev number for this. If you add
- *	an ioctl, make sure you don't conflict with SPARC's RTC
- *	ioctls.
- */
-
 static unsigned char days_in_mo[] =
 {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
 
-static atomic_t rtc_status = ATOMIC_INIT(1);
-
-static int dp8570a_rtc_read_time(struct rtc_time *wtime)
+static int dp8570a_rtc_read_time(struct device *dev, struct rtc_time *wtime)
 {
 	volatile RtcPtr_t rtc = (RtcPtr_t)BVME_RTC_BASE;
 	unsigned char msr;
@@ -63,7 +55,7 @@ static int dp8570a_rtc_read_time(struct rtc_time *wtime)
 	return 0;
 }
 
-static int dp8570a_rtc_set_time(struct rtc_time *rtc_tm)
+static int dp8570a_rtc_set_time(struct device *dev, struct rtc_time *rtc_tm)
 {
 	volatile RtcPtr_t rtc = (RtcPtr_t)BVME_RTC_BASE;
 	unsigned char msr;
@@ -117,77 +109,24 @@ static int dp8570a_rtc_set_time(struct rtc_time *rtc_tm)
 	return 0;
 }
 
-static long rtc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	void __user *argp = (void __user *)arg;
-
-	switch (cmd) {
-	case RTC_RD_TIME:	/* Read the time/date from RTC	*/
-	{
-		struct rtc_time wtime;
-
-		dp8570a_rtc_read_time(&wtime);
-		return copy_to_user(argp, &wtime, sizeof wtime) ?
-								-EFAULT : 0;
-	}
-	case RTC_SET_TIME:	/* Set the RTC */
-	{
-		struct rtc_time rtc_tm;
-
-		if (!capable(CAP_SYS_ADMIN))
-			return -EACCES;
-
-		if (copy_from_user(&rtc_tm, argp, sizeof(struct rtc_time)))
-			return -EFAULT;
-
-		return dp8570a_rtc_set_time(&rtc_tm);
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
-	if (!atomic_dec_and_test(&rtc_status)) {
-		atomic_inc(&rtc_status);
-		return -EBUSY;
-	}
-	return 0;
-}
-
-static int rtc_release(struct inode *inode, struct file *file)
-{
-	atomic_inc(&rtc_status);
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
-static struct miscdevice rtc_dev = {
-	.minor =	RTC_MINOR,
-	.name =		"rtc",
-	.fops =		&rtc_fops
+static const struct rtc_class_ops dp8570a_rtc_ops = {
+	.read_time	= dp8570a_rtc_read_time,
+	.set_time	= dp8570a_rtc_set_time,
 };
 
 static int __init rtc_DP8570A_init(void)
 {
+	struct platform_device *pdev;
+
 	if (!MACH_IS_BVME6000)
 		return -ENODEV;
 
 	pr_info("DP8570A Real Time Clock Driver v%s\n", RTC_VERSION);
-	return misc_register(&rtc_dev);
+
+	pdev = platform_device_register_data(NULL, "rtc-generic", -1,
+					     &dp8570a_rtc_ops,
+					     sizeof(dp8570a_rtc_ops));
+
+	return PTR_ERR_OR_ZERO(pdev);
 }
 module_init(rtc_DP8570A_init);

-- 
2.47.2


