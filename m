Return-Path: <linux-rtc+bounces-5089-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8ABD6D20
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Oct 2025 02:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D14824EC126
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Oct 2025 00:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF791CD2C;
	Tue, 14 Oct 2025 00:01:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D671D6AA;
	Tue, 14 Oct 2025 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760400119; cv=none; b=H7g18SsZLDQCFj3fjKEwcRLf8OML0L+3uzzUA1BxrnflVcE36eGN2Fn6HdFjvHgNPp8sQ8dITaALMvzUMgGZzi5bsqmlz5FX4M4ac75aRaWhc260sO0WBTTU1sMF7yXQTWD74iwcmCUzb3bcu90xhbuf+cSf3hRcZV3E1ASEvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760400119; c=relaxed/simple;
	bh=+vUFipcYIXgXpqA9AhKG0GuuSmvhuP8nc/YpFn8bR3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jq71+xaa2/ECtPd66JHjLCOr1B7XBYCOqosGyuvtGt83velJfTMYo5/2o41alXd1tsEYZbTrSfqF6T2Nu1uCmuajluqU0dpO0D9HqPbPE0QuoLvE0SiDwpOFqLpjcoSFfzxQsfkAYiBTMlY3r3ZbXQIzry70XBsrEYuplhq4Swc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.147.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 10150340E58;
	Tue, 14 Oct 2025 00:01:50 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	mat.jonczyk@o2.pl,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Date: Tue, 14 Oct 2025 08:01:45 +0800
Message-ID: <176040002491.864314.9564488018549093381.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
> converters and 12 LDOs.  It contains a load switch, ADC channels,
> GPIOs, a real-time clock, and a watchdog timer.
> 
> This series introduces a multifunction driver for the P1 PMIC as
> well as drivers for its regulators and RTC.
> 
> [...]

Applied, thanks!

[5/7] riscv: dts: spacemit: enable the i2c8 adapter
      https://github.com/spacemit-com/linux/commit/3e8d7309e6260b1d066e733bf3e2e1b6a0d3f82b
[6/7] riscv: dts: spacemit: define fixed regulators
      https://github.com/spacemit-com/linux/commit/1df07a40453fd652132051419140950d47941fe9
[7/7] riscv: dts: spacemit: define regulator constraints
      https://github.com/spacemit-com/linux/commit/09a412d397484e76588707d85ccc37f71e491091

Best regards,
-- 
Yixun Lan


