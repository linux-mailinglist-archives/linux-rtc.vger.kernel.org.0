Return-Path: <linux-rtc+bounces-4688-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C87B24F9D
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEF71C27FF0
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 16:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EAF29114A;
	Wed, 13 Aug 2025 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PmD+yIvx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC329A33E
	for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101799; cv=none; b=pfD/PXokCkxP0GvtT17eJx8gDzr/99En2QFtq0P2dYK3VDDjG33nYUiB+1dOqJ2NM0yjZt36LJKzwPySu9ghI6WZKSEOGNhmEvgUhi9aCO/l1Uqa9iWQ2SBkvjDbDPNlsWH6qkP+OU1/AuBG0iXDTgzCA1AJwVfsb6wR/iGaVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101799; c=relaxed/simple;
	bh=9Nb6DVoDSfEco5ow0BnUVRmx8Y/4ydTPPbL+WWkgjfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxmhDw6FYLFBaEwfiSaMahzJ0heiBgHvYQ6I0Q0L8MjUDjRjkq2Yc6Yu578SDtyMUrftqEJWygBAGj230dYpsso0iO+ghsywK8JHMtnNOvYXdENqw9KYZV+6PIkx4tuMSRJnWqpV5CgZNOcsM6O/xGOld39zV7ogPhnAK4+LBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PmD+yIvx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=OYn6F3avixjtER6E0ohkY1hi7mX0fUkF12CsoRFU9/k=; b=PmD+yI
	vxRAKaGAXHba17GAjQPiz7VPVfkfzMuO6zPxsF1nZa9rVY9CeAaEqnG7TAD41SMS
	R5xL6MkdHdi+wybfV4oir8xCoY906vOOCo4nvVWtAGKXDTG7k0SFV0/lx269u0Ah
	zqrAAh0BIugpdiD/qAMcRQIIep/oYijYEChahm2FVrjxfgTd0nGNW12fr0T03NTz
	dd4LHlmwDBip4OJC+GrvXSJkA51U/V9Bxr6hH27NQWC75e4Nu6I1I0h8lTiU2zlK
	fugrvsMltZjD55+XQromft7/jqKW5muWgDoWzF7TJYYl2p4egtdSldez7VIOOwjJ
	+kBv/8blVSmjwt+g==
Received: (qmail 695593 invoked from network); 13 Aug 2025 18:16:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:27 +0200
X-UD-Smtp-Session: l3s3148p1@cDWKekE8xJFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 17/21] rtc: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:03 +0200
Message-ID: <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/rtc/rtc-meson.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 47e9ebf58ffc..21eceb9e2e13 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -72,7 +72,6 @@ static const struct regmap_config meson_rtc_peripheral_regmap_config = {
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= RTC_REG4,
-	.fast_io	= true,
 };
 
 /* RTC front-end serialiser controls */
-- 
2.47.2


