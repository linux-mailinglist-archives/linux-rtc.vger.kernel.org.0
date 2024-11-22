Return-Path: <linux-rtc+bounces-2602-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA29B9D5D0D
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 11:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575431F2234D
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 10:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F221DE4EB;
	Fri, 22 Nov 2024 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YyrMqLmE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF391CB9EB;
	Fri, 22 Nov 2024 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270238; cv=none; b=oByNy8cGCSMLuAI8uRbHoLhfcUHLeOOZC8kpXJSFrdV1bK9c09DK+sAGWP4KAIBtp323Ejpqn8ktc16CCYsn2ZMselayrvkE6BI4u2zpJx3bnO0cbsnPIgYZW0LlZBBCuGLsrO4gf5tgFpTB5+D2MPetCtDpGemi7hQWtp/mq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270238; c=relaxed/simple;
	bh=w64BTwN0IrG1ifZ6kdDwL98cvqCpeA47a/fO6Piqzcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhZqd2nCPw7RXMXKuHvfbAJIWH9jHnUlO7tOqW5OXp4EPdn8cowApH304nfrEh+4nl1MzVSbRYVn7riRqW59vMhNmcHPHYjtPB0Seyr+Tp4iOYZBOKGWUoIhljvtVURRm0BORzzeTOnJ5ePRe0lPxMOd8aiOAibQYDyBNtzfTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YyrMqLmE; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 374E6FF80A;
	Fri, 22 Nov 2024 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732270234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzlNoZCMziwO+aezX23MTGPRq52iT+GwfwYT6iu22Dg=;
	b=YyrMqLmEiDglLc/Uox2yq8Mx8K5FMoRcksaNXzP7sgVrk3BDUu5tzmtbwYEWCBtMwcb4eQ
	/IhPkeZuryDMjNzrExksj1Mx1iuOtkxGIOT6yKoLgxeU/19viguSEZ0nczFUT1gzh5E5is
	qPPGHj//51CrcgS8A/p9kxUHayiNQIWsluO/AB1vrxIIpYtOO8rcc79fs17gRpKXLbgaJw
	b5Rudn/omLBXwyVGEoA97dFcE6AKrDxGwjBnonnfPTz9Qa66l1nWPba8T8RENRxGHnfyQk
	/oQZ3evDGNx20yGPESuplPamG2i9VqCx/ZenUcRIXOV8MRpYzS0kUTBROetiSQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Artem Panfilov <panfilov.artyom@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 1/2] rtc: ab-eoz9: check the lowest voltage threshold first
Date: Fri, 22 Nov 2024 11:10:29 +0100
Message-ID: <20241122101031.68916-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122101031.68916-1-maxime.chevallier@bootlin.com>
References: <20241122101031.68916-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

When checking the internal status flags for time validity, 2 different
voltage thresholds are verified :

VLOW1 is at 2.1V and indicates that temperature monitoring isn't
possible at that voltage. This stops any temperature compensation and
can cause time deviations

VLOW2 is at 1.3V, below that voltage no timekeeping is possible.

In both cases, we consider the reported time to be unreliable and print
a warning.

The current code checks for VLOW1 undervoltage first, but as it is higher
than VLOW2 it will always trigger before the VLOW2 threshold is hit.

Make sure we first check the VLOW2 condition when checking time
validity.

Fixes: 67075b63cce2 ("rtc: add AB-RTCMC-32.768kHz-EOZ9 RTC support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 02f7d0711287..85853da258d2 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -116,15 +116,15 @@ static int abeoz9_check_validity(struct device *dev)
 		return -EINVAL;
 	}
 
-	if (val & ABEOZ9_REG_CTRL_STATUS_V1F) {
+	if (val & ABEOZ9_REG_CTRL_STATUS_V2F) {
 		dev_warn(dev,
-			 "voltage drops below VLOW1 threshold, date is invalid\n");
+			 "voltage drops below VLOW2 threshold, date is invalid\n");
 		return -EINVAL;
 	}
 
-	if ((val & ABEOZ9_REG_CTRL_STATUS_V2F)) {
+	if ((val & ABEOZ9_REG_CTRL_STATUS_V1F)) {
 		dev_warn(dev,
-			 "voltage drops below VLOW2 threshold, date is invalid\n");
+			 "voltage drops below VLOW1 threshold, date is invalid\n");
 		return -EINVAL;
 	}
 
-- 
2.47.0


