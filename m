Return-Path: <linux-rtc+bounces-4452-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD2EAFFE2E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 11:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B979A7A5794
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC662D3A83;
	Thu, 10 Jul 2025 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlkHEVn4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED11E505;
	Thu, 10 Jul 2025 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139901; cv=none; b=ItEh3V7Oy0CqU6HpVdVPdmnZ4i7xke77bLR04U4+eaSsPnFZKrldSiyEzB0c20O5kxDKzLYlZ1hW85jh5j+SiWCfe8potpvqcgrysj/3iYyK/yfNhkheKG1OWRN+otBloAox6orY1Bo/9bPNIVWkiUPyGvLZJT84574h4xWrd5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139901; c=relaxed/simple;
	bh=K8hqorRx8RHxWxh+27NmExO7IYTxx5BVjkb0dKupVi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aklaMlOyJh/Y/ox3h9ZWJm0vEpBSMT8kcBptw3Rujo8JzneGJVFJLHP9gG/y3GJ88Q0SyDNJXTEQ60rQoLnHLv11oCHPlGmAfnXh15Qmj2hXCMeU62AkypMSjkocOQXWTFlBbMp8kDv7LVahyO8fxAcCjsscp3IZcYyPrtN7SjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlkHEVn4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574A2C4CEE3;
	Thu, 10 Jul 2025 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752139900;
	bh=K8hqorRx8RHxWxh+27NmExO7IYTxx5BVjkb0dKupVi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlkHEVn4rQlewMGM94eJQB8J2VR48tnfHqRAPrYW+UpusGYMGhw7hs9ewCfgpYZLa
	 4D/fEZ5VA4mQrQUgPVyQ0er3BM/VNhBoy9F2WBFnVZE1kycbFBIoDPkCzdG+RZ+r3f
	 5hqpd9D8oc1YH7rKDG66IEsOShdPZf2/mSQJrVrvwSYhVVyLEBCk0Y8Duw3tRpmKa5
	 pkZAXItVKeWEaeVKYq7+TkAwk0sCtHNrmDQGaE5LK52PdjredG/5auKJiK3yEzQUxZ
	 HXaFSyA+AIW7Z2kzGY2PosktYEN8Mdh7phTKf4ua4Pz3eDPz85JY0YQPD2l7RLWTUN
	 M8P3SBFzyRDsg==
Date: Thu, 10 Jul 2025 10:31:34 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <20250710093134.GC1431498@google.com>
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702213658.545163-4-elder@riscstar.com>

On Wed, 02 Jul 2025, Alex Elder wrote:

> Enable support for the RTC and regulators found in the SpacemiT P1
> PMIC.  Support is implemented by the simple I2C MFD driver.
> 
> The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
> PMIC provides 6 buck converters and 12 LDO regulators.  It also
> implements a switch, watchdog timer, real-time clock, and more.
> Initially its RTC and regulators are supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/mfd/Kconfig          | 11 +++++++++++
>  drivers/mfd/simple-mfd-i2c.c | 12 ++++++++++++
>  2 files changed, 23 insertions(+)

Looks good.

-- 
Lee Jones [李琼斯]

