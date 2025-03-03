Return-Path: <linux-rtc+bounces-3375-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E907EA4CE61
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 23:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B783AC35F
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 22:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593D2239585;
	Mon,  3 Mar 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="luLGlBoN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E0215782;
	Mon,  3 Mar 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041371; cv=none; b=PTxLlqHwufRvX83CQYAvo+mzb4X9VPnv62LpgZZPLoTMu5MSN4amB2bbsHFCFgbQvlS5uYKevB2/lZE710l3D7UH1/37WoWCOEXw4SwW36p43OqLNlrJ2Mr+y8QhVdKUiw9v/hISnLpkU4eTYNT5knNrkQOBdLFSfVShPyuIrYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041371; c=relaxed/simple;
	bh=4JDVuWmNJV1srQzegb6Y5jsfqjahhK6FUQT2t3X5vLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8ljuN0NwzJ6Uf1S+dyG6T1qMCIlryM9wsGVAs8rNTI1N+2bAVfTBLuh9+yNoi2Tyr2r/hzapzci7POee3xc8kZE9ptlloiHz5JDDgtXq/PFPsaIfuHFGndnBDsyBOGanLYKIwY1rRpRPRHnwp2YjfEBzB9H3kpA1nx/n0ZR5oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=luLGlBoN; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 584B1431F3;
	Mon,  3 Mar 2025 22:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741041366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbQAcrA+owb5cOvlTDq6qP+RrM9u4aqNiTwvXrGnUuc=;
	b=luLGlBoNRMI6mfmgg8N5OrhTTXYbUFlqzFaupZsTDjsVjQVyyHKlughN/lY3uUCUAlMy+o
	ytsaUTO7ffrXyNwYal1XbmSBDiA5SE8aHiB44MNkg7KiXv9T3LHvffPA7KBqD1nHjeFB5n
	tn+Fq817cKVsVrPqcQg9ioyAt4+zcNzRjgxg4OEzlcJljbGV5MZl1pJDXjhyr6UpI4UrF7
	poLCRA8E5AuJ0gonLNUMqvteGkA7yKVm/tgpTxdvN3CtmRCCyJheGZNmOEzYAwijN4Cfn9
	ycEkS1ta3BzurA58z/V4/4VuSzEUhJBjnBllfhl8kTDkcbscDrAoofCaKZS5EQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: pm8xxx: switch to devm_device_init_wakeup
Date: Mon,  3 Mar 2025 23:35:58 +0100
Message-ID: <20250303223600.1135142-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303223600.1135142-1-alexandre.belloni@bootlin.com>
References: <20250303223600.1135142-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgeevhfefteejieehkeeigeegtdefffekfeejgeeujeeiudfgieejheegieeuieehnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Switch to devm_device_init_wakeup to avoid a possible memory leak as wakeup
is never disabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 3b9709214a08..a88073efffb3 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -503,7 +503,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, true);
+	devm_device_init_wakeup(&pdev->dev);
 
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
-- 
2.48.1


