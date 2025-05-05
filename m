Return-Path: <linux-rtc+bounces-4038-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C995CAAB3CB
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 06:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C0097AE17B
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 04:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374DC3402E2;
	Tue,  6 May 2025 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKD3rt6z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022A2EC035;
	Mon,  5 May 2025 23:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486482; cv=none; b=FuZY49dTD06g+xEd6NYhWLCDHRkLVDroi8PeqdPMsNdKbQZ1jmTHqU36XUn3QaIgg0++73tENWiIrJ/vhI+iM6mju4R1lrtWkPnC76ZgnmdGxse8nuGPpReg0OuTFm4e+IDw4erqSm2bZPVIgcJDR7DOfilZ3iyuMmngh91aHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486482; c=relaxed/simple;
	bh=9eKdi1Lvmq91N7uyyZ1lMWayaYzUrRUixnaStxJDtAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lGq9ThPxrd2/pItvUwy7I2k+uuaEXUqOLC5MvOujzv0CqzqcoTJ6zAyggt5ujR2rrBzNuQ+frXCl1q0CIlPw60DdF2zEIQMPGRYvvfxg4QcxrztyBeARXOMP6D27xLFGdhYmN//KHajKc+r8m3Ln9PHBKakoGRyaserRrQYHMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKD3rt6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5AEC4CEEF;
	Mon,  5 May 2025 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486480;
	bh=9eKdi1Lvmq91N7uyyZ1lMWayaYzUrRUixnaStxJDtAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oKD3rt6znSmxJD/i+5J/5P142vFdLsYqZiaKRJNyJjGnXVdPSkwQb2ffelClj6LO3
	 aFPlM6r8oAB0UkRxeBFuVB9PYRfkr+9i6ffZaTVNLLIPRgtHR6WP0SidjvKGKhv4kr
	 Ae0D2owp+xkfelOATJgQlJsR+CJIhTNJaS4nXq8Uc1k4rS94MCdnlTl5c1pyem2jY8
	 iVnQPdHnJXK+1YKhuMJrqW2ROpHmYOb8ZQzUShfCat3s/qDJ6hfdW90y2EVzpDsHcE
	 ZPEy8Kv7kHCI5Uay4EwFCctmSt+sAQvptqSLDsBkj1xTwRs8cOcNayez3I0xFaTSf2
	 9iIAGOyXh9uUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 052/212] rtc: rv3032: fix EERD location
Date: Mon,  5 May 2025 19:03:44 -0400
Message-Id: <20250505230624.2692522-52-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index c3bee305eacc6..9c85ecd9afb8e 100644
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


