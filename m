Return-Path: <linux-rtc+bounces-4622-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE133B17533
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 18:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B34D18C01D8
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 16:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754F21CA07;
	Thu, 31 Jul 2025 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPXGXw+s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59FDA921;
	Thu, 31 Jul 2025 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753980414; cv=none; b=CBlwggY09J4vi9RgRCrvZbZl8PJvSg/hcFzR8q6fumfStyprrFktY7BIGFOHKC8oDLiYNV4egE+i0RY/nRBihc9tz107WsXiSGfWZUVtXnF34bs7RBmft0gI0v/wd3xRvYLeXiejW7FK2j5Men1GR0+zI/IBEv/g8zseQO+nd6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753980414; c=relaxed/simple;
	bh=nWnE0BuMLT8kWS1iBNxdI5fCsX3JKkXaj3S/LVk43S8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RBS0da45HfdjFgvw6ArMBJtUwDUmQ1k4PgVArU4kelFi7Qv09uvyKvznjhp9T07s0xd/LNmG0al018M23n8DTVpzK49THQC6WI45QBHnPl0/inatEf+ouzOq7TywUHLGpr/TP8YpqiJDudQUBXso6b5PjcWGPUKU/c0Gt87stBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPXGXw+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DF4C4CEEF;
	Thu, 31 Jul 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753980413;
	bh=nWnE0BuMLT8kWS1iBNxdI5fCsX3JKkXaj3S/LVk43S8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sPXGXw+scJs3C7UZI/DA7MkT8ZN7ufgUcQDo6OoT3wd0tG1XIxdEmW42mDTr2FwvB
	 +g2toyhn+m4aah5rzF3VTaYgwwnfqkAUadACT2JKaGyZoyNkSAengCkwSnWhj089yJ
	 KRLUQFV8aP3CfE6SS5dlWSxgtaAwf2DyO0uuJvY5Mg9t6FgEUvQEqLETVtBmGG4LVE
	 FAy5pKc8Lv2IS284454L5lY1pw78sQaMjs1qNnoExK+AbO43poml56YaYA2ZT0WZJ/
	 0uveNgKYd+S2bTIiBTMYW7opEXNGfiiklXc3bTfggoVvJOq11Kxa0M3sB9m6ZRGo0h
	 oQmOrF2fr/Qag==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org> <20250730145100.GA6782@google.com> <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>
Date: Thu, 31 Jul 2025 09:46:51 -0700
Message-ID: <175398041189.3513.13629420060562627196@lazor>
User-Agent: alot/0.11

Quoting Andr=C3=A9 Draszik (2025-07-31 03:20:56)
> On Wed, 2025-07-30 at 15:51 +0100, Lee Jones wrote:
> > On Wed, 30 Jul 2025, Andr=C3=A9 Draszik wrote:
> >=20
> > > Original cover letter further down.
> > >=20
> > > This is a resend of two patches from the original series that haven't
> > > been merged yet. That series was merged except for the attached two
> > > patches here. Other than rebasing against next-20250729 there are no
> > > changes to them.
> > >=20
> > > Lee, I think Stephen's intention was to get these two merged via the
> > > MFD tree please.
> >=20
> > Although I have no issue with this, it does seem a little odd now that
> > the set consists of only Clk patches.=C2=A0 Let me know what you / Step=
hen
> > decide.
>=20
> Thanks Lee.
>=20
> I simply went by Stephen's ACK, which to me implies he wanted it merged
> via a different tree (mfd). I guess at this stage it doesn't matter anymo=
re,
> since all the core changes are in already.
>=20

I'll pick it up after the merge window closes.

