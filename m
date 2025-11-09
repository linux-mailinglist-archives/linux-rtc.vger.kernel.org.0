Return-Path: <linux-rtc+bounces-5302-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D59C438F3
	for <lists+linux-rtc@lfdr.de>; Sun, 09 Nov 2025 06:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD5014E1065
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Nov 2025 05:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2D31F2B88;
	Sun,  9 Nov 2025 05:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="e/XE+huK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DB219995E
	for <linux-rtc@vger.kernel.org>; Sun,  9 Nov 2025 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762667363; cv=none; b=KA/kI6bwXXppNqgpgSjjNjl/+bhsAVUb5x+CXwSBSQGntAR+TA/5XbIFmsdLxMuO+fk8qgp0Vw3H+hBr6tpuEy1PfcJnZE6OSr7QwQQa8x3+09u048tU/8+tfxtRhvMhJ0cs3FeftY2RxLY1lN/RftStYuwNmYUevF+KQYd93Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762667363; c=relaxed/simple;
	bh=0Dduvwaj9EIu/iZq7xOO9Ljr/Gn7z49+hz14+MCPdMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2gjy9daJsUUFXFU/VWRExl1C37Xh4ExoynG5N7PF1I/GUroLLVC6qpIfGb35+08/DP6p1XWhrGL7BIJAtasTJsNWzABBF8evp00s7EY8uV6MhQQljbo4j3jjqemDL73y5ytMrl5+xgKRF/qbA63c57ZDYkAmdIc7MdsHYrXoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=e/XE+huK; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id A7F71104C1DC
	for <linux-rtc@vger.kernel.org>; Sun,  9 Nov 2025 11:19:07 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in A7F71104C1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1762667347; bh=0Dduvwaj9EIu/iZq7xOO9Ljr/Gn7z49+hz14+MCPdMo=;
	h=Date:From:To:Cc:Subject:From;
	b=e/XE+huK3Sb4k7QFZrxT4pGgEq7qJwRqyC9PNIkiz6zxeWDM2OOQokG8QaHZJM07z
	 Pb5S/1EjK6GDj6EVBxRjl3pRvuDtPmK8TthE+NAr83EZxpf+8DEkN5WcmWm1/mhaeQ
	 FHrFAVXk0RPedYlaV7Wu++XRyUOlFs8seVhSz0N0=
Received: (qmail 24224 invoked by uid 510); 9 Nov 2025 11:19:07 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 1.838648 secs; 09 Nov 2025 11:19:07 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 9 Nov 2025 11:19:05 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 4FB03360035;
	Sun,  9 Nov 2025 11:19:05 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id DDADC1E814C9;
	Sun,  9 Nov 2025 11:19:04 +0530 (IST)
Date: Sun, 9 Nov 2025 11:18:59 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, ddaney@caviumnetworks.com,
	david.daney@cavium.com, pombredanne@nexb.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: [PATCH] rtc: isl12026: Add id_table
Message-ID: <2025119-54859-2010914@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add i2c id_table for isl12026 rtc.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
tested by instantiating isl12026 device as
echo "isl12026 0x6f" > new_device
Tested rtc on TI am62x sk board on i2c-2 using rtctest.
I am currently implementing alarm support for isl12026
this patch helps to instantiate device runtime without DT
for faster testing without reboots.

 drivers/rtc/rtc-isl12026.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 2aabb9151d4c..45a2c9f676c5 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -484,6 +484,12 @@ static const struct of_device_id isl12026_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, isl12026_dt_match);
 
+static const struct i2c_device_id isl12026_id[] = {
+	{ "isl12026" },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, isl12026_id);
+
 static struct i2c_driver isl12026_driver = {
 	.driver		= {
 		.name	= "rtc-isl12026",
@@ -491,6 +497,7 @@ static struct i2c_driver isl12026_driver = {
 	},
 	.probe		= isl12026_probe,
 	.remove		= isl12026_remove,
+	.id_table	= isl12026_id,
 };
 
 module_i2c_driver(isl12026_driver);
-- 
2.34.1


