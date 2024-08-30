Return-Path: <linux-rtc+bounces-1795-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E6966054
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ACB5289811
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 11:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661B2196C86;
	Fri, 30 Aug 2024 11:12:11 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104D518E370;
	Fri, 30 Aug 2024 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725016331; cv=none; b=Kp7le7mD5TsvwTYDnajfSzZAVbdojLJDFsLLkoRGpnlUoyXFr+EC1cRfXsF6Fe6Gwsmt2Z8g/xG95jmgbquO2kbmGeOgfTyrnWowaO6ilt9skFVaMid6zMe+gYW8qFOpX0k+wF5Uj1bdXCqcR+ZayZjQmE+fjQ8NCCGTyb7nbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725016331; c=relaxed/simple;
	bh=ACVRDK5MKKiC/ptkkN4ovtss5KjkflVraIVTd8aCdVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9TjWOVEaqRrj9qXOC2iTuNL15r50a+3I4vgpiKkId0pl9CxvVd8Krt6gEkQrQNT4LfikY95LujMXYMSHFoCVVvSPeVZ2cECHurSvK6YTj1JReBmg5ABbn8SutURtEW1u1gJ3QNsyjVU1UjuurcLonhAf1bLpUKZE03X9+WtLfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 935711063;
	Fri, 30 Aug 2024 04:12:33 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 019D93F66E;
	Fri, 30 Aug 2024 04:12:04 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v8 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Date: Fri, 30 Aug 2024 12:12:01 +0100
Message-ID: <172501620010.2362412.13911228276992325036.b4-ty@arm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 23 Aug 2024 17:05:16 +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager Firmware source: https://github.com/nxp-imx/imx-sm
> To generate html from the repo: make html
>
> i.MX95 System Manager Firmware support vendor extension protocol:
> - Battery Backed Module(BBM) Protocol
>   This protocol is intended provide access to the battery-backed module.
>   This contains persistent storage (GPR), an RTC, and the ON/OFF button.
>   The protocol can also provide access to similar functions implemented via
>   external board components. The BBM protocol provides functions to:
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!
(with various minor changes to fix the build and sparse errors reported)

[1/7] dt-bindings: firmware: add i.MX95 SCMI Extension protocol
      https://git.kernel.org/sudeep.holla/c/7d2b23fda996
[2/7] firmware: arm_scmi: add initial support for i.MX BBM protocol
      https://git.kernel.org/sudeep.holla/c/41845541adeb
[3/7] firmware: arm_scmi: add initial support for i.MX MISC protocol
      https://git.kernel.org/sudeep.holla/c/61c9f03e22fc
[4/7] firmware: arm_scmi: add NXP i.MX95 SCMI documentation
      https://git.kernel.org/sudeep.holla/c/c66beeab7436
[5/7] firmware: imx: add i.MX95 MISC driver
      https://git.kernel.org/sudeep.holla/c/0b4f8a68b292
[6/7] rtc: support i.MX95 BBM RTC
      https://git.kernel.org/sudeep.holla/c/3008598ef3b0
[7/7] input: keyboard: support i.MX95 BBM module
      https://git.kernel.org/sudeep.holla/c/d17baf052cbb
--
Regards,
Sudeep


