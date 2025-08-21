Return-Path: <linux-rtc+bounces-4738-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F99B308B7
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 23:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25CE55C87C9
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 21:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866DD2E9745;
	Thu, 21 Aug 2025 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLm8oEbh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC92580CF;
	Thu, 21 Aug 2025 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755813441; cv=none; b=WsGkIgbfzUtEyHamsNpWt7TyQz+riGbCbbcLcW4WmeXXKUBa0Dr6FrXxKiH4eFAjf4M4pxLS7QptyJqQbeEGT2qDyI40xW0OJ6Hn+c6fWhb2/eC6A2LwzG6BcgTlnLozTFKCTxEO0FcCsF50u/7uZx0NWycKk2ODZLoJR719UMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755813441; c=relaxed/simple;
	bh=jHJW5GlnGo4Qo2dQ25s5QooD8IR/WOdFGQsseBD29U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBjyUmBmr+500k968cRqNyM7tWq8LgqaeinZruFQMM/ob+ybBWTGoscqIajx0MHcTqZY2DxRSWpXIvAy3uiD86RNOnUUQ+xoV7uapBsGsJiFDzeWn7V/w1dCyCXxy9P+Ljarl5Zo0RBYEmIKG7LsxSnIP/OkoSo13dr4WhChoq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLm8oEbh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3806C4CEEB;
	Thu, 21 Aug 2025 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755813440;
	bh=jHJW5GlnGo4Qo2dQ25s5QooD8IR/WOdFGQsseBD29U4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLm8oEbhPeImlaG0GeVmyTA+jvZ269apwppTrNc8B34Xh5ZlmUgbFkxvyYWv9oHUc
	 c1Ygz7BvP3vJvSlxioJ6W2WgCqeQ2ZYqWBikZj1L2g5nObUbMi+PSIfa8o1qLFlDXL
	 Dl+Gmy0V5ljgS/Pq7miHbB36XWk4EZSEPbqMKU0BjLWGpA66J0LphsXr80pgGGCZDt
	 cjmIdrITp8hqdLySrVqODMpMGFwHPXSGGdr9t5AK0WFFolOWMHlKqFwuyyWu5lmPww
	 Na08t2cxPW2yCGa38Rh721O4e3H3aX8gWm8PgUKxlPeoPTFdXgj0nRrruQtFPWnrX4
	 pormJy2YGdpcQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: x1205: Fix Xicor X1205 vendor prefix
Date: Thu, 21 Aug 2025 16:57:02 -0500
Message-ID: <20250821215703.869628-2-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821215703.869628-1-robh@kernel.org>
References: <20250821215703.869628-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vendor for the X1205 RTC is not Xircom, but Xicor which was acquired
by Intersil. Since the I2C subsystem drops the vendor prefix for driver
matching, the vendor prefix hasn't mattered.

Fixes: 6875404fdb44 ("rtc: x1205: Add DT probing support")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/rtc/rtc-x1205.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
index 4bcd7ca32f27..b8a0fccef14e 100644
--- a/drivers/rtc/rtc-x1205.c
+++ b/drivers/rtc/rtc-x1205.c
@@ -669,7 +669,7 @@ static const struct i2c_device_id x1205_id[] = {
 MODULE_DEVICE_TABLE(i2c, x1205_id);
 
 static const struct of_device_id x1205_dt_ids[] = {
-	{ .compatible = "xircom,x1205", },
+	{ .compatible = "xicor,x1205", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, x1205_dt_ids);
-- 
2.50.1


