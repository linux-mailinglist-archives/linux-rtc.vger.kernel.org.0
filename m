Return-Path: <linux-rtc+bounces-3787-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A7A7BC5D
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 14:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4D6189D728
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 12:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63331DE8A3;
	Fri,  4 Apr 2025 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ev9RmMqf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70470155CB3;
	Fri,  4 Apr 2025 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768596; cv=none; b=iSU+mbFpQ0ohOUZq6Fdn22IVLTwmVqbyMDILGuQVvNsc9gMY2+c+E3KOn8O4wOvT+a5mlBufWmyTpzEPoohBWYdBwKcXXPfuHitOQtm90lq7TLjr4r4IEoJnzIs8YEbCKyY2NyHyBYq6E17qmtg4aZK5AqxGB9CJR5d0gb31NTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768596; c=relaxed/simple;
	bh=wklgCHdEkZc8IgfK1ledIFfG+/zA4q5CE9+JLRTrhNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUJw5zmx6a4D8zYKrjUlYEAY3FwIoNyTgYBneV5yupzFUTk/wFv8dpYnjn2ED5LqgBzbE4srHNzcSTtyaLcICs9uEx19YReISW41ezVTbxb5CNwax/eyZ+D//7oILqLbSetL+/QTKVlXo793IKBvIpEVF103qrDejinrW9/HDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ev9RmMqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516CBC4CEE4;
	Fri,  4 Apr 2025 12:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743768595;
	bh=wklgCHdEkZc8IgfK1ledIFfG+/zA4q5CE9+JLRTrhNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ev9RmMqfhL/elbuW7Mk1wSG8cFGsdTVP0DlovxjTUBEexSqhtge975qEFChTHuWSd
	 DwaFwP+oH8Wx9OakYlD8Qkfm0k6jOofcvt73HY/gVOeL664BcMVbLmAxKJ1gRcV242
	 mjO4GdtG4Ql1aTWCrpPSgSnLjLq+pR0EOUlm/B5s+g9JGcEhj59RhP5zoctzLxZ/IC
	 4rXkKEcLzzMPh1f2koJqZ3EJhBEmQp22ugbrh9wZfdRpwDDheVeiU0IFSHxed1NZkZ
	 x7o9Wn127Tcyrq+TpVy3oE4ISB36dPm73+5KLZPey446OENxrRFSxxZ0COwuJCEScH
	 aFxV2c1djmPuw==
Date: Fri, 4 Apr 2025 14:09:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 03/32] dt-bindings: firmware: google,gs101-acpm-ipc:
 add PMIC child node
Message-ID: <20250404-agile-thistle-albatross-6dc93b@shite>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-3-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250403-s2mpg10-v3-3-b542b3505e68@linaro.org>

On Thu, Apr 03, 2025 at 09:58:55AM GMT, Andr=C3=A9 Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> v3:
> - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
>   'additionalProperties' instead (Krzysztof)
> - add some regulators to examples since s2mpg10 requires them as of v3
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


