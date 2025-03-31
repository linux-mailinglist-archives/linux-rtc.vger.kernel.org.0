Return-Path: <linux-rtc+bounces-3706-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D452A7601F
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 09:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3BE61682FA
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 07:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C581C5D77;
	Mon, 31 Mar 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA7vlAxJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394861C3BEE;
	Mon, 31 Mar 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406474; cv=none; b=GsZ09ZEz36ZNro6YuEJcJ5e2qrhgomAbBdS18IgzcBdF0SCFIFRTuklgX/QuSi3izSvhyG873GVBfS5jluiYwXOZaydXfye+6H2FD//cVsGBqUO8+6p6HUijoN3oLIOpDEwd0Ss2BHjnUt7l5OTFXLWTZlDTX4miO/Z4Evt0sbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406474; c=relaxed/simple;
	bh=tGc0yZ9S56lmGZ8X3yzmu/RRoHPLD+50b87kiWJPefo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXavvwHUz434sCQ4vRUHUs8m5ZWxYv5P7TLp4VO2xHpgB9bzBvqg4GxSWlYEnFKx8tC8oxjbrLHrxxq4GoKd8QrqT30JjM31vctmMXxNWFt0B4YEQV2WvqzvzWDDHOcY9XuuKGgokYiGAi3EXRaB1ELlbmkM4PBjlHdGyzws1bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA7vlAxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2EBC4CEE3;
	Mon, 31 Mar 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406473;
	bh=tGc0yZ9S56lmGZ8X3yzmu/RRoHPLD+50b87kiWJPefo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JA7vlAxJVj2TwXGWhCabmFcSVxMEKKF3aRsKpopNTz2ticno+FLbcLVgFcmtf0Vas
	 By1vbkN+enGJyD3jRzncriHofarLHaGjIhoFKZyShCdI5FtUWgrXcSXJsDtDLfDrQ0
	 uc9oOBml+OtZAGgKPKGXE/aCQjL40uyFJfZcD2jhzFITcAe1IHQBckm7qwXfEUD49l
	 ON3EokiRJBeugtYhk2p7WaksPBaPuPVH9drZe1+KBb+NISycPFJoLzFPTzuyyTTTcG
	 U4ZMY5iPH/D8YR+QspDyTmmZG7d7IgiU0EGZx+X7xuBhF+RtBvshoTqg2ZsiXzF7vo
	 ckgiVFefF4O7A==
Date: Mon, 31 Mar 2025 09:34:29 +0200
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
Subject: Re: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Message-ID: <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
 <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>

On Fri, Mar 28, 2025 at 01:28:47PM +0000, Andr=C3=A9 Draszik wrote:
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s2mpg10-pmic
> +    then:
> +      properties:
> +        reg: false
> +        samsung,s2mps11-acokb-ground: false
> +        samsung,s2mps11-wrstbi-ground: false
> +
> +      oneOf:
> +        - required: [interrupts]
> +        - required: [interrupts-extended]

Drop, you should require only interrupts.

OTOH, why regulators subnode is not needed? Commit msg mentions they
exist, so they should be required. Binding does not change because you
added or did not add yet some driver support.

Best regards,
Krzysztof


