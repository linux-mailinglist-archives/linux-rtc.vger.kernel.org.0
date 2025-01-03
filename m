Return-Path: <linux-rtc+bounces-2825-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0ADA0049C
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 07:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F6A162D20
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 06:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D10F1B87EF;
	Fri,  3 Jan 2025 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e19yS4YD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119EC19E999;
	Fri,  3 Jan 2025 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735887477; cv=none; b=hhFAyqLwORN3siQpCq+7STRuXT7W841oFwVFBq57BG8bPVu+f6toHOdqQxozjRH2aTq13SxVxgDk7Tf/dr0p7e/BYwem/71cchDuTva3ZiFaUmmr46h0UGFSpFqCuY/0RG97haoBaBNQAtU4chBZ0gPxilD16pkedQlxZtLib9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735887477; c=relaxed/simple;
	bh=jdxHvjuFL3Z1KgXxrlmqLozw/Gwy+74Oep59dG14Ue4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KtcdaVwqQZF3d1kJznAUpyxJIHmvXayQBwl9S5F+tm2Z40TWm7ZsztLZxYrN0V/HDC95guGhRtS7WqFueRFPpDF6BVhms62aebatSH1FAd0iGjEN5rK9Yg17T4XDE4/RXNev+2yjKjqOhAfpdou1FqLC/O15L8va8w9gGAY0Z0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e19yS4YD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95956C4CECE;
	Fri,  3 Jan 2025 06:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735887476;
	bh=jdxHvjuFL3Z1KgXxrlmqLozw/Gwy+74Oep59dG14Ue4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e19yS4YDS6gBRmgYbUtaLXCyORJnoHcFusLwul/5FX+Z9dEibJFQeZsUSuaiEArSk
	 0UlG9MizkIVhGma2b0NzW+RzRa1aYeqwnagJeRNLFTep3EJ3ZvPZUcj604VPDQHV0C
	 hpH6tNrrik0ukugpwSgVhybKX7o6XSR9IDFFf7Ri6fL+HuDsHNHg7S6HEcLB5MrenK
	 jLlrqMRz3Ftf/R5ZINvUo3M00PP2d7Pu2tUzsBAIeGad7SuoUzKkzCMzFRfkJJCGY9
	 I1Q45GZnl1uA72L1EJ3i6b1f08/CmnXmC7Jy9yPnTGo5qIU+0M8pzlZiefjWa2C4UV
	 wKFAsKApCDEkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8464AE77188;
	Fri,  3 Jan 2025 06:57:56 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Subject: [PATCH v2 0/2] Add support for MAX31331 RTC
Date: Fri, 03 Jan 2025 12:34:18 +0530
Message-Id: <20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKLd2cC/x2MQQrDIBAAvxL2XEFdbCBfKUVW3TZ7SCLaSCDk7
 5EeZ2DmhMpFuMI0nFC4SZVt7WAeA8SZ1i8rSZ3Bauu00agoJV/3nLfy8wsdaBCN/8ih+OlCCBR
 HTAQ9z4W7/q9f0Cy8r+sGrcpK424AAAA=
X-Change-ID: 20250103-add_support_max31331_fix-e65bbbac73da
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735887863; l=1003;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=jdxHvjuFL3Z1KgXxrlmqLozw/Gwy+74Oep59dG14Ue4=;
 b=DdvvlnW5b4ktUmdeApxFEkJNF+ur0ukx8T6FdeKhDpjDHLllsq6Iuz9xoy0h9V2yCnWikhL8C
 esbXOIZt0DhAmD9OFbUVesS5b71sDlXl/tK7nCvrCW6e8H7kOcIcogX
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

This patch series introduces support for the Maxim MAX31331 RTC.
It includes:

1. Device Tree bindings documentation for the MAX31331 chip.
2. The driver implementation for the MAX31331 RTC.

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
Changes in v2:
- Fix issue with device tree binding in v1
- Revert a header change in driver code
- Link to v1: https://lore.kernel.org/all/20241223-max31331-driver-support-v1-0-f9499bd598f5@analog.com

---
PavithraUdayakumar-adi (2):
      dtbindings:rtc:max31335:Add max31331 support
      rtc:max31335: Add driver support for max31331

 .../devicetree/bindings/rtc/adi,max31335.yaml      |  32 +++-
 drivers/rtc/rtc-max31335.c                         | 182 +++++++++++++++------
 2 files changed, 157 insertions(+), 57 deletions(-)
---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20250103-add_support_max31331_fix-e65bbbac73da

Best regards,
-- 
PavithraUdayakumar-adi <pavithra.u@analog.com>



