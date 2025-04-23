Return-Path: <linux-rtc+bounces-3995-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13457A98A5C
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9578189A7D8
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0508F1487D1;
	Wed, 23 Apr 2025 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4GUF1hz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B878F36;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=e1B+xX8BPc7dwFrxuCkaj7WlXTV1uTLqiXESo00BkAJSvc3Z0fSxjJa7zme0HwULfykJ4V0+VuTwkzv7T8Jb6ZJ4hxdfdwX6CcA9Ltx8o8Y2OzoV2x5oRMtkLeQNGSy5Cglly9EkT8l3z4RYtq94upz4kZ/vRiZnUEmz3YouF70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=abU+VqEcbmRPidwGpPTKlvPPOoEMJ4/sX2XotKPNm1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0noVRidgod+1ymVPKCbsHpfcg7cy7/GsvFqGRTUABtV1mEhdq1JBAkRskLISItPsa/DsKloRvfevztOGCYzq15MEnN5Rb6B7ArjGfEANPtnz/pSzJoegW4VwcWPOxCqekP+mn/7yiRNflCJNeEFfOutH4MoCGXK5pJTpbphXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4GUF1hz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AACEC4CEFC;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413453;
	bh=abU+VqEcbmRPidwGpPTKlvPPOoEMJ4/sX2XotKPNm1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4GUF1hzMTWriqdVlMYzhDy7+MejamTJWIxobAHhvX1MpdBVV0SA5C9Kr5CxVcWBN
	 BAgl+4qr8w58PBWjLAVkPuUxF6kWew0sRqQFecF/05IZthWLIiVh6yTwR7dvva4r2F
	 ezCuhEl9/TloTv7dBVrYnGrD++DRLgWj5iNMgcrEoHjnNNS/8pRKknmGLBebg5i1yX
	 cBhplLsgSC82gCgyAkchRcJF/VBP6RoOMtNU9DD+CcAz5Uneh9vgCl+QNXwfG7E3B5
	 8NJ5RNEwAoNRIp32jKqV4xvpbHKgTku+/mSbrnSKY+YnF22g2J5Eq8fmYakn6h3KEF
	 9EYGe76UEecPg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008Av-2vq8;
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
Subject: [PATCH 7/7] rtc: stm32: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:18 +0200
Message-ID: <20250423130318.31244-8-johan+linaro@kernel.org>
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

Fixes: 4e64350f42e2 ("rtc: add STM32 RTC driver")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-stm32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 1b715db47160..ef8fb88aab48 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1283,7 +1283,6 @@ static struct platform_driver stm32_rtc_driver = {
 
 module_platform_driver(stm32_rtc_driver);
 
-MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("Amelie Delaunay <amelie.delaunay@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics STM32 Real Time Clock driver");
 MODULE_LICENSE("GPL v2");
-- 
2.49.0


