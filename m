Return-Path: <linux-rtc+bounces-4652-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD75B1EC06
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 17:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C3EAA2886
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 15:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C4A284B36;
	Fri,  8 Aug 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxLYtShJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D7284694;
	Fri,  8 Aug 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754667066; cv=none; b=TLU6B65mVmMPEAWQzyRqTdnPeMgsPZWz0Xa45XwLlK9oIHgk/9NLFgV8kQ5x+IcIAC802FxTPSgoaQTBL8A5DwCYASl6J2L1nxfdTOgmg6Se6kyBituyRCF83WDRWc+LA97CFHr49MPeyd2xct6kHbFw5XL38Jea1UkyjiuUQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754667066; c=relaxed/simple;
	bh=aSv7IfuSV2DGNVTwjun7tcNqDuSb6Q6Tn95zAy0hwfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=It/EDM2EAj0wPHb8iw9RbgnhPShaGKbea+GPFXpR4Gi0B+lwsmMkyFVHxOzMJHzPFHQZVvTpyrI6IQVkXk9v/uer1f8rSxOwY2RzWlEkVbopAqz5Y3E17hFHJF/FGtk/UU3o/JoQV8DFfLp/wpQyrUfo3EP1bvcjNXs6aZWqb4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxLYtShJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45BDC4CEF4;
	Fri,  8 Aug 2025 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754667066;
	bh=aSv7IfuSV2DGNVTwjun7tcNqDuSb6Q6Tn95zAy0hwfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxLYtShJXI5QEYTAaZCvGGOMhlejzdCmTy9XEMqtOJtt++4Cw0dbM7n40RRLfRtsi
	 fOF/j9kS8kHKcjx+a9nMfrQMpLKNgul3BryZRKKuxhYescmjNqHgjN8oD2WafTB6nZ
	 tkC8tfqSY6HVeLHKRzGBuhMFppvTJvKvj3Q9qKZwumPJ9X4SRxNmRBqGiBYdl+z2eV
	 4OpEtfky9aynXUKY3Yjp+CbQUVhKnQr6IIxS1214NcBWS1hzy2N2ttgYDOEVeNNIHm
	 hvQ3ezRZf8VycB9bC/EGqgCTruwfDbg8kKNSNIHSIsLAbnoQ8HN3jVm2U7B2951eWA
	 jZn2q0KUTAkcw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Tyler Hicks <code@tyhicks.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.10] rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
Date: Fri,  8 Aug 2025 11:30:45 -0400
Message-Id: <20250808153054.1250675-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808153054.1250675-1-sashal@kernel.org>
References: <20250808153054.1250675-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>

[ Upstream commit 523923cfd5d622b8f4ba893fdaf29fa6adeb8c3e ]

In using CONFIG_RTC_HCTOSYS, rtc_hctosys() will sync the RTC time to the
kernel time as long as rtc_read_time() succeeds. In some power loss
situations, our supercapacitor-backed DS1342 RTC comes up with either an
unpredictable future time or the default 01/01/00 from the datasheet.
The oscillator stop flag (OSF) is set in these scenarios due to the
power loss and can be used to determine the validity of the RTC data.

This change expands the oscillator stop flag (OSF) handling that has
already been implemented for some chips to the ds1341 chip (DS1341 and
DS1342 share a datasheet). This handling manages the validity of the RTC
data in .read_time and .set_time based on the OSF.

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Reviewed-by: Tyler Hicks <code@tyhicks.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Link: https://lore.kernel.org/r/1749665656-30108-3-git-send-email-meaganlloyd@linux.microsoft.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Bug Fix**: This commit fixes a real bug where the DS1341/DS1342 RTC
   can report invalid time data after power loss without properly
   checking the oscillator stop flag (OSF). The commit message clearly
   describes the problem: "In some power loss situations, our
   supercapacitor-backed DS1342 RTC comes up with either an
   unpredictable future time or the default 01/01/00."

2. **Data Corruption Prevention**: Without this fix, systems using
   DS1341/DS1342 RTCs can have incorrect system time after power loss,
   which could lead to data corruption, incorrect timestamps, or system
   malfunction. This is particularly critical for systems using
   CONFIG_RTC_HCTOSYS.

3. **Minimal Risk**: The change is very small and contained - it only
   adds OSF handling for the ds1341 chip type in two switch statements
   (ds1307_get_time:282-287 and ds1307_set_time:380-383). The pattern
   exactly follows the existing OSF handling already implemented for
   ds_1338, ds_1340, and ds_1388 chips.

4. **Established Pattern**: The commit follows an established pattern in
   the driver. Looking at the code, OSF handling is already implemented
   for:
   - ds_1338: Uses DS1338_BIT_OSF in DS1307_REG_CONTROL
   - ds_1340: Uses DS1340_BIT_OSF in DS1340_REG_FLAG
   - ds_1388: Uses DS1388_BIT_OSF in DS1388_REG_FLAG
   - And now ds_1341: Uses DS1337_BIT_OSF in DS1337_REG_STATUS

5. **No New Features**: This is purely a bug fix - it doesn't add any
   new functionality, just ensures existing functionality (reading valid
   time) works correctly after power loss.

6. **Previous Similar Fixes**: The git history shows similar OSF fixes
   have been made before, such as commit f471b05f76e4 ("rtc: ds1307:
   Clear OSF flag on DS1388 when setting time"), indicating this is a
   known class of issues that needs fixing.

7. **Hardware-Specific Fix**: This only affects systems with
   DS1341/DS1342 RTCs, so there's no risk to systems using other RTC
   chips. The change is guarded by the chip type check.

The commit meets all the criteria for stable backporting: it fixes a
real bug that affects users, the fix is small and self-contained, it
doesn't introduce new features or architectural changes, and follows
established patterns in the codebase.

 drivers/rtc/rtc-ds1307.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 5efbe69bf5ca..7a60e5ca2b8a 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -279,6 +279,13 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 		if (tmp & DS1340_BIT_OSF)
 			return -EINVAL;
 		break;
+	case ds_1341:
+		ret = regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
+		if (ret)
+			return ret;
+		if (tmp & DS1337_BIT_OSF)
+			return -EINVAL;
+		break;
 	case ds_1388:
 		ret = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &tmp);
 		if (ret)
@@ -377,6 +384,10 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 		regmap_update_bits(ds1307->regmap, DS1340_REG_FLAG,
 				   DS1340_BIT_OSF, 0);
 		break;
+	case ds_1341:
+		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
+				   DS1337_BIT_OSF, 0);
+		break;
 	case ds_1388:
 		regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
 				   DS1388_BIT_OSF, 0);
-- 
2.39.5


