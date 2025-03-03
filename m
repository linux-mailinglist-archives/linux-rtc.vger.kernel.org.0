Return-Path: <linux-rtc+bounces-3373-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF3A4CE5D
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 23:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B23017A17D9
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 22:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEF1215058;
	Mon,  3 Mar 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dHgJQ//N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B071711CA9;
	Mon,  3 Mar 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041368; cv=none; b=Y+moSR+wLdj4j6UcBCxJJeVTrfGw1/6I76hDlG9rGX7VrqPLRxdQfavTk/bOOE0iuXW2ZYjQ4Bt34BPWitynTd/bu41W+eU2+eI1syDK2gSuQJ2xramlTD9tlAzXV/V7+/2pIn0lBuBPgoEnwbBMU0BwtfCd1AWSffhwpRyYR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041368; c=relaxed/simple;
	bh=FVsoGhWn05U9aa6rO1UvhdjmNSL6XI56qzcY4QTSHPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9/gDgyRYnHJEHoN7QJ7CfdDBmP7EIjv98srKkiSVGQHpq+zgY5e13RMBy01Cllv1gSmftM095u1/pCfqiQ7Y7AvZc6cPIPebvyaBsgJ2DdpE4oIgozjBx5dO+6y5GmG3kkxMEF7+4kOlwZQFmTw4Wp4B/yNwLh6liyX6ci2a6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dHgJQ//N; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D29041D02;
	Mon,  3 Mar 2025 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741041363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u27HA2HEokPvKqwQjggBWEvrgK3mo48hACrvMtvh3yA=;
	b=dHgJQ//NdCGq5ogxopr9r3TSpa3UPjpLbyGODoslvnACf/mrei+2vs76JGWKpp4P1Xbfyi
	Mzaf2GC8gSBXT53vLocMPSxwMaX7z2jOEpcfN+Q1c7xfCn5imh50wkDRWVuFYdM4OU7KYL
	pcqTsRA5heGF/og4/qponOD0EnKwKPK9fr+O753CWrdvjjB8UTBgETH3HbhTCmiFrKT47P
	CQo0k4/iYexSplpVfH0vVvccb1OaonZ9HwDHXTcnBcx+YSNPvUmaEfZC3DRjAEI1nlWxJp
	e+W9QCLhvHsW4Vf82WZwgh5pjZH99gTpdVFcB9CbMeuTHxE+uvy3ZarZRhvCJw==
From: alexandre.belloni@bootlin.com
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: mpfs: switch to devm_device_init_wakeup
Date: Mon,  3 Mar 2025 23:35:56 +0100
Message-ID: <20250303223600.1135142-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgedtffeugeeftedtfffhiedtjeefieeuveelffetledvueeludeggedtjefgveevnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghirhgvrdhmtghnrghmrghrrgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Switch to devm_device_init_wakeup to avoid a possible memory leak as wakeup
is never disabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 5a38649cbd43..6aa3eae575d2 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -266,7 +266,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 	writel(prescaler, rtcdev->base + PRESCALER_REG);
 	dev_info(&pdev->dev, "prescaler set to: %lu\n", prescaler);
 
-	device_init_wakeup(&pdev->dev, true);
+	devm_device_init_wakeup(&pdev->dev);
 	ret = devm_pm_set_wake_irq(&pdev->dev, wakeup_irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
-- 
2.48.1


