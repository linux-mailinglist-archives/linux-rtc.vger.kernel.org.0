Return-Path: <linux-rtc+bounces-4802-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED03B4238E
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E7D5439EE
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3DC30DD3A;
	Wed,  3 Sep 2025 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="s65R17bR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C82874F8
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909547; cv=none; b=OqKNbBxZmQwK3tF8bvbjPOI0IpjIr1vevgjHLCN1Xs9U8F4Te2H/9ucIZ5tXmici+LwWZad+1WqKVD9rM6Oji3vbzQNFEsmmsevoFuVZQD6jI61Mk7kUqy7gGd3Zf0AuNwzQeKAMClXhMdaLpto5ZevT9UtkNjT4njrUoALcHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909547; c=relaxed/simple;
	bh=dnPKUf1tRxvkBGYpB6SRXfAi+F5vNbqKi4NNlW6M/lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj+LIiF8+F57LLnzAInA+mWd1dhjkRA4fN9FHnYv/2bKW4Sx05W/MB8llY3lZhqFrn7awuzlkamxslRT+OoE7wjynQOX+/bWQeAoPFLpw27NBEereCuNVYDOIHC0IdKMG0QrkpOhNDhOvqOwN0FiLcTzZpM4+AllxsgsD752l9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=s65R17bR; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id E368D1010F83
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:55:41 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in E368D1010F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909541; bh=dnPKUf1tRxvkBGYpB6SRXfAi+F5vNbqKi4NNlW6M/lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s65R17bREvcU/wi7cz8gguueAJrZqzejqFXrbUUhtirS1AdooEsuzlAx9+NIr25oO
	 suqHdAy0/FzFQuraeZjtSIlKoFkfeCsbUf6UwXOQMwrnzY5qabMhFQwsL179fPB/TG
	 mLDgaXKgFo8m1UOkL13MQygNzjZnbzRw4iWEUOsU=
Received: (qmail 31915 invoked by uid 510); 3 Sep 2025 19:55:41 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.258572 secs; 03 Sep 2025 19:55:41 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 3 Sep 2025 19:55:38 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 063553414E2;
	Wed,  3 Sep 2025 19:55:38 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id A39901E8143E;
	Wed,  3 Sep 2025 19:55:37 +0530 (IST)
Date: Wed, 3 Sep 2025 19:55:32 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 1/7] rtc: m41t93: add device tree support
Message-ID: <18ee1fef01b9f09c250f29207ec02f22b55b935d.1756908788.git.akhilesh@ee.iitb.ac.in>
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


