Return-Path: <linux-rtc+bounces-552-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D9830C4C
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jan 2024 18:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E7D41F261A2
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jan 2024 17:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD76E22F10;
	Wed, 17 Jan 2024 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsxjIWJv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6732231B;
	Wed, 17 Jan 2024 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705514072; cv=none; b=RZYoA40odagEE4fAmSyCZd/t8cn19GWSzqWwmEsen38LIHohSoWSDjvI+LJmDikgIsNaBTKHF+MB8MzYc8j36im2ok4rnwqzSBo80A5v4Ip1Mk6ZAI+GneGawhpE8lhVjKUwZIJSYktANY1+sKORqIHD4Cr/wNHA19oRD55bz9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705514072; c=relaxed/simple;
	bh=dbMqLTHCvUQEZgyJdc7aMfKn0UNVtS6MgrTwWOFFDBw=;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key; b=S/OILYGPMA4+IwCph3aRmZwuh8niE90ueL4CadRNHbJWg++45OwnA50aP1Q+A9THCc2ZS8U8muewzaubIdROL5c9muwdN2gJMe5AD7/xX4ZsegCvUar7P96bzGXhv97Q6G18vGBJCDzA8GmfGGu8Rk4Gq4RhzZRRwpAfSdm8qvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsxjIWJv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED7DC433C7;
	Wed, 17 Jan 2024 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705514072;
	bh=dbMqLTHCvUQEZgyJdc7aMfKn0UNVtS6MgrTwWOFFDBw=;
	h=From:Date:Subject:To:Cc:From;
	b=EsxjIWJv9Hb8/SaXztw8GyNCMclrBRYm34rPmI/X2sZwyzJ9NO+QT/S41fB18AYBp
	 WiY3NSoi8oBGhiw0VCRT3xz6jZnrJhiabPxtlYaYCOpT8Iqs3RyMKUKSkAPiw8bj/C
	 d70nbdz9JGjbbnW9HXASEjewPA2ZvfTKAdzLVvXMUx7HOUq9jwnvwt38/fRTck8aG7
	 HwJbX9Upaoim+MYoag0MQPbxCSxH+huIk50h8iVNrPr2TLfWFouoyNasCvZTQhwr0B
	 Vz5vPtJAqFK90NHULEqZ3DHDCt58KQQO2vF3jpaKU9PweeoQFFIQlP67pVnoGFy+K7
	 Xvyoq/SPYZnGA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 17 Jan 2024 10:54:16 -0700
Subject: [PATCH] rtc: max31335: Fix comparison in max31335_volatile_reg()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240117-rtc-max3133-fix-comparison-v1-1-91e98b29d564@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEcUqGUC/x3MQQqAIBBA0avErBvQNIuuEi3EpppFGmNEEN09a
 fng8x/IJEwZhuoBoYszp1ig6wrC5uNKyHMxNKqxSusO5Qy4+9toY3DhG0PaDy+cU0TXkl186Ml
 YB2VwCJXin4/T+35h2OEebAAAAA==
To: antoniu.miclaus@analog.com, alexandre.belloni@bootlin.com
Cc: linux@roeck-us.net, linux-rtc@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=nathan@kernel.org;
 h=from:subject:message-id; bh=dbMqLTHCvUQEZgyJdc7aMfKn0UNVtS6MgrTwWOFFDBw=;
 b=kA0DAAoWHWsmkXHAGpYByyZiAGWoFFejgYO/Iav26s0knPaZdfUEudYrzOsicnqqtw+lTa1u1
 Ih1BAAWCgAdFiEEe+MlxzExnM0B2MqSHWsmkXHAGpYFAmWoFFcACgkQHWsmkXHAGpaALQEA8n7L
 v8RJ/d0dghwUZQhvBYSRhbQSOQWLPSmzZnB/1Y4A/3+ljUg0n27fYqtzC7tdJOmZKD+CMBKT3ke
 U0tt7JjAG
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y):

    drivers/rtc/rtc-max31335.c:211:36: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
      211 |         if (reg == MAX31335_TEMP_DATA_MSB || MAX31335_TEMP_DATA_LSB)
          |                                           ^  ~~~~~~~~~~~~~~~~~~~~~~
    drivers/rtc/rtc-max31335.c:211:36: note: use '|' for a bitwise operation
      211 |         if (reg == MAX31335_TEMP_DATA_MSB || MAX31335_TEMP_DATA_LSB)
          |                                           ^~
          |                                           |
    1 error generated.

This clearly should be a comparison against reg. Fix the comparison so
that max31335_volatile_reg() does not always return true.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1980
Fixes: dedaf03b99d6 ("rtc: max31335: add driver support")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/rtc/rtc-max31335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index 3ddfe71bbb56..565d4c9ee399 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -208,7 +208,7 @@ static bool max31335_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 
 	/* temperature registers */
-	if (reg == MAX31335_TEMP_DATA_MSB || MAX31335_TEMP_DATA_LSB)
+	if (reg == MAX31335_TEMP_DATA_MSB || reg == MAX31335_TEMP_DATA_LSB)
 		return true;
 
 	return false;

---
base-commit: dedaf03b99d6561fae06457fd7fc2b0aa154d003
change-id: 20240117-rtc-max3133-fix-comparison-65e4fac8e346

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


