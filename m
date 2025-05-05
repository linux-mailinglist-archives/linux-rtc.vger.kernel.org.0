Return-Path: <linux-rtc+bounces-4032-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1CAAAAA7
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 03:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1727918885E2
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 01:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D498393E87;
	Mon,  5 May 2025 23:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/Mz8sFW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB0637267B;
	Mon,  5 May 2025 22:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485917; cv=none; b=d87ohDmPN6Pi1To5MC0UKUIQTQ8+yUaYoCGUfQuJsG1DauIaVXywdrGoFfAb9M4v52ODwJfzeVcE/ZCUlwCSu5Wz75jkn4JvgpsNBfSEgceTwUOFxfBr8iakReIQASpivmV0/Mo1qPNJGd54fAliR1BTs6qFPB7XvMrqzXpxy20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485917; c=relaxed/simple;
	bh=+lQY26jWCWM43qhyyyBfmt9srxMrAHoP688AWa3PYjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ileRfoy7pIYiewBYfwsq7vtv3bUbBByXUfwt+ynfTUy5aJoNmsh5TPFT93k8TRCBG9atpROXYvKn3ZklUBy/Vht2u3kjWs8KDQXRH28j0rikdUKo5hlkAl5V5ehknEakJdieJ7BX8oJfnG9SoXJAzJjVcO+IrLsRDXdFsUjzL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/Mz8sFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B27C4CEE4;
	Mon,  5 May 2025 22:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485917;
	bh=+lQY26jWCWM43qhyyyBfmt9srxMrAHoP688AWa3PYjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/Mz8sFWQowd4YkpMA3NZDWD1ot4+6x/7xSkHfxIODuO4zqviF6e+z9FrmGuBqxRX
	 1XJuWqiocV7YvVrRF9hLq4dD7P/RXOatrEe0Foy58B1ir8V2f+pVueZZK1y23enQuB
	 JrH+GNvspnF1eXPJjyj405FUu4RVxMnPcwAwYzztOAs1ehzOr5X3BMNohx1AAd0blW
	 0Na5g4gVPysoY8A5Xy9em6aAJR0HGGe60s40GKtVVALURTgEfoRrktzmrFNqzYPfhH
	 jsz9Sd3jz2VOGzQdLlkzVT31lHALfElSaTfmvQv4WdxJOLslWioM58xSw6gxsgd3sS
	 mThDaJD2mlYiA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 064/294] rtc: rv3032: fix EERD location
Date: Mon,  5 May 2025 18:52:44 -0400
Message-Id: <20250505225634.2688578-64-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

[ Upstream commit b0f9cb4a0706b0356e84d67e48500b77b343debe ]

EERD is bit 2 in CTRL1

Link: https://lore.kernel.org/r/20250306214243.1167692-1-alexandre.belloni@bootlin.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-rv3032.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 35b2e36b426a0..cb01038a2e27f 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -69,7 +69,7 @@
 #define RV3032_CLKOUT2_FD_MSK		GENMASK(6, 5)
 #define RV3032_CLKOUT2_OS		BIT(7)
 
-#define RV3032_CTRL1_EERD		BIT(3)
+#define RV3032_CTRL1_EERD		BIT(2)
 #define RV3032_CTRL1_WADA		BIT(5)
 
 #define RV3032_CTRL2_STOP		BIT(0)
-- 
2.39.5


