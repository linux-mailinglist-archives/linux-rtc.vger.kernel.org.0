Return-Path: <linux-rtc+bounces-3786-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECFFA7BC54
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 14:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC743AC0B7
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F951DE2BB;
	Fri,  4 Apr 2025 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFLqO46q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E81B413D;
	Fri,  4 Apr 2025 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768518; cv=none; b=U+Eho6Fwh+DtUi+09Z19qk0PoosweQIlWgaU7SGAn2RJpIE6qtuA9cubcy2JTkCrWpbcqC7KWwmPyxVwjWjIpJL8pVJ0d0MI866JLCysHR3lcm875/l0NvFGT9tUxygSnwB6cE1DzH/ZdEu295OgMQN540Av9MJQRGnhZkiEPKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768518; c=relaxed/simple;
	bh=YdHMq7LpSxnzaV5xFDzRfBdfqAFUXaB87w78k1Zf55k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V456ISxWYDSiFXN7+7/a8psOMKLXWDa3ytNQv4IZPyeHXmoH+6sMF+9ZVJWgOPw422zbgaI03yAQ80GJAx706SvnTaJ576b9f0GAMZjhFf5kNF6MelTVoelndA9XTk7Lucbhl9KNiOEos9Iz10vzdbW79Bbvzr6WpTdAA5nWPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFLqO46q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092C8C4CEE4;
	Fri,  4 Apr 2025 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743768517;
	bh=YdHMq7LpSxnzaV5xFDzRfBdfqAFUXaB87w78k1Zf55k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFLqO46qB/dwPEQryEUhMXWB/7rpUbc5qxcg2PrUg3KYQ9v9JwLFDlE45GE/zWqYJ
	 +yUElDSQZZA8Xrv9WO8oCfMBSOlPAJSQhON1twit6A3QLxwn6JIE09aT4/c45juiLu
	 4sezB90vsOW2oe1m2bY7y1l5vQ9kGZHnJxw1sVYhYW1WdwJeQag9sPANRXrwuGV8J1
	 h/muXqstxLALLhO0y34ZakGJVGzfFBQBYDkp+sfaVlJBM24nWVZ2t7e8J5JuQOh7ST
	 qIKlR1jFoQ0OWe9wQwztolfAzZYUN28q9KFGAYX4XZt/Jm4w61rY8z2p3dn7orPzS1
	 2aRyNjTNqQyLg==
Date: Fri, 4 Apr 2025 14:08:34 +0200
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
Subject: Re: [PATCH v3 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Message-ID: <20250404-fanatic-numbat-of-vastness-3afc8e@shite>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-1-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250403-s2mpg10-v3-1-b542b3505e68@linaro.org>

On Thu, Apr 03, 2025 at 09:58:53AM GMT, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
> this binding.
>=20
> It is a Power Management IC for mobile applications with buck
> converters, various LDOs, power meters, RTC, clock outputs, and
> additional GPIOs interfaces.
>=20
> Unlike other Samsung PMICs, communication is not via I2C, but via the
> Samsung ACPM firmware, it therefore doesn't need a 'reg' property but
> needs to be a child of the ACPM firmware node instead.
>=20
> S2MPG10 can also act as a system power controller allowing
> implementation of a true cold-reset of the system.
>=20
> Support for the other components like regulators and power meters will
> be added in subsequent future patches.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


