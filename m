Return-Path: <linux-rtc+bounces-4854-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF1B5185C
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 15:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6E364E269F
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 13:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF43272805;
	Wed, 10 Sep 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="XjIK+ZlH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E47321B195
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512394; cv=none; b=mJXtoFcWRfdIi8FpYMgry6Whq4+tGVVMujN0g+CvGShtLiLQlDxc7PuQTfi6PGqIDewui5L3FomRuo0aVQMoApgocF1njRaQ03pEaFQXXHBxU7zBALKLK6axUZFWK8373SokH/sNihNXEN6LGSnCj3PYoHEgdv5f3HWuitqrFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512394; c=relaxed/simple;
	bh=dnPKUf1tRxvkBGYpB6SRXfAi+F5vNbqKi4NNlW6M/lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tldtmmghJ55+ksCTu5d4qcEGFHL46aZ5v+K1WGXIXaGXCGmBN5JBa9eD0kEuvVffzvAHoKi1SPzGKbl9uiSCLMDHSmS0S8R6S1R/NYzKqowAxTZG4DO5wd5HDG+8NnSspen5BD9fW1SfNRGhI34OnZTkrm4LpMa6lvsF2Ram0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=XjIK+ZlH; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 2D61E101403B
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 19:23:09 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 2D61E101403B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757512389; bh=dnPKUf1tRxvkBGYpB6SRXfAi+F5vNbqKi4NNlW6M/lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjIK+ZlHoDXbiI4hLn3YcSmd9xeqx63jB8qwLx1FrpKR5XNiKKMItEZ6Lv7B258BS
	 YkEjairChh1E7mBP4Xr8h+s8VxRLDDlk0kqfr1OZ46nLgCfmZoTasBYnCBEBrpoQSO
	 HstKF4rGWbYQv6Vc3JJuf54Z3u8Lp5CBHrVpXW2Q=
Received: (qmail 7774 invoked by uid 510); 10 Sep 2025 19:23:09 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.978493 secs; 10 Sep 2025 19:23:09 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 10 Sep 2025 19:23:06 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id A90723414DD;
	Wed, 10 Sep 2025 19:23:05 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 8C9D61E813E1;
	Wed, 10 Sep 2025 19:23:05 +0530 (IST)
Date: Wed, 10 Sep 2025 19:23:00 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v2 2/6] rtc: m41t93: add device tree support
Message-ID: <3ec83583754d7db70ded369efd9818e1b65670ef.1757510157.git.akhilesh@ee.iitb.ac.in>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>

Add device tree support for m41t93 rtc by adding of_match_table.
Define compatible string - "st,m41t93" which can be used to instantiate
this rtc device via DT node.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 9444cb5f5190..4e803ff0ce49 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -191,9 +191,16 @@ static int m41t93_probe(struct spi_device *spi)
 	return 0;
 }
 
+static const struct of_device_id m41t93_dt_match[] = {
+	{ .compatible = "st,m41t93" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, m41t93_dt_match);
+
 static struct spi_driver m41t93_driver = {
 	.driver = {
 		.name	= "rtc-m41t93",
+		.of_match_table = m41t93_dt_match,
 	},
 	.probe	= m41t93_probe,
 };
-- 
2.34.1


