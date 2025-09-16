Return-Path: <linux-rtc+bounces-4958-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC8B5A455
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 23:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54C3F5832CC
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 21:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB182328569;
	Tue, 16 Sep 2025 21:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1auR8Pt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BCF31FECA;
	Tue, 16 Sep 2025 21:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059656; cv=none; b=hxcJ9AVHAVgFILMRKMIaV8fA7WGkyKrY3KowrnxRT2xRk7iwE3DOyxW34q8P+V85wPGn36cPHHIU2/KmY3dEve2Im5P8GGKxh9+qOnmyDpKYkoe6Bq9SLwVi5WdiJ6vVNUC+nGRi8RYWmyslRkejdUbfx9tospuCZ9Af2ZLfXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059656; c=relaxed/simple;
	bh=uD2qX1Uel1p/YrCYZ0w2oIREUJEihLSaGL7baU3SX04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SAwbJ9zL8ae+HMMU9tG/DNxyJyRtJ6fJt9h3b963tNJ1Gcq5Q6mYC1VorVRgy/mAxuzu5htO4V+TUbNWyk+BYVbxVYW/345xnZwFwrCWYup+A0j38i6+kuEaDwetnKmdd3yeDcsKeM4s/4mUCeMyS7yFY3il/PnZq/lGoCHALo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1auR8Pt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61614C4CEF9;
	Tue, 16 Sep 2025 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758059656;
	bh=uD2qX1Uel1p/YrCYZ0w2oIREUJEihLSaGL7baU3SX04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p1auR8Pt42Tym0qXlywjGsGpI7yOQUKBihw+ZbyLwgwqRAcacfgBwNuNLc4IpdXkB
	 j//1lYuA63R42y7IpOA3LzEJhiOVRxeijucpj8mpDLBqBRmEflGhUZQwrQ+hamHwzO
	 LBPqBYA2gNOACgVcGrhRZ20m32MvlhFAIis83zXBz6nzuaqglL/TUD3q5lea0tY3AQ
	 OUEPZs4Gazbn5xpjYCQm7oVQyrkPNE/ZdbxeZYwSjJu+SnFJUduaSRhfoFtDusmlmt
	 zLUszYZeaxYao3yCC/7bl1Wa7I2TVFXYI6mvpPuFFM86yyUNRhcnKzrahsoAD9MejF
	 J2vy1PjVIKDqA==
From: Mark Brown <broonie@kernel.org>
To: lee@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Alex Elder <elder@riscstar.com>
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-Id: <175805965212.251163.14858159964329617503.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 22:54:12 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
> converters and 12 LDOs.  It contains a load switch, ADC channels,
> GPIOs, a real-time clock, and a watchdog timer.
> 
> This series introduces a multifunction driver for the P1 PMIC as
> well as drivers for its regulators and RTC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/7] regulator: spacemit: support SpacemiT P1 regulators
      commit: 8b84d712ad849172f6bbcad57534b284d942b0b5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


