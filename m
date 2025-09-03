Return-Path: <linux-rtc+bounces-4806-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954DB4239E
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521B43A5456
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87F130FC33;
	Wed,  3 Sep 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="TAYGuZ76"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17272FC887
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909654; cv=none; b=iNWL6WWV+OLbRNyT2O6wl6sMT9qxZxDZDP9zW1pP4oWfURReIegDoNYPekQS2oygZK6DC7lb94JH6jsI85YQ11ItTZlcW35DB0rXGuIaWyd8BoxuVsyM9giE7fTu0d8M8BduO2zKbHFeKll3pWF1bIWGz6dZgMrFkHx/vspbdlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909654; c=relaxed/simple;
	bh=z7gG2wi7trHnM1dLuhDkxffPABy5/ujoFUZv+6zQlUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxiGQng7d4R/boVoolXbxCKBXjT4eVoRgzPF3NDS7zA+eIufZhsa+P6r7XiT8urmQ9FNnqtNR8C+cxK+9Lb4BOIp5OdIUOqIpTHT2RqTU44il4AyQnmpPZseQ/rbeH34pSkfmR28POrtu5FE7OqgSKMIc3gPn/+n2tIw9ObhLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=TAYGuZ76; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 3709C1015C6C
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:57:30 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 3709C1015C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909650; bh=z7gG2wi7trHnM1dLuhDkxffPABy5/ujoFUZv+6zQlUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAYGuZ76CQwdYOiX64Dd9sjvOopAgKIqedT9xGMo9rs4g4zIZ+Cr+XAhkHEXRVXd4
	 tDrMQTqNSR9xcN0v5QdGTMIh5e9hLKoUiTk+4emMgUglM3TzFwG+TouOkdNSWv7HuX
	 +qG8c929K4n1lagpEUXxPZauR5GHbdwkcYsi1qfg=
Received: (qmail 32748 invoked by uid 510); 3 Sep 2025 19:57:30 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.404273 secs; 03 Sep 2025 19:57:30 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 3 Sep 2025 19:57:26 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 2D0293414ED;
	Wed,  3 Sep 2025 19:57:26 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 0E8181E8143E;
	Wed,  3 Sep 2025 19:57:26 +0530 (IST)
Date: Wed, 3 Sep 2025 19:57:21 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 5/7] rtc: m41t93: fix device connection/detection logic
 during probe
Message-ID: <c3deec9e679cd4e4a49a2cc1cba340c552faefdc.1756908788.git.akhilesh@ee.iitb.ac.in>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>

Fix the incorrect assumption about WDAY register (0x4) bits 3 to 7
being 0 after initial power-on to test response from device during probe

Do not expect these bits to be 0 after power on as datasheet does not
explicitly mention these power on defaults but recommends software to
clear these bits during operation. Refer section 3.15 for initial
power-on default bits.

Fix the random probe failures after power on by removing this condition
check. Add alternate response check logic which performs write, read,
compare check on device SRAM register to check device connection.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 8cc179e08a4a..902797070246 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -30,6 +30,7 @@
 #define M41T93_BIT_A1IE                 BIT(7)
 #define M41T93_BIT_ABE			BIT(5)
 #define M41T93_FLAG_AF1                 BIT(6)
+#define M41T93_SRAM_BASE		0x19
 
 
 #define M41T93_REG_ALM_HOUR_HT		0xc
@@ -290,17 +291,25 @@ static int m41t93_probe(struct spi_device *spi)
 		return PTR_ERR(m41t93->regmap);
 	}
 
-	ret = regmap_read(m41t93->regmap, M41T93_REG_WDAY, &res);
-	if (ret < 0) {
+	ret = regmap_write(m41t93->regmap, M41T93_SRAM_BASE, 0xA5);
+	if (ret) {
 		dev_err(&spi->dev, "IO error\n");
 		return -EIO;
 	}
 
-	if (res < 0 || (res & 0xf8) != 0) {
-		dev_err(&spi->dev, "not found 0x%x.\n", res);
+	ret = regmap_read(m41t93->regmap, M41T93_SRAM_BASE, &res);
+	if (ret) {
+		dev_err(&spi->dev, "IO error\n");
+		return -EIO;
+	}
+
+	if (res != 0xA5) {
+		dev_err(&spi->dev, "No valid response from device 0x%x.\n", res);
 		return -ENODEV;
 	}
 
+	dev_notice(&spi->dev, "m41t93 device response success\n");
+
 	spi_set_drvdata(spi, m41t93);
 
 	m41t93->rtc = devm_rtc_device_register(&spi->dev, m41t93_driver.driver.name,
-- 
2.34.1


