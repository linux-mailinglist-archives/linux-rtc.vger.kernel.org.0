Return-Path: <linux-rtc+bounces-4864-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EBB53526
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 16:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D46A1CC04CD
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 14:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0642F0670;
	Thu, 11 Sep 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dU+ImchE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC1225A24;
	Thu, 11 Sep 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600539; cv=none; b=C3NhDLQ/x0ZIB/Cm/GHuu6pKkvR9ttmLpSUV/Prg1XZLt5g0aqvioD4aWcuoSxT4Fs1L56Cjv1SFRX8WyeSGmzBbDhCbKub2OOO4LPpcYdLNVvpLRHgZqhRqUYHwFO2UgA1V3gfE832dPH5Jj4i89M8nYDXVxX3K4Ay+rbdo9CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600539; c=relaxed/simple;
	bh=/eSsKJUdBk0CoFjKjVLmoT47KRRAQafbOUn3OAvKreM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnvsE1avQjiCi2rsP/0laTaPeExnoMc+BQPFvuW1bk5igUr/HeIAuaKz3uKG4YssIAdld4+bHUg9Q6zpG6d1ZFwPiDBl83He7WNYJThhvHkQgYK1YToa3iv3ypvSsnBlJ1Iczp08j62+2MueZfkKr18u04Jsf2u86KBjqPYuWmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dU+ImchE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE70C4CEF0;
	Thu, 11 Sep 2025 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757600538;
	bh=/eSsKJUdBk0CoFjKjVLmoT47KRRAQafbOUn3OAvKreM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dU+ImchE9K2jDSnnlluwwypo2kGIbRjtSzRkXO9I/HYThiF03ZRREoGI54Ckl4h44
	 2MEzGOVWfx+xUPdKEDMM+c87RYJAJZn/8UyKjuIw/Ce13hiYlk/dlSPZFud+DRh5Ry
	 LtiJNWedgotSn1o6eZmOtmJP1Ht9aN7VGRyE91bD6A8JWtrXImGUB1syGQtJQmJq2m
	 9dUu/hJWVSn5mF/RoAh7/upsEDfpzFN06KlCUbXLZGaq3dikWcElm0l4IyNQ4KxwOz
	 65gPdKIe9GW0aqn6Zp0wXYxxJMiYcG9JJrD8isRO9bBR0Bsj6YaqmNZm4Yud5nn7hf
	 kKh5Gvp/uRbYQ==
Date: Thu, 11 Sep 2025 15:22:14 +0100
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-input@vger.kernel.or, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Input and RTC due for the
 v6.18 merge window
Message-ID: <20250911142214.GJ9224@google.com>
References: <20250811064358.1659-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811064358.1659-1-akurz@blala.de>

Enjoy!

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-input-rtc-v6.18

for you to fetch changes up to f0addd325ef692c92c522a2ba4d9db13fc90e664:

  mfd: input: rtc: mc13783: Remove deprecated mc13xxx_irq_ack() (2025-09-11 11:39:31 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Input and RTC due for the v6.18 merge window

----------------------------------------------------------------
Alexander Kurz (1):
      mfd: input: rtc: mc13783: Remove deprecated mc13xxx_irq_ack()

 drivers/input/misc/mc13783-pwrbutton.c |  1 -
 drivers/input/touchscreen/mc13783_ts.c |  4 ----
 drivers/rtc/rtc-mc13xxx.c              | 13 -------------
 include/linux/mfd/mc13xxx.h            |  6 ------
 4 files changed, 24 deletions(-)

-- 
Lee Jones [李琼斯]

