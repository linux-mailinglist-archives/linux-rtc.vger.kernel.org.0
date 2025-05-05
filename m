Return-Path: <linux-rtc+bounces-4035-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BDFAAAD17
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 04:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1916616D671
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 02:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC05B3AD165;
	Mon,  5 May 2025 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP6wsR9Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7E3ACFCA;
	Mon,  5 May 2025 23:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487152; cv=none; b=RQAJAvMutU/leGYJi/jGuPauT6sjA4vZW4gLeh7hX3rmYipTQz6KIl5JL3ybWMKxCncXYw1Wh8hNNPvFuAi+hiwd9oQcL7BlRVuzhkzFtC5tJjZw/QTPOduREJNLc20sTNz7r8opI/8bnB1pTjDT5qVtACvu0FBNofZztD3DaAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487152; c=relaxed/simple;
	bh=SNPvVEmKMTvF98mi1hcPNjQJ3eRR1F/7FJ2Da8+mT7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yna1Cl9rCEwotfP2hAYm3pJmHhHDRn6zwW3WhDRln+R4VgwVgjx+OOfNz3V2BiFks8jmiW9Sx47B65vKiu+SKVB6UOZBfMYFQgsW+IUJIZ/5xWZnzXK0XSy9eBZulOkY5h78CNNElPWAKDp1WrLGSSTsi6U/15bX6dosfd2VJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP6wsR9Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18D2C4CEEF;
	Mon,  5 May 2025 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487152;
	bh=SNPvVEmKMTvF98mi1hcPNjQJ3eRR1F/7FJ2Da8+mT7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OP6wsR9ZRYMlFEOzH9+FurDsR0750FUppEgssQ0Khepasj2bIyV7FMDqQwMJehfkn
	 jbWspaJA4ibatvswHJic/NIMaEhZrg/tbqnuIglA7tAPK91DRxXRB6gfOc0Piy7GDC
	 godYAGsML/mWyg/fza7DWLfsvDYe9cX0JGPVFz1L2dnowXGaHcokftKWEMLQiRvOSR
	 7ZjEVGh/lyBeigmYNazrHnO00egjMR0e9MxH+fNRWlxFiynOfRoGMLXfLHWVtb0N27
	 6cdTYv7rYVAOsgWQXWtuj5SssplROziw19qfVi157D+PeRW0nsnGEzmUUIbiJvF48y
	 Dfsokv4nzv2nQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 028/114] rtc: rv3032: fix EERD location
Date: Mon,  5 May 2025 19:16:51 -0400
Message-Id: <20250505231817.2697367-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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
index 9e6166864bd73..acae15c34d128 100644
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


