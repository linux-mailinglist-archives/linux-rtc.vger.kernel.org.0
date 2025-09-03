Return-Path: <linux-rtc+bounces-4799-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD7B41EC0
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630BD560274
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 12:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F34B2EACE2;
	Wed,  3 Sep 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTkiMoiN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C2D2EA48F;
	Wed,  3 Sep 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756902004; cv=none; b=kHCa1Qvtoz/ERqRf8fJegEDp7KiNQ2uavfNcNLGwe7CI2642UuEY/RgbtD2k4IVwfCFoWpLeMDid2DPRpLh/BG8zbDtKYqauI84tytZh1qeVhzyTgmKD6wdqIEErbeEqs3bendmKoBqScS9TrVWp2S+ueOR6MxBPdN5G5ZTIDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756902004; c=relaxed/simple;
	bh=9URczS0VB9EctpFDAS3hOzqSsUg9Ay9Qy/aJrO0mPYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IX5wxh9S8P5F3wlMwCC8fMQGJMQVriv+Kw0bkuFluwt+DXi3P8QLZd1IE8SthD1pyjS7ihOlSTZyywG8A3rvUR9pYKjyL9bLwbnEkW+yWC71iUbmazmiqAcN+nPstjbyem08E1H+03hqOon25fT96G8mcWkmim2NVkO29J4hxuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTkiMoiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B4EC4CEF0;
	Wed,  3 Sep 2025 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756902004;
	bh=9URczS0VB9EctpFDAS3hOzqSsUg9Ay9Qy/aJrO0mPYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HTkiMoiN1rQZ4wOADiWn87Zuy4gLl1coCPzfJHA+8djXjpUPYvHduqErQgjNZH2ay
	 hJEZTTq4V9WJfS0Bfs0shTkUSV+xwrktlesKwvV2JeF/97YzyIuIFrHPKMvCmiYq7y
	 eJvqF4KKq+TSgmH9m/E3Hf7uPG6Pfzsu12NiIg1Akqn9OKeuhVAXunRhyzL9OxZI61
	 hjOaSy62p3yjoUadBNHgQewbvz6AwzkUkyH/5c76+AghzLQcgTcY33UprXzkijC2sY
	 0Q8Lm63wP+d3ohyCDhHNiTVjACXY/LYUAc+/HORDXy3gRGuW7cYXNd/Jfay8uDTi4b
	 h4sXzod/zJiFA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Alex Elder <elder@riscstar.com>
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-Id: <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 13:19:59 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

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

[1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
      commit: baac6755d3e8ddf47eee2be3ca72fe14ebae2143
[2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
      commit: 49833495c85f26d070e70148fd9607c6fbf927fd

--
Lee Jones [李琼斯]


