Return-Path: <linux-rtc+bounces-5020-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEDB9A8EB
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 17:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E9B4E2894
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 15:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C918311597;
	Wed, 24 Sep 2025 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g04uL4JU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A5430C620;
	Wed, 24 Sep 2025 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726817; cv=none; b=ioOcCrt0fWejrgw5dEvx8c4hGYF72zqeNqQA12VGaqLpS9kE5ySbfd0oZNaIu+6fRIDYpvOwUtF4U4v15p1FNePPpTuRYVDaq9YH5ce0Y3u7TEgdrlxm1R6jqLQU03/CPF+g6fQVWsxW0H1cSUoE/o3frravRcQR8DjXgkfCBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726817; c=relaxed/simple;
	bh=s2qfn94SlY+UvOSljIsVgk+OAzaOjIoetxODklp/Das=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtORgZtK/CqPNVozz6AipZjYR4RAJjiQ69moRqS2tqPJiWumiGRCruZ790NH613SnDy5cboAGl/SfDIZ8VxmDQI+skZSd9mIvknbCX2h/U2mVT80dZo9vnuxVH4Ep6P8jqxUpNVoIvXaXApLuU0XxC0V9pB0qJr70HA436eyymw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g04uL4JU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB19C4CEE7;
	Wed, 24 Sep 2025 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758726817;
	bh=s2qfn94SlY+UvOSljIsVgk+OAzaOjIoetxODklp/Das=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g04uL4JUCKMgCh0ZAWicvkae9tg3f1dtf9y205F246OGcimskEEyEboyz/nuSwxmQ
	 CTmsj+SAtAay0Dd5WKeRKWJqSHDE+bhEPXYMHpcgrkmovxrGRx5ttu8aVRfSqsZlAy
	 hKG823rPHSEkLDswbM3wwsl8M77/2mqpooyob+tkJc+DZiXB7drKFOnX0Dysy+YyH9
	 0fw9B3OYdKx9aSrsDShsTDzDvfa6FlXRKfChxmMjgPFJGkurg2xGfVYCvRhkH9bRkH
	 DB8bCiKEJKbFwDlOyKgOx/ABdW0neA0oiHzOmgeWUt5MRrpxBcA4pZ5vXGrciu66Uv
	 t9Jb+QQFLbvwQ==
Date: Wed, 24 Sep 2025 10:13:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: samsung,s2mps11: document the
 S2MPS16 compatible
Message-ID: <175872681544.1729352.11953063971990537897.robh@kernel.org>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 15:42:23 +0300, Ivaylo Ivanov wrote:
> The S2MPS16 PMIC, alongside regulators and an rtc, provides 3 clock
> outputs, just like most of the other S2MPS PMICs. Document the S2MPS16
> clock compatible.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


