Return-Path: <linux-rtc+bounces-3993-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 470CBA98A5E
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7D55A3D45
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C751139566;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8SSzAIf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78A57C9F;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=Gmohar/hsd/zqytkBDHQztJARj40vbF1+MED420SwWPyIp9CJw4ZgWbofxnW2uckGk9UqtTKmc7P4K4ZsQUXJxKYDjEiJsfKpMtgdoXXsRRFpjq13PE0LtAFXRnlktMK5k5/vqtrWCD+VTzdCi2DY/YT4tgKk1zircbiMbU1xyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=m01rFOSydJSgCAdnVMv/bHNSfOYnAtaxRYMqohRJgO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ty1KLuMSoaIMfyt1855bKY6wU557DxA+DeC5QnbijdyqDbfeO5zY7Eb9ZOlXtRSPtFZzXjaRCX1rRZN4IIm18X/ZSPhR6NhcRCNvsyX77apovmIgmrN6qvKMzPBuGtz8Qb7Q6T6CXEd3tLpBNEb2GfEXOhP9sHYRN17ZiWG3K2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8SSzAIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22067C4CEFA;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413453;
	bh=m01rFOSydJSgCAdnVMv/bHNSfOYnAtaxRYMqohRJgO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8SSzAIfK3Py1fR5X7nmmRlI62EdqBndEJ33LFawJhnafsNnwOYkmDsW+fufdwW+a
	 gBHlF/1K54PNL8zSn+ymDh/wdbhQBV9i66li/BRIwwdcFhqYpE3iqot37wDVz/HuHO
	 M+FT7Q9AHO1xqqMaqnYfZfj6No8ABpDTwvGmuq4H7jaye8i7dKbteHyxeyz3LJKaz6
	 m3jOLHYw1dRXiLu+NUBEpfdshV0keALgIpkbpSBI5ZrgEgmBB/k+c9w1L8cCGN9jV1
	 28Astry0eSRZIQ1AJzvsHgk5G/QiLske0RMumNM+qDJna0BnPXuqn2GyfSQutXRNdK
	 R/hyBab7PhaIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008Ap-2FcH;
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
Subject: [PATCH 5/7] rtc: pm8xxx: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:16 +0200
Message-ID: <20250423130318.31244-6-johan+linaro@kernel.org>
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

Fixes: 5a418558cdae ("rtc: pm8xxx: add support for devicetree")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 5da237e7b9b2..e624f848c22b 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -683,7 +683,6 @@ static struct platform_driver pm8xxx_rtc_driver = {
 
 module_platform_driver(pm8xxx_rtc_driver);
 
-MODULE_ALIAS("platform:rtc-pm8xxx");
 MODULE_DESCRIPTION("PMIC8xxx RTC driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Anirudh Ghayal <aghayal@codeaurora.org>");
-- 
2.49.0


