Return-Path: <linux-rtc+bounces-3284-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A261AA48002
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47E3F17CE63
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4913F233134;
	Thu, 27 Feb 2025 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S3FUzG8Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF023314A
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663822; cv=none; b=oBofsSjzjxHJm0QvXcVR9Hv/38L5h8evCKHB0zcUQJbQbtrawqUkezJ8+5jwpdyW5wohc1a1uRJf9PdecbehrWMXUBpfrOw1zTW7LeeIuN1LSCcDXPRoh5rxVtAsueNxS2uF/F7XCuXNXdBGJ1rqVhnMnsRZ/DFdDYSThBxyolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663822; c=relaxed/simple;
	bh=vAFzxwkXeTzesQ+x3tdBqDDfeRpINbz2vW0aMsCwE64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZC7fFLpXTFQyWwfcjPzrPOGdM/DynyNWBs5mR/7EVWp1XNdyNJ9CUyfgCsakSOAxTiXC/J90VIU1v2gAUdjWL6XVUwnUyE4DpSc4JOAoyoF/Ayk9RYRTwJ8udho4zQvKIN98HvKi/qC14YOk/E+hOShp2x1G93/gDNZzYD6aks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S3FUzG8Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/+X4d+2tCAXnFT+wF0nRgsn1iikYvQLvyAR0+y9C9ls=; b=S3FUzG
	8QIVyI/z2bJomT0FZMsP6m01mRlqp6YxllY87Ddlf84l1QJ6069JE+/75OE3MMf5
	8YxrqzXy14RQjPipz6FBMNeG41V5ZgvdlMA/ntnEk5Z6avhJ5tLp88H9h7Oc9V7k
	+Qu4k0jnWCFU8o1LRepzifhjB1fJdE6I8jO/1pC6sL1Cu2DR2NovCoL0f3e63RdF
	n7CD8wKOiReebW7bEyKdtqcPb/RzhgZX+0HLWksPegSXXIogcFI1Vn6wLhNV4G3b
	96QWhQvtr3umpS/OIDR06Ou+vIT/jSupp9Se90eJ8Ql8I1hsHgj0kzHcRgmK/tAt
	oumI4bvqTAfN/eGw==
Received: (qmail 962451 invoked from network); 27 Feb 2025 14:43:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:35 +0100
X-UD-Smtp-Session: l3s3148p1@mYtl4B8vPGJtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 7/8] rtc: sh: use local variables in probe() for mapping IO
Date: Thu, 27 Feb 2025 14:43:02 +0100
Message-ID: <20250227134256.9167-17-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
References: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to store the resource for the registers in the per-device struct
because we only need it during probe. Remove some unneeded unlikely()
while here and correct the type of 'regsize'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 033bdfc83e42..3bafb2a0659d 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -86,8 +86,6 @@
 
 struct sh_rtc {
 	void __iomem		*regbase;
-	unsigned long		regsize;
-	struct resource		*res;
 	int			alarm_irq;
 	struct clk		*clk;
 	struct rtc_device	*rtc_dev;
@@ -328,10 +326,11 @@ static const struct rtc_class_ops sh_rtc_ops = {
 static int __init sh_rtc_probe(struct platform_device *pdev)
 {
 	struct sh_rtc *rtc;
-	struct resource *res;
+	struct resource *res, *req_res;
 	char clk_name[14];
 	int clk_id, ret;
 	unsigned int tmp;
+	resource_size_t regsize;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (unlikely(!rtc))
@@ -353,20 +352,18 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (unlikely(res == NULL)) {
+	if (!res) {
 		dev_err(&pdev->dev, "No IO resource\n");
 		return -ENOENT;
 	}
 
-	rtc->regsize = resource_size(res);
-
-	rtc->res = devm_request_mem_region(&pdev->dev, res->start,
-					rtc->regsize, pdev->name);
-	if (unlikely(!rtc->res))
+	regsize = resource_size(res);
+	req_res = devm_request_mem_region(&pdev->dev, res->start, regsize, pdev->name);
+	if (!req_res)
 		return -EBUSY;
 
-	rtc->regbase = devm_ioremap(&pdev->dev, rtc->res->start, rtc->regsize);
-	if (unlikely(!rtc->regbase))
+	rtc->regbase = devm_ioremap(&pdev->dev, req_res->start, regsize);
+	if (!rtc->regbase)
 		return -EINVAL;
 
 	if (!pdev->dev.of_node) {
-- 
2.45.2


