Return-Path: <linux-rtc+bounces-1832-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CB969476
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7B501F23EB6
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0BB200104;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKGBRKrI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A9B1D61B4;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346847; cv=none; b=jRKjs8z5oChik1UtOuFpi5AopANzxkbb5I5os83PUhDFXFa+/AS1S4ZnWPfA9XbB0oCd1/NiYBxCvvY71/zG/w4S9haM4QxlFcpt6SWQOcAxzePkZhkzrjcWAznGBCbBWIdZddZtIkRhcESZyXvclGMhuUwDAnFva8Oj53HLd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346847; c=relaxed/simple;
	bh=i8gz704Qm8ya/o5dE5ZS51DTR2abXR44TQSYVdI/Rvs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dP+3qh9J/37S4GVKlWpXwKeKK64/sS4Z/nsL0nCEdWZF0fj3UBJPfA+WOyDx/YkeyE2QGzvwEmeZFaSyANYOtwtc3n4EezBngO1dD5v1Kw7UErhzd+fruJDDljXU9pAaNBit/RAsue6g4rtdh5zu3yB04v5rRuRkzqG+Nn6Oxec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKGBRKrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC8B5C4CEC8;
	Tue,  3 Sep 2024 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346847;
	bh=i8gz704Qm8ya/o5dE5ZS51DTR2abXR44TQSYVdI/Rvs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LKGBRKrII2OnJLG+xXOoZkNmjg6ze4cKMSaiXzuWwfs54t9MpoQNyiJY53hOM9vF1
	 P0BSAB5H3OB32JWIGGSIpDn9PJEpMw74aiw4LIOuBMiUJ27M8dqZxbpEPfhRu6YKEB
	 IACj7LUAIOA5eQzky+tR77KMruu1NmhfOjL/tRqqJBe9KE7vwBDQ25kqgO6FsS2cWv
	 guBMvZK+JNEklUnPYk1+ik8c524795jjmqPnRAFKXY4sBNPy7AQHztSpu3Wvha4j/b
	 v6QFVCoCAycvdqRDDIoFaY54zm9+2WU1MI4cAjAkiJv41w74D6fflQCt8I6cyRnUps
	 /rSW7lEVqtrow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D3ACD342F;
	Tue,  3 Sep 2024 07:00:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] support for amlogic rtc
Date: Tue, 03 Sep 2024 15:00:44 +0800
Message-Id: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy01mYC/1WMQQ6DIBBFr2JmXRpmaCrtyns0LgigTlKlAUNqD
 HeXuuvy/fz3dkg+sk/wbHaIPnPisFSgSwN2MsvoBbvKQJJuUpMScbUCqbVO44MMKqjPT/QDf8/
 Kq688cVpD3M5oxt/672cUUtyHViqNzpBWnZnfYWR7tWGGvpRyAFKqYPSYAAAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346845; l=1168;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=i8gz704Qm8ya/o5dE5ZS51DTR2abXR44TQSYVdI/Rvs=;
 b=PUa5Yy6NzJIV4PQ0E3FCZ1uWMcAzPrDAK3DadDyPFeWCAyJhZd0yCH21KZg7uBVsNtp/en4hi
 q5T0DfLtl5qCcRhzV271WF0t/jm/Ub6Xg8GeoRYlm6eW6yj2G/j74Y9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A113L2 and A113X2 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Modify bindings clock name and perfect the example.
- Fix some bug in driver, and use dev_err_probe instead of dev_err in probe process.
- Use RTC API to handle calibration.
- Remove unused func and rename driver file name.
- Link to v1: https://lore.kernel.org/r/20240823-rtc-v1-0-6f70381da283@amlogic.com

---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 rtc
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../bindings/rtc/amlogic,amlogic-rtc.yaml          |  66 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic-a4.c                       | 481 +++++++++++++++++++++
 5 files changed, 568 insertions(+)
---
base-commit: 3047c9a740816d5a930c8c741c3932a3544267f2
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



