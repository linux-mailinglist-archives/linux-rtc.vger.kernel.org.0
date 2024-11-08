Return-Path: <linux-rtc+bounces-2472-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE99C1632
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 06:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03884281D05
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 05:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE64C1CF7C1;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shxcgGRT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3721CB333;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731045290; cv=none; b=ajafFAerV1y/UBz71qvQiwxyVjXGRcwy+O9Fo+kQPAREhq0r6O6OXxf6Q/nH8m+++OfUZ5iGdpEhL2B54k/lI7FlYwfWfJIAjNayhJ3ywlibct9sTvb92cqKZArURtMgA7xkCrz9i9/jGpzOyK/DobFyq2O0Eu3yWpKNLS92rso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731045290; c=relaxed/simple;
	bh=Y4CwMwPQuIcU9wjKisRuEikA8yK46OIFjAflX16ws80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCcGbBRhsn/7fqg86oMMKnPNY0JG+hU1rumS204I+CRr3Griik7B97SNk0zXkA/xVi78xx29eMU3kCxBl5Zpj8QAmYNzEvku/o3j5q2Qe/LuO5G4E1ubiihfNc0MRoALRSP+e7yK5IT0sGps8RVuWMpv7ib/z1W9c//RggDrz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shxcgGRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08C2EC4CECE;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731045290;
	bh=Y4CwMwPQuIcU9wjKisRuEikA8yK46OIFjAflX16ws80=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=shxcgGRTmacMyTpjGSaJWRS6iK/Bx9lHAHgM1quxNTYHRpypU/9SsvTiIfPZbfm83
	 OnqfPKhua8smLOI4ZV6TNR7fxVNS8jrTfSkGE9Czc1zZe8rWQfyOnoxWEEMQlvHMY8
	 v5HV+guG7c99gzwdiz6c4GRHEHWu7gF6GXiU6XBtRqmMsQJ6kFYio1ks3naVh9A6nu
	 Tg0MLNgTCodgUuTuWXoNX2FEHXsogC0gXUqzn5sJphpEULZ1Rw5ilvztQ89Wq8vPBr
	 ktMbUx+sivy1QUZ9UmbE6+MudN0O/t46Eh/bQmsSfOI5BqkpGJ6ILleQ+Z9rxQR3U/
	 wGh4SyPHAzzCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A5CD5E136;
	Fri,  8 Nov 2024 05:54:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] support for amlogic rtc
Date: Fri, 08 Nov 2024 13:54:40 +0800
Message-Id: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCnLWcC/2XMQQrCMBCF4atI1kZmJk2TuPIe4mKapBpQK6kUp
 fTuRi2ouHzDfP8o+phT7MV6MYoch9Sn7lyGXi6EP/B5H2UKZQsCqsCSkvnqJZLxwaIjRiXK5yX
 HNt1ele2u7EPqr12+v6IDPq+/fkAJsm4NKIuByaoNn47dPvmV707iWRjooxzMiooCHVgbrRsb3
 L9SXwrhrVRR2DIYw7Vjgn9VfSmaVVWUQ466baqogv5V0zQ9AHxC7B46AQAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731045288; l=1783;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Y4CwMwPQuIcU9wjKisRuEikA8yK46OIFjAflX16ws80=;
 b=jNGWNeJoco9mLfZbzE2NrkqAIYDH1CSdtYucDI0JEHejYpvcKvY4w66zcRCS9Mb/K3YCtBcUj
 hkfwvRfI3bkB02bbKqR3yXYI6kKWxsGkcNT9ClwgDaq+OXPLCFZvPrc
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v5:
- Some formatting adjustments and minor fixes were made based on Christophe's suggestions.
- Link to v4: https://lore.kernel.org/r/20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com

Changes in v4:
- Keep the same order as as in properties.
- Link to v3: https://lore.kernel.org/r/20240910-rtc-v3-0-1fa077a69a20@amlogic.com

Changes in v3:
- Perfect the binding description and rename binding.
- Using dev_err_probe function correctly, and modify commit message.
- Change placement about MAINTAINERS.
- Link to v2: https://lore.kernel.org/r/20240903-rtc-v2-0-05da5755b8d9@amlogic.com

Changes in v2:
- Modify bindings clock name and perfect the example.
- Fix some bug in driver, and use dev_err_probe instead of dev_err in probe process.
- Use RTC API to handle calibration.
- Remove unused func and rename driver file name.
- Link to v1: https://lore.kernel.org/r/20240823-rtc-v1-0-6f70381da283@amlogic.com

---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    |  63 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic-a4.c                       | 476 +++++++++++++++++++++
 5 files changed, 560 insertions(+)
---
base-commit: 8a2c49e0fd92e6760636bcfbf11e11d9ddd61cf9
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



