Return-Path: <linux-rtc+bounces-2939-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26072A160C4
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Jan 2025 08:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A625165771
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Jan 2025 07:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E69A194A60;
	Sun, 19 Jan 2025 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+/ZpdQg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8618F4A;
	Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737272494; cv=none; b=ZA1ydjMuiT/viX8gVT3QKplIRJoenakXpUdNPZhoSLQgeWYsbeFE4F7aHyXuPXB1CC47TbhQ899M5qbH58tFwzWqqojEyS5LJh82ZbLQUoWPm6+OsxxzQeM1Uc/mbbRbLwuneqFkVvRpsUzmloPP5P9ZkaH5kK3PDz0fjnxXYEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737272494; c=relaxed/simple;
	bh=CIKaCZcT16a6tJEODh7bzMFplHmaUEsUgpKbCILga5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FFRr+VopdyuiojEssp1Fhiuwc1uLXi9XpcqDBAeAI4hTqETSmjwyKh76Zva5rTOTl4X1q5UVNpkBvvOylYLJI7+rxz+J3fL/cuamxXATtKF5h56ZkkgJzkH1U2Y57YosJDdHyABlFhlRNwyg0kCWlYR+KyvZpp2v9og/kfha6L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+/ZpdQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 530CDC4CED6;
	Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737272493;
	bh=CIKaCZcT16a6tJEODh7bzMFplHmaUEsUgpKbCILga5I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=K+/ZpdQgLlnAWJkQWc0tElChx2KOblS4RXv0gd6hWdSsUTC+Ay0i5jJn0lzhY5MiA
	 bWda5Ks0Fttvol41yOkeX3OO3crs9rj+hz6vMOC4KplZEYRxITfv6Jxa+VcLJ9oqGg
	 ETIEfFD7WpneGTRBETC2mtBKR5oTnWuKb63mT8iLVZYuRhLGDuy4mCU8K9RErYi2Rr
	 TO30n+fo4akAOvtQGsDgzsE1LxQVmA/fFqe4F6fijpGkz77L81LUypZKGfhq2qlEs4
	 8skJJsGe9FssgDegC2zJ8f6f7eN942RdP0v5vMLn1reW3D00B7KaNTWKjBsL8XSTVK
	 Cmyqms/k+aiJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ECFC02183;
	Sun, 19 Jan 2025 07:41:33 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Subject: [PATCH v4 0/2] Add support for MAX31331 RTC
Date: Sun, 19 Jan 2025 13:17:37 +0530
Message-Id: <20250119-add_support_max31331_fix_5-v1-0-73f7be59f022@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABmujGcC/x3MTQqDMBBA4avIrA1k8qPEq0gJqRl1FmpIWhHEu
 zd0+fHg3VAoMxUYmhsynVz42CuwbWBaw76Q4FgNSiorEZ0IMfryTenIH7+FS6PW6Ge+vBWuM+b
 dW9krN0EdpEw1/OcjnAZez/MDaJ0/uHAAAAA=
X-Change-ID: 20250119-add_support_max31331_fix_5-9644b750729c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737272867; l=1840;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=CIKaCZcT16a6tJEODh7bzMFplHmaUEsUgpKbCILga5I=;
 b=3O14u94m49fkw3rv39FXa5CDj0/G6POCiCUDTazBHUBouSv8Wxmt42lv959ikYDoCzjdkdX8Z
 0LzBej+o747CgW9Twe3hc8r+KQ0+3d9X4CtQu5Jz0QZhh+10GD/2GaD
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
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jean Delvare <jdelvare@suse.com>
To: Guenter Roeck <linux@roeck-us.net>
To: Nuno Sá <noname.nuno@gmail.com>
Cc: linux-rtc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>

---
PavithraUdayakumar-adi (2):
      dt-bindings: rtc: max31335: Add max31331 support
      rtc: max31335: Add driver support for max31331

 .../devicetree/bindings/rtc/adi,max31335.yaml      |   4 +-
 drivers/rtc/rtc-max31335.c                         | 165 +++++++++++++++------
 2 files changed, 125 insertions(+), 44 deletions(-)
---
base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
change-id: 20250119-add_support_max31331_fix_5-9644b750729c

Best regards,
-- 
PavithraUdayakumar-adi <pavithra.u@analog.com>



