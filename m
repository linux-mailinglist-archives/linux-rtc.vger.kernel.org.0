Return-Path: <linux-rtc+bounces-4034-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6561AAACC8
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 04:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D51D23B6BE1
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 02:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4041328C03F;
	Mon,  5 May 2025 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afndtKxE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34732F37A9;
	Mon,  5 May 2025 23:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486877; cv=none; b=oghWfycNcxGyKSxrgasT++/CMtXJ8pRZVV3itSnvvOfJg/gmb/YwH2do5BGs7lNcTVEZwmeJKcKDmGyMsYLUN6Yxtb5cADwyTHg5z8zSfo0arzav+++KodbqZ0zv4zeXOOGuWNI/lYqVGRc+7cn9aiPKdDZFPf16XhH4cxPmBAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486877; c=relaxed/simple;
	bh=hshCvTx0D+DDybmdzVEv4MaXhWg3BXCOiFVXYJpEqnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jmuoRRDAjc/+QosXUhmX6UVdczVWv2mMboDCosri2st0uphJ2SCYOiTrI+rehsk/TQ4h08wO+YPASjydJBaeEw52OTqLsS+pBpiiPyqmib5Fg46ijGQUe5xG+17UworaPmenymObIofBH+Hfgyl9pS8F3EXV6Z+NNRDm4V5/7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afndtKxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D99C4CEEF;
	Mon,  5 May 2025 23:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486876;
	bh=hshCvTx0D+DDybmdzVEv4MaXhWg3BXCOiFVXYJpEqnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=afndtKxEaJsL0snPjp/4AY89LxpkB2NKCuN1LLA1sLBqgRv1sd3pH8DlQxj0TJa53
	 HU5H/eu/djCbw/yqyEWcLW/D93UareD6QkYYyfL5YtxIKsggYx9ntFDTV4VmrGvfmm
	 hc7NXLl2/P4CY1I5tuiBMJ4eadZNMsTzW14GZBnr5xfKofX/+FXHzf3cOQnO4henWd
	 t3JgtmxbIqf6Atq0HtqAm4YrhRi2G9xaKvclt/oein978c8L3sVsA3YL21NenlHUGW
	 WNCUONHwkkUGgY2Kz2MZQCAa6Dl45GjbWu5Ahz3nf3SBLqJaBj3ys2u6V7EOtrVtc0
	 dezBzxMp+MLFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 038/153] rtc: rv3032: fix EERD location
Date: Mon,  5 May 2025 19:11:25 -0400
Message-Id: <20250505231320.2695319-38-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 1b62ed2f14594..6b7712f0b09ce 100644
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


