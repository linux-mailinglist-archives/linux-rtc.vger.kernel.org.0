Return-Path: <linux-rtc+bounces-4997-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC2B8CAEB
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 17:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F201B2310F
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 15:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32C21519B9;
	Sat, 20 Sep 2025 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="veM8RU55"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4F2080C0
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758380520; cv=none; b=hoI6Mcb0Y3npTFYLE1sYqSTyrgEPyfbaLjyrXfOOcAuq6UERweSTTk2/JwzOLwraicacQ9Zo+jUTgWagB3pMYFAqxwzVZzavqG+BfZTK9RFHfmr+K5YPcSzRhyYnpuOKo8HORt8QW81k9fMRjr7v7FGuwqpjuV59qyTbqEab8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758380520; c=relaxed/simple;
	bh=dnPKUf1tRxvkBGYpB6SRXfAi+F5vNbqKi4NNlW6M/lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulsTQJTnlk0O5wTKYeJhotb1y28/gjP9xKOIW71fcMg2quNEmgWHkNb65snTHLvzFiE/8CzWyuN/NNkbpxIf2ovrJ0nx30Ms5l14qdmA1ijPzqZ5G7Cks+WDoKcbzzccrcpim/ZDumZi49q2L+TLdQ1MUEYS8NuHnRcRdMEvepE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=veM8RU55; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 674E41080221
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 20:31:56 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 674E41080221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1758380516; bh=dnPKUf1tRxvkBGYpB6SRXfAi+F5vNbqKi4NNlW6M/lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=veM8RU55ZRDLpaDR/5/GpPCp/ljJ4hjul0tqgClvVe06gWAhSIdOrGRb4uiBzCBgu
	 cA8CtfHo3J873ga58Wdulb4zQMfS6YwBV1RDsoA1qq3x0+c+HrzFizFNkjtfl9Y/Et
	 wGJ68u9phLE14OlxCIvLa+06gWOdRIEqaam81wg0=
Received: (qmail 19219 invoked by uid 510); 20 Sep 2025 20:31:56 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.401497 secs; 20 Sep 2025 20:31:56 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 20 Sep 2025 20:31:52 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 586403414DE;
	Sat, 20 Sep 2025 20:31:52 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 4051D1E814BD;
	Sat, 20 Sep 2025 20:31:52 +0530 (IST)
Date: Sat, 20 Sep 2025 20:31:47 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v3 2/6] rtc: m41t93: add device tree support
Message-ID: <060ef5c5adaa444d2c623aa8ce4c540fa19d0f95.1758379856.git.akhilesh@ee.iitb.ac.in>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>

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


