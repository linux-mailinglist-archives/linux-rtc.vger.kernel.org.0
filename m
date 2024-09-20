Return-Path: <linux-rtc+bounces-2036-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB897D016
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 05:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 714C8B2299A
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 03:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9B918EB0;
	Fri, 20 Sep 2024 03:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfdGNfJs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B02125A9;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726801859; cv=none; b=aFTy2PY/cudQ2J//PwWzLnPO7iTnzUyzTMWi6CxWNG2NENzxjWHK5ICl/bgRht/cLKzVoYLEirrQ6N8c8Q+ZmAn/P8MP1TaJmzcYpQnSC4i9gRsqZcZrlCqNiYAHAP5bqrC2/x+3tsfHVEbI7Ifov/qWSrcXBZZ8NPf4UBky+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726801859; c=relaxed/simple;
	bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YjPfr7qMgE70znuSfg4YtuMmQcW+j+2cfRvSupajybnzli3LB6Q102kxhQbjm9KAlXJDLBWyl1OaZGaoaHM0mAfE2kyamoLW/8IziI26+wgc8GAtLjKYQshWvGSL8JYm9o9L347SF2XLYFWSvjfj5bBm1OEeDlkPsZ6yVIxNYqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfdGNfJs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A4E3C4CEC7;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726801858;
	bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FfdGNfJs3xXrogoLROEuJoEXYY+YfKX+S+FpOH8f31+FsKqApheF+v8ga1Xm0iWOK
	 ScRiCJ5XFNoP1E01uvRBj7NnVRUkEEgAoqkAE17160V37FxUlqrHfqkVXzJz7VH9NG
	 ImMCkjPNxHDhrU7l3umu52l8Fc2BES8uIk2tTNLliKguFbBcjeLHBQ1e5WDl2ful+L
	 TuSq5zSXX6hiKH3PiBPqH4w+n0nUfrxctIPKBkRNNZt6foO6ZlC9WOLDeIJ5JrFG+0
	 XE0qG3YcCsF/cHWAHr3eIaei9VOrjv9xXhHVUOrUdrdOhJwj8odfMM4twRrUPxfwjU
	 3AoMiZpIhdz8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59307CE8D62;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/3] support for amlogic rtc
Date: Fri, 20 Sep 2024 11:10:55 +0800
Message-Id: <20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDn7GYC/2XM0Q6CIBTG8VdpXEc7HESgq96jdUGAypbS0Lma8
 91DayvX5Xd2fv+J9D4F35PjbiLJj6EPscuj2O+IbUxXexpc3gQBC1DIaRosZSitU0yjYZzkz3v
 yVXislfMl7yb0Q0zPNTqy5br1I6NAy0oCV8wZVPxk2lusgz3Y2JKlMOJXafgozAqEM0IKcVVO/
 yv+oxi8Fc+KVQakNKU2CFs1z/MLl/npkwQBAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726801856; l=1589;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
 b=uJD6SDKCaARt2GvUkVjfOKpc3p7WmcpKrCtYamVgKYVkmUJ8p1FcbSC4CVK4F9Ux1yqBEhbFw
 6RjgR8C9736B16+Tc8Ez4mzGpMAqE8qnuEJpdWbEb+vCysWBazzrZTE
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
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
 drivers/rtc/rtc-amlogic-a4.c                       | 473 +++++++++++++++++++++
 5 files changed, 557 insertions(+)
---
base-commit: 658b3fec5fc0ef3c016c4a7eedac1a5f3b8c0151
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



