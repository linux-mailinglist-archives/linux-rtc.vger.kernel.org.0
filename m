Return-Path: <linux-rtc+bounces-4910-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20449B59106
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 10:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0B373A99FB
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E9B281368;
	Tue, 16 Sep 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlFRX2Vc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B89199939;
	Tue, 16 Sep 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012157; cv=none; b=ae2TVyGl1uWkLgxBK9nZ+rXOF5yllX8TVVIpktqcZ/lx0vXpB1x+5Ih925YXU59WHeuYuBNHXruRB0cJgnNwX8hFXQVS5UiA0a0vSmid0YYXDueADas2z86+rE9ml2yRypuhpItieaM75TRmJYm53EILbm1r7u4RhYuJR42Qgo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012157; c=relaxed/simple;
	bh=Bl1MY5OuaiV9uMoemCCpSfrqbhrtez3QSsqsaiBhMUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3Hr/DiPTYmaqnnzqRWhoMXpGvWUoGmo/C16OLoBzLvfu3CqTNUEe/xLgut2ps9FQDHe9kB+BtX6LxVSqtE6UXEpsschEZVkgQiv2xYNkODBJfoe/FAySkGOz8v/vf8PgPsPusLIZ4x8EDq3anRGzvlq28mEwBhvs9pCvIDr2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlFRX2Vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA44EC4CEEB;
	Tue, 16 Sep 2025 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758012157;
	bh=Bl1MY5OuaiV9uMoemCCpSfrqbhrtez3QSsqsaiBhMUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlFRX2Vcd+embOSWbj6PKxqD12prWgZVl+2xsFYl8+8r/SOni53REHSYvx6E0/6DF
	 PazYsZ3pMD9SsNDQJOfCYutZjDFvXuSYbomW/zvvLbRw1dJZI4sKBBrQbE4GA+0ouW
	 qMzvJA/h68R6upEgiC7h5SsXzAL+EPZR4wkyc8vvzkIudNi2e1ueV40E+WXKGTmqwW
	 etr0gMdFsgmCNrWlBfVPHM4fFZvHoDFA5a7Wu3h0ysxbq9+xTm/NnHpTLqwctkgHSF
	 IdLuyQFWGbcEI2K/+0ZMv71W5Xh5qOb1sTzyMgzoFp8NxtA6OTG2yqXE2WkrlJfKw+
	 5uzpWJ+jWnplg==
Date: Tue, 16 Sep 2025 09:42:29 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250916084229.GG1637058@google.com>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>

On Thu, 11 Sep 2025, Mark Brown wrote:

> On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:
> 
> > That leaves patch 3, which enables regulator support, and patch
> > 4, which adds RTC support.
> 
> > How should these two patches be merged?  Mark has reviewed the
> > regulator patch 3 and Alexandre has acked the RTC patch 4.
> 
> We'd both have been expecting them to go via MFD.

Why?  I don't see any dependencies between them (usually a shared MFD
header-file).  If there are no deps, it should be taken through its own
repo, no?

-- 
Lee Jones [李琼斯]

