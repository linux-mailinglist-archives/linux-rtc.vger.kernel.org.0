Return-Path: <linux-rtc+bounces-2543-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BA9C68F2
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 06:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2F85B24412
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 05:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B863D16DEB2;
	Wed, 13 Nov 2024 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZWR+o+L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902532309AE;
	Wed, 13 Nov 2024 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731477437; cv=none; b=oBuymZQ7xFhHToKK3AFFj1mtKlFxt9hxWoBf3jm4+KHMCp8KwT4uV8tpAHP6Z/+TTs16tYo9bBvcpX1+HkAdjVN1w2GZAiTwuV0IWHX9yanXhXBNkvxZfHYaCRpuPdlyGrmr2Cyn13qrZLHKOZmjo3usnixyAENu+9wNMxsLlc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731477437; c=relaxed/simple;
	bh=O7gqBIX0ZmWwreqBCyMvR1yaKp3Xm8Cc4L0dr2JTvLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JgVGsZUL5832Ga8FrSrg+7+9AsmkUM4G9XOWLASvq0scW8HONKN/g1Aql4uiCcTCxgfbxK64nge5LQr0XccmQ1eIXhJ5B2dFNVu1kmmjvD1OFqw7NYeBheDkfQ4anCPlXd+1+u5rL7sUahpNLcuWKmp7Cs/CSXDZda+jxVVAci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZWR+o+L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E5F5C4CECD;
	Wed, 13 Nov 2024 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731477437;
	bh=O7gqBIX0ZmWwreqBCyMvR1yaKp3Xm8Cc4L0dr2JTvLQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CZWR+o+Lu+5Aw9uon1pwiA75/0Joz2ADugOcTdxCbJ881H6/Z4zOl5HmrvE/mX5tb
	 roBqvg1KZ2AIvOzADyi+8HUQWdQ8KzLVydHfhCKv05bcNAie1b5zji58k1DsCA0d5r
	 G9ytt6fquRWvh7Djxsjn6McmKpfViu1jHf5KVqfCDYsTOMk+aysvX7SutV8/dY6Ads
	 V2WXoJIxmv+ZzrlhFw/w1aohb3oLZLAeE71mNCqggdcVhhoQLqFyLC7X3KQgyhXT/s
	 Hm26ncTMnEX7RheVsj3bECTRYw5tOejhnU2CvQJLAqObOtQuVre4P6TpthuRTrVDk7
	 z8sMEphAhJquA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBCCD41C03;
	Wed, 13 Nov 2024 05:57:17 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 13:57:15 +0800
Subject: [PATCH] rtc: amlogic-a4: fix compile error
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-fix_a4_rtc-v1-1-307af26449a8@amlogic.com>
X-B4-Tracking: v=1; b=H4sIALo/NGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0Nj3bTMivhEk/iikmTdNCNTgzQzs+SkJENDJaCGgqJUoCzYsOjY2lo
 ApYvmJ1wAAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731477435; l=945;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=km3rlhnqX3L3e5tGM9lHtBkDGz74vs84O5QvGvcNq3Q=;
 b=b1Q7RSfPcsZpytS289JQq6mN7s74d5X8tq1pCZ55i6rFYYxvpDpxHymaqLU8+EA/IhvpLyWxm
 Qr1XBoOtnpCC4zGgIjJDji//eLP/BK1T0C3bsB3haTr5hHZsMHo/RQN
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

When compile rtc-a4, build error as following:
ERROR: modpost: drivers/rtc/rtc-amlogic-a4: struct of_device_id is
not terminated with a NULL entry!
This commit is to fix it.

Fixes: c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/rtc/rtc-amlogic-a4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 4960790c4b24..2278b4c98a71 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -445,6 +445,7 @@ static const struct of_device_id aml_rtc_device_id[] = {
 		.compatible = "amlogic,a5-rtc",
 		.data = &a5_rtc_config,
 	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
 

---
base-commit: eb4ffa40010472dffdc276da307161545aab45a3
change-id: 20241113-fix_a4_rtc-f250f66cbb11

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



