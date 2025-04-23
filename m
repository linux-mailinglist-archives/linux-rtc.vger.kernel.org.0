Return-Path: <linux-rtc+bounces-3994-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9438EA98A5F
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925213B7ED2
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1E513B797;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtUnXhhS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC35D8F0;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=QpeoL5j++bm7zN64o5w6q5j52/WyQmOXk0j1T1UMG99P9C2zicgeD/NVdcWoWPBGiy1qBt4HezykpHEdG7GadZQpbRpPV5gFndXm6av2Mw2GPWHIN77rEgASJX+OCpNT+N7ga870RSQUkEceaziuzMNae4yWXTrgAEPhI8I6Af0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=z2/XKoF8bUNQ6NnG9VkpxT1JJDXsfvtOMBeA2puTtsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvAhSsOe0R5C8+aPow1YBX8IAmxXgVhQ/UciWYG+/eifY9Y51apWxSoGT4jevK/80+omqUJ+4O7+gOfFolKf/jmieQ9sBl7KQ6iWqPWMjlVLmOYoB9XXZQdKjXbZVIvIjOW68NNFIUynT4R1/LjTzxxR68OH/FlUMZxNu8buhkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtUnXhhS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AB1C4CEF9;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413453;
	bh=z2/XKoF8bUNQ6NnG9VkpxT1JJDXsfvtOMBeA2puTtsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtUnXhhSvfFg4PwGP0yudbWHXWv4osNqDMobPlzY7GJWN/j1bi5d0xUtnmuF/Mbez
	 Zu2RQSWALDo7QW6G/2V0JmL4Ln/1Fbjn7mMz418QswfCQF6rT7aloE6BLa+w2VXe/0
	 wYV44OEI2zB1N84AXTCWRfUFGB8gzjtsqdHzcfnLuewWEJxE1X6AWj5tNEmCW2v40x
	 pcnLdVLomC1bwJSkJRGy7NpNwVVHvpaRL/EsMzbjBYyqFAtHRkHYOxAiakeRr1eQIY
	 RNpsAMMSj+Ae9627TaCkzRRBAUsqUhQrGi1Eid+ltw6I4tHVccwoHATYbrxct7Vld+
	 JDGWauSYZwRjg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008As-2Y68;
	Wed, 23 Apr 2025 15:04:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 6/7] rtc: s3c: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:17 +0200
Message-ID: <20250423130318.31244-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423130318.31244-1-johan+linaro@kernel.org>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only support OF probe so drop the unused platform module
alias.

Fixes: ae05c95074e0 ("rtc: s3c: add s3c_rtc_data structure to use variant data instead of s3c_cpu_type")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-s3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 58c957eb753d..5dd575865adf 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -609,4 +609,3 @@ module_platform_driver(s3c_rtc_driver);
 MODULE_DESCRIPTION("Samsung S3C RTC Driver");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:s3c2410-rtc");
-- 
2.49.0


