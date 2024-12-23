Return-Path: <linux-rtc+bounces-2753-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E09FAA3C
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 07:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B957B1883556
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 06:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EDC156C6A;
	Mon, 23 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exURVkwc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF9D3987D;
	Mon, 23 Dec 2024 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734934881; cv=none; b=gUZRDktXerfh1e6/dYQ3k8IBDiZLqlYrv+fzRTnSsgscAPXoXimG4hPWBV8WRALtasAANmhPayaTVrcUYWHLwP06MH4a+nFZgP38zughzd6Ljm9SNIUxGuaRJUYF7gO/qFRb31pBT6F1LOI6+8kjqrCIToMwK6R0YqDoSgQKAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734934881; c=relaxed/simple;
	bh=BUoyR5rCkmanl4wSU8ZX2PoK3BmpB+33e48XNgyU860=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kh+rSRE92AE2Bmn5q+WkuRD+Gwza0Nmcw2OgbgO9eLwcfLZU7iwK0D+VogCa6sdqGUVnr+6zx/NTRKNuCZzErcucHeSJIc35j48Ou6TmyBUGVs3ph9kV4VWLfLiKe1/I4AiamiefnQSBduWdMkXStuBRo0GEIwemFqJSYc8h/Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exURVkwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C754CC4CED4;
	Mon, 23 Dec 2024 06:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734934880;
	bh=BUoyR5rCkmanl4wSU8ZX2PoK3BmpB+33e48XNgyU860=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=exURVkwc6Za/otbgVtQ20IpGmJeDZF+QmMIyBRj3N5ym/f30VCxUrRDuVoGRO4iU5
	 v7ViyCJ3lx/yq86kUq6I37xiU+49xKj0NCG4iM5+pN9aG96BbY5An5IKOZcspJHEua
	 4xh+wC+8OPMJx4PiQAxpvVeNSEQJSGKq5PD96/fCmqaL6RYXD0ududOwMsf9G6c5Zw
	 buHwFdTfFKN/uVubM/1E8lxZYmn7dVZhT6zEsgEIqzXg/2S00Ys1VN3L2oXgBcW0xm
	 K/B8wFHXa+LgwH493z6sqmN8pUERiTsXCaV7s+iOpe5Q3QND74U+AdhTbHBlXGksY7
	 CS3PxWFcYV1VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B88E7718B;
	Mon, 23 Dec 2024 06:21:20 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Subject: [PATCH 0/2] Subject: [PATCH v1 0/2] Add support for MAX31331 RTC
Date: Mon, 23 Dec 2024 11:57:43 +0530
Message-Id: <20241223-max31331-driver-support-v1-0-f9499bd598f5@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8CaWcC/x2MQQ5AMBAAvyJ7toluCfEVcShd7AHNFpGIv2scZ
 5KZByKrcIQ2e0D5kij7lsDkGYyL22ZG8YmBCioNkcXV3dZYa9CrXKwYzxB2PdANVdJNPXrykOq
 gPMn9n7v+fT8pEnRMaQAAAA==
X-Change-ID: 20241223-max31331-driver-support-ab513387cd2d
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734935277; l=874;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=BUoyR5rCkmanl4wSU8ZX2PoK3BmpB+33e48XNgyU860=;
 b=Q2IaHBVCkh3VTYh/vVW7NIUlHEQyv1IjmAXaVrVlGqZ5jBpSxjtx/3NBD6wta5UuRSC+8ViOq
 cAdkpDH9WS2A6Gw3/yn7/eigZWRcfcp+LgYoRS0V1ELepyWLuzarRgA
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

The changes have been tested with hardware and verified against the
YAML schema.

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
PavithraUdayakumar-adi (2):
      dtbindings:rtc:max31335:Add max31331 support
      rtc:max31335: Add driver support for max31331

 .../devicetree/bindings/rtc/adi,max31335.yaml      |  32 +++-
 drivers/rtc/rtc-max31335.c                         | 184 +++++++++++++++------
 2 files changed, 158 insertions(+), 58 deletions(-)
---
base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
change-id: 20241223-max31331-driver-support-ab513387cd2d

Best regards,
-- 
PavithraUdayakumar-adi <pavithra.u@analog.com>



