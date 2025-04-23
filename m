Return-Path: <linux-rtc+bounces-3989-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A289BA98A5A
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D1C3B6ED4
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F00A84D34;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdUq2DRh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D852F88;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=O9nw6p1zS3khvcckwH27e0TGizfkLke/QDkcLhOp8UuyiF0T5MCI1H12CsY+8IS4n1NmdZ4ki3C5I5ZGySEf7ql8pxvYiU2NukyrMd9W5+tT2kIEI30YThqLULgjzjvpHsz8EGjlyeDPZ1vfCoab4QKxDWEd/aLlx8jTl1eZOis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=6NOXLmtGIRXsKgoQuMPbFlY7gnc/c1uKEyPPW1IlV8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zbr4+HwIsUvbeeBpNic+FS/mKTUF4y+L18XZHj+oppIEKi9jtuxdfZoD3H7ZOsBw1sTYXf19XjNHvyPlJKyyxYUZvzWy1j1ZHTjTE7pjt64n/FoNerGu/rbujnSV1dbxGDqn+Sw93114MZy25Gzkx+QVsnKI+ZcHxOYcbBae07A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdUq2DRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50ACC4CEEC;
	Wed, 23 Apr 2025 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413452;
	bh=6NOXLmtGIRXsKgoQuMPbFlY7gnc/c1uKEyPPW1IlV8Y=;
	h=From:To:Cc:Subject:Date:From;
	b=XdUq2DRh1yUr01bxsEBLNEwF3YU88a7N7OQt1rEhA5wjlmD584dj8c6aYEvCwD00+
	 RaatatuyY0s91vWMtxrTVcwhS7DA3US1KVBjUXVdxq2yAXodgD3v4uVuMag8rlr9F5
	 h7hl2iOGp/ukKGdY4mIMn27uFiNusgYN2TbMoicFbuo0/pIPboRFVmZv0Ys/l2nrzd
	 H6tH4vyDjKtYAasXgtLoiCnWGNx+6wd/rzYCJ1HLF8dT9UeEQgDdVzqpoKmToxQnEz
	 e+9j9ZeLnP7rg5rQfdRSJ6fB5M0urGTyjqdBKNYx9zsT3nQBj5dYEcxoaumCHBe+17
	 XfChq8Yb8WXXg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008AX-0Vp2;
	Wed, 23 Apr 2025 15:04:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/7] rtc: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:11 +0200
Message-ID: <20250423130318.31244-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When working on the pm8xxx driver I noticed that it had a platform
module alias while only supporting OF probe. This series drops it along
with unused aliases in the other RTC drivers.

Johan


Johan Hovold (7):
  rtc: at91rm9200: drop unused module alias
  rtc: cpcap: drop unused module alias
  rtc: da9063: drop unused module alias
  rtc: jz4740: drop unused module alias
  rtc: pm8xxx: drop unused module alias
  rtc: s3c: drop unused module alias
  rtc: stm32: drop unused module alias

 drivers/rtc/rtc-at91rm9200.c | 1 -
 drivers/rtc/rtc-cpcap.c      | 1 -
 drivers/rtc/rtc-da9063.c     | 1 -
 drivers/rtc/rtc-jz4740.c     | 1 -
 drivers/rtc/rtc-pm8xxx.c     | 1 -
 drivers/rtc/rtc-s3c.c        | 1 -
 drivers/rtc/rtc-stm32.c      | 1 -
 7 files changed, 7 deletions(-)

-- 
2.49.0


