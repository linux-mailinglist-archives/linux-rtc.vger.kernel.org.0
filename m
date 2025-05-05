Return-Path: <linux-rtc+bounces-4030-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768FAAA94B
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 03:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8881885C38
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 01:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8654829CB20;
	Mon,  5 May 2025 22:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5HHMrOB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01457359DF2;
	Mon,  5 May 2025 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484974; cv=none; b=FZPspryuThpRQvwqjP4RqNxWCbBkh7AhqC+JpzEa3WzQe+2jQxciIeNQhYwNXDNN73mdeQYZThVGRLgj4E4/w5lXv+cBFnjgJE9bs4sfHJEKr5DtxylV8ZAwkORA0JsvSjqWKch7igwpeyvLFe2x3BqhTeTDH64bVJafJDnxDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484974; c=relaxed/simple;
	bh=+lQY26jWCWM43qhyyyBfmt9srxMrAHoP688AWa3PYjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WX2oFYdbeLyDCzHBugxOBzfDmGLfdmQi5QbqdenZdMURUKzA90XN1Wa+F6x79v461akJ3RljEZgQi7PDGgvXDbZmgp5X0K5kCdPeKyXFyy5td+i2nQ81SzMDLeQTpOdSxXkUK8VDQ/7tU9p4d+naRAplCykkPrJimFaFodHrspI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5HHMrOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34609C4CEEF;
	Mon,  5 May 2025 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484973;
	bh=+lQY26jWCWM43qhyyyBfmt9srxMrAHoP688AWa3PYjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h5HHMrOBG5muytqkjIvGQWTcPmmfxKr9iZFgG93WM/J9moEMpPEcINefKQMny8jMc
	 +pJ4oHFPiS7lc1wBXdFCbW7HkBb5/u+LpuCHaUO9HVNGVErmuvlIhW0v8o/QaL9eIk
	 vPF/yvdPOvipM5zuvleSxVele48B+KXZRA2flxqY6vMpCKbbBbT1NAa37F7y9B4hfF
	 yZFT//cwkmpQtSJtahfv4pwfyh0kz8WNRSxs2dgAjEeG3n/PL2f0fQRbA65m/+Teer
	 siV5V2odqii7vNN+YGv+Iwt1TqyHxzz989jUrD7PrkOvc8BpY1RVJbqA5OTrNiJCYz
	 SG5pk9/g9RSbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 104/486] rtc: rv3032: fix EERD location
Date: Mon,  5 May 2025 18:33:00 -0400
Message-Id: <20250505223922.2682012-104-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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


