Return-Path: <linux-rtc+bounces-4671-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F270B23382
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 20:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF86817EFBF
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 18:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF612FD1C2;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3bqcmVt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB53061FFE;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755023129; cv=none; b=Db/9KHDGO2ODRDg8o7CHyUkiAu3A1PquOOEnAcHJT+j3eyB+eTMQdXBIPTpp3AYAHunKs/NVD4+w7WwNELNCyCTO92qQa/5E1m9r+MiQ4g7HIxHGbTnL/WWL6HxpYq6lAJ8HGcqIhF/Rt2/C0yrw4x8l1XfSVIyCOGwDE9L2afA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755023129; c=relaxed/simple;
	bh=k8kF1P6bFlbBEzuzYgvwP5CIW+2qmHksP+KG9Qod3gY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kxywRzpdhOLJ179Yxahvjv5j0vvLw5+r1qMS7XPmMVHNEdbQd0sWaweycdmRRkCrQblUijpLefTIEWhBN3CqQFMb9CuNz5YYLBc8F9NO5GtTPCd8h9g7rnsTTTbKdpdLw6Dpok+41bL9RXPhzlOzqGlfEZZvEgiEdml1Y88rW7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3bqcmVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D7F2C4CEF1;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755023129;
	bh=k8kF1P6bFlbBEzuzYgvwP5CIW+2qmHksP+KG9Qod3gY=;
	h=From:Subject:Date:To:Cc:From;
	b=Q3bqcmVtxiJ2Jh0zGcNiIt0UfDFVERoCU0runnhyf8hYaqfFyz3y4Tn4qPi4DSl9z
	 yUf6/AuKNMNkO8GBhCQQ/zxwOBnoeIfiViVf8MKDgy9fP+H98HsLKr12rgz1TwNP2n
	 wTzPPcAppZof8iscirsmhcWujjkwbBlnBW1Pvor/F5lhETAErzhSKY80tGbTmktdFJ
	 /8P/2sIitQyf8IJLL4x/ajbD/0LoKxM077jFmKiqpeLjHs38haDtuOFieTu6Gy/Pf5
	 YyDexnO6K5i5DDXF8m/joYBnFCw5KrOp+vVyw0hxxYE2UF+hM0tZlsjebu827LM2Fk
	 7UjQFn1XY+Aog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B73CCA0EDC;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] Apple Silicon SMC RTC driver
Date: Tue, 12 Aug 2025 18:25:14 +0000
Message-Id: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqHm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Mj3fLMAt3i3GTdopJk3VQLU7MkszQjEzMDYyWgjoKi1LTMCrBp0bG
 1tQAIJoOQXQAAAA==
X-Change-ID: 20250812-wip-smc-rtc-e856b6f24603
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=k8kF1P6bFlbBEzuzYgvwP5CIW+2qmHksP+KG9Qod3gY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8bsdiH55MV3rVh+O/X9Tp18KtNRpYD9+sY/Nev/1+ucv
 r3ujdaDjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEAhsY/gee63BWXp5xaoNo
 Xvyps0Y7Izbf/umg7WMtE6pfWR+wLIXhv6cc2zRmsX8cyV9vfNiwjH2Sw2bp8+cctLj9sm96scn
 VMwMA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

Now that the core mfd device has been upstream I've prepared one of the
child drivers that is still missing: RTC support.
This driver is required to read and set the hardware clock and requires
a reference to an additional NVMEM cell to store the offset and thus
requires a device tree node.

The series applies cleanly to 6.17-rc1 but is based on a tree with three
additional commits to add the SMC nodes to the DTS which didn't make it
into 6.17. You can just ignore that and pretend this is based on
6.17-rc1 since I'll take the dts update through my tree anyway.

Next to this SMC child driver we're still working on an input/misc HID
driver for the powerbutton, a hwmon driver for the various sensors and a
power-supply driver to manage the batteries.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Hector Martin (1):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../devicetree/bindings/mfd/apple,smc.yaml         |   9 ++
 .../devicetree/bindings/rtc/apple,smc-rtc.yaml     |  35 +++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   6 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/mfd/macsmc.c                               |   1 +
 drivers/rtc/Kconfig                                |  11 ++
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-macsmc.c                           | 141 +++++++++++++++++++++
 10 files changed, 218 insertions(+)
---
base-commit: 772c260c9c7f916c9a2508839df4f03fc19f3773
change-id: 20250812-wip-smc-rtc-e856b6f24603

Best regards,
-- 
Sven Peter <sven@kernel.org>



