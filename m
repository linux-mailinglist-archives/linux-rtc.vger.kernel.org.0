Return-Path: <linux-rtc+bounces-3081-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6FA23D48
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2025 12:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5CA21883A86
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2025 11:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865ED1C2457;
	Fri, 31 Jan 2025 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0p9i2Qs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332A14A099;
	Fri, 31 Jan 2025 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323979; cv=none; b=YIGi5jXEQyR2jUJsZujd4F1WsgwRGgZ6zysSvjqaU1wXKl5CEQjFMSNxLfK/76Q8+M6LzSSWC6qmhJObBp5kmGJwZ19sS5aw2XpuyGKtm78RGoBpVYvi+pX+k+EUg1QKgw5k5EVpCRtL2xNsHVfzsXcRh+A/FwARP+RVti7rlZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323979; c=relaxed/simple;
	bh=qpv5Qe5UupEfbrdlYqJJRSVBIxpIAPSkVz947qQECY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ufaFwPaA21VJBkRmBrb0QCaPqxeQ//pUX/oWVAXehFqZsxLsiQA5dMFB1o6P6HA7pWqhZLnPQqCfLXJpD7u9frFvJc5T6mcF0rg+Fhd2/R2IUPHRVrBLoGvO9WTgKfdDeB/vjuJS2ebjpSBt+MkbPfXlp7SaMUKBUE8WmO5cxwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0p9i2Qs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABCD6C4CED1;
	Fri, 31 Jan 2025 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738323978;
	bh=qpv5Qe5UupEfbrdlYqJJRSVBIxpIAPSkVz947qQECY0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I0p9i2QsF+vu122iLNpgNAuy/HuJceDbdRueQO9zaBi+/FssgubSJitWyRrQtvAgu
	 xePYBug3lCB5wiqNv2FzpNm4foyNn+ZZWYujXMcOp7S8olI2jnMZpxtGrUPhAo/jda
	 Op3W5Zi266DZN6gVtgSL8nJFiMdIQGEFpyV1LVxMWcdbjgvVfpMyOt6b/AAhSWDYoX
	 DJV6dzG31CmKyun80qeRL+1JOLY3YXgp3mCRAid3y93rqJJHMRnAJq5+/gHQPrklB3
	 ygrSi1v++GTMD752YIi4g6KrGbE/HyK2sB8fOAYNcwF48thKoFEPeVYhne4qde3J07
	 Om64vSG1uqbkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D404C02193;
	Fri, 31 Jan 2025 11:46:18 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Subject: [PATCH v5 0/2] Add support for MAX31331 RTC
Date: Fri, 31 Jan 2025 17:22:13 +0530
Message-Id: <20250131-add_support_max31331_fix_7-v1-0-d29d5de3d562@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG25nGcC/x3M0QpAMBSA4VfRubZyNkNeRVpjB+cCa0NK3t1y+
 fXX/0CkwBShzR4IdHHkfUvAPINxsdtMgl0yyELqAhUK65yJp/d7OMxqb4VKoZn4NrVobDnoWo5
 V2QyQBj5QCv+8g0tD/74fJd9dv3AAAAA=
X-Change-ID: 20250131-add_support_max31331_fix_7-8a4b572c648b
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738324342; l=1589;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=qpv5Qe5UupEfbrdlYqJJRSVBIxpIAPSkVz947qQECY0=;
 b=nnlwZTb3xL5G3PEcUYBFYnaFSrqJv+ju4ecJafx1/BJ6gjvZKwnfMTQJR0uHsRqHLKAHY4v+w
 xq3AgtxJi/BCpIZCCqI9worHBVTai8cM/winyyMn8nXrDJhkfmabdgK
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

This patch series introduces support for the Maxim MAX31331 RTC.
It includes:

1. Device Tree bindings documentation for MAX31331.
2. The driver implementation for the MAX31331 RTC.

---
Changes in v5:
- Removed the commit description stating max31331 and max31335 are compatible. 
- Rebase v6.13
- Link to v4: https://lore.kernel.org/all/20250119-add_support_max31331_fix_5-v1-0-73f7be59f022@analog.com/
---
Changes in v4:
- Reverted the I2C address change for MAX31335 RTC (0x69) and removed it from the property register;
  will include it in a separate fix.
- Added id as a member of struct chip_desc
- Rebase on v6.13-rc7
- Link to v3: https://lore.kernel.org/all/20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com/
---
Changes in v3:
- Added missing spaces in driver code
- Removed binding for checking address
- Rebase on v6.13-rc6
- Link to v2: https://lore.kernel.org/all/20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com/
---

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>

---
PavithraUdayakumar-adi (2):
      dt-bindings: rtc: max31335: Add max31331 support
      rtc: max31335: Add driver support for max31331

 .../devicetree/bindings/rtc/adi,max31335.yaml      |   4 +-
 drivers/rtc/rtc-max31335.c                         | 165 +++++++++++++++------
 2 files changed, 125 insertions(+), 44 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250131-add_support_max31331_fix_7-8a4b572c648b

Best regards,
-- 
PavithraUdayakumar-adi <pavithra.u@analog.com>



