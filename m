Return-Path: <linux-rtc+bounces-2851-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D113A07303
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 11:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B085F3A9461
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 10:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397F2163AE;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPj2xIX6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62933215F77;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418229; cv=none; b=pt9mM7wNJOmhL2pmLZDzGypzS0bU6uGYOiS5hyggsWz1DLiwexv5msnVQKCR2GZzgbkPEYJww0kWeXd/9JNxLhxuMtOfXLaJ1s9OlMtiuJ+i8vVKifV2YRPzo4AgMxfgQCoNpNdx7dsfe2t3P754berL4gE2kGL+X9T46SJZg5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418229; c=relaxed/simple;
	bh=xRRlLnDdNPgPN0sW40gnB6StZmB2oxUH4YZ4q2xE94g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h9A/drTG1tJaGTWnRURL6bbyxRxzKOBAV7GaZNYW0S9Lse7kq8i6gENnj9kiizA5H8Mq9JUUJYGUG/o/WTfly8b6jCgjGZHX8ogA7o96KGQzT81tVmAUpndgrB+XZIIu/RTxNISUIRCC+5v+LYuF5TNShld7X9CLo51PQAxfgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPj2xIX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 054C2C4CEDF;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736418229;
	bh=xRRlLnDdNPgPN0sW40gnB6StZmB2oxUH4YZ4q2xE94g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pPj2xIX6r+UbHzT6NqaVtiRrFfHwo67TNoNUMn6fY20eI0xr5+Ij1Q52uewY8kuF1
	 xlQrFgqWTT9gDYyaX7yTzmDRtnTKEv3hUtSImrTT/PA+BtFej5rPk7tkhXNG7hIioQ
	 7lPgz7wmXdK/3C86Y4W7ccTAUJ6x9zg/9GfKZw528Iu0X7FQrQEc25BeAgG8Uim1Do
	 794+6O1jihuCCfnsc5mlhALO9b47+sd5P8PbNVpxtMdjiisgXKlcnEL2uSCkbWS+6b
	 bKAttBt21OhtGpk32f4cKQnocDGiRTRPHMAyFjLzQDEMjQsrzW3CPX/B0QjDyfV7D/
	 zsEOTh5VzHswg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED606E77199;
	Thu,  9 Jan 2025 10:23:48 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Subject: [PATCH v3 0/2] Add support for MAX31331 RTC
Date: Thu, 09 Jan 2025 15:59:56 +0530
Message-Id: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSlf2cC/x3M0QqEIBBA0V+ReV7BcSqwX1kWEZ1qHirR3Qiif
 1/p8XDhXlC5CFcY1QWFD6mybw34UhCXsM2sJTWDNbY3aJwOKfn6y3kvX7+Gk5AI/SSnJx2Hzg4
 uWIdsoA1y4Rae+RsOgs99/wHD5wokcAAAAA==
X-Change-ID: 20250109-add_support_max31331_fix_3-c64269a291e0
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736418610; l=972;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=xRRlLnDdNPgPN0sW40gnB6StZmB2oxUH4YZ4q2xE94g=;
 b=4GCBlT93CXnIsbRyC0BuHL+gbpS66b3TFeG9oR8Fm+DX2rrDJtXvI0Kqi/m7pw1VFUU/VR+mp
 cC8CaW+9uSvCUdiXv4wsIL0egnWIWg28MgxEjuQHzPPqUmZLzLSG4I3
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

This patch series introduces support for the Maxim MAX31331 RTC.
It includes:

1. Device Tree bindings documentation for the MAX31331 chip.
2. The driver implementation for the MAX31331 RTC

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>

Changes in v3:
- Address review comments
- Rebase on v6.13-rc6
- Link to v2: https://lore.kernel.org/all/20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com/

---
PavithraUdayakumar-adi (2):
      dt-bindings: rtc: max31335: Add max31331 support
      rtc: max31335: Add driver support for max31331

 .../devicetree/bindings/rtc/adi,max31335.yaml      |  22 ++-
 drivers/rtc/rtc-max31335.c                         | 163 +++++++++++++++------
 2 files changed, 138 insertions(+), 47 deletions(-)
---
base-commit: eea6e4b4dfb8859446177c32961c96726d0117be
change-id: 20250109-add_support_max31331_fix_3-c64269a291e0

Best regards,
-- 
PavithraUdayakumar-adi <pavithra.u@analog.com>



