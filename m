Return-Path: <linux-rtc+bounces-4028-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA47AAA182
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 00:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 477E73BF3EA
	for <lists+linux-rtc@lfdr.de>; Mon,  5 May 2025 22:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644AC2BE7A5;
	Mon,  5 May 2025 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJrVHzFq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372442BE114;
	Mon,  5 May 2025 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483592; cv=none; b=JKIr9juGULaePSj13XIziFLXeCIVBiZnzZ5Nkhe+I0ex2z8RxZM38XmNeXRhpb1hbngtcpdp3vFMVBosJRrZXabz0BaGVnLu0rohx/Giy/NlSZIKn/FnmbhQ6VNHsNKsUWnrUV/Q0nn35SgP9BG7GG+USYmqfJ4FUA7BPRJFuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483592; c=relaxed/simple;
	bh=+lQY26jWCWM43qhyyyBfmt9srxMrAHoP688AWa3PYjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AeeMdNuAXWcwRRqZBHmzKRMxG9KmESPb1aqv5kzjJdU23MHeSb8f88BsbyH8N4swsuZgPJI8pAyTcSvhW2JERbMzvtUpkwlzgEoiVK8tJasNaa1KtFVkdJfkhONENJHNaIKgTYVGR3Rz3/2PkvRAtDWgybzvAC9rpQbBTFNryl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJrVHzFq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03658C4CEEE;
	Mon,  5 May 2025 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483591;
	bh=+lQY26jWCWM43qhyyyBfmt9srxMrAHoP688AWa3PYjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJrVHzFqwJEBBBPWqf82e3VpQ1LlKFjsrrqG1+Qkr/F7u7RAH8WweeOWkehjIo06g
	 dRdkE25jGtK8Hn8fXpuL0/FXuM0jXbhNUyIt+Oa+vr+74BvHraKhx+LYIfgZ1wRhnC
	 mgR5xZCXDZ7OI/M8DfNDn4t08t0fho0VTpE/7UGid5aYM2sJq4EJ/qzypWHwyLZZ9r
	 BDoXdQZC4SZGCQPls1pBSCx51dNr0lNUWDwLH+uwwJM3vTyKiEbQAp2lzaz057yfqW
	 YVT0S7rPRmCnWoE6G4igGnSqMqYU/P+ZqQhZ63VKal9Jh9XYcdoYzsJJo8wExY9S2P
	 8ZL+2T+I76L6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 131/642] rtc: rv3032: fix EERD location
Date: Mon,  5 May 2025 18:05:47 -0400
Message-Id: <20250505221419.2672473-131-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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


